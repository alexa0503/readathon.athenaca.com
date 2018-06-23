<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Carbon\Carbon;
use App\Activity;
use App\ActivityLog;
use App\PrizeLog;
use App\ReadingLog;
use App\ActivityUser;
use App\ExchangeLog;
use App\User;
use App\Item;
use Validator;
use DB;

class LogController extends Controller
{
    protected $class_name;
    
    public function __construct(Request $request)
    {
        if( $request->input('type') ){
            $this->class_name = '\App\\'.ucfirst($request->input('type')).'Log';
        }
        else{
            $this->class_name = '\App\ActivityLog';
            $request->merge(['type'=>'activity']);
        }
        $this->middleware(['permission:比赛管理']);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $class_name = $this->class_name;
        $orm = $class_name::orderBy('created_at', 'DESC');

        if( null != $request->input('user_id') ){
            $orm->where('user_id', $request->input('user_id'));
        }
        
        if( null != $request->input('activity') ){
            $orm->where('activity_id', $request->input('activity'));
        }
        
        if( null != $request->input('keywords') ){
            $orm->whereHas('user', function ($query) use($request) {
                $query->where('name', 'LIKE', '%'.$request->keywords.'%');
            });
        }
        $items = $orm->paginate(20);
        return view('admin.log.index',[
            'items' => $items,
            'activities' => Activity::orderBy('created_at', 'DESC')->get(),
        ]);
    }

    //导出功能
    public function export(Request $request)
    {
        
        $class_name = $this->class_name;
        $orm = $class_name::orderBy('created_at', 'DESC');

        if( null != $request->input('user_id') ){
            $orm->where('user_id', $request->input('user_id'));
        }
        
        if( null != $request->input('activity') ){
            $orm->where('activity_id', $request->input('activity'));
        }
        
        if( null != $request->input('keywords') ){
            $orm->whereHas('user', function ($query) use($request) {
                $query->where('name', 'LIKE', '%'.$request->keywords.'%');
            });
        }
        $filename = date('YmdHis').'.csv';
        $fp = fopen(public_path("downloads/".$filename), 'w');
        fwrite($fp, chr(0xEF).chr(0xBB).chr(0xBF));
        if( $request->input('type') == 'reading' ){
            $titles = ["活动","用户","字数","书名","创建时间"];
        }
        elseif( $request->input('type') == 'prize' ){
            $titles = ["活动","用户","排名","奖品","状态","创建时间"];
        }
        elseif( $request->input('type') == 'exchange' ){
            $titles = ["活动","用户","兑换字数","奖品","状态","创建时间"];
        }
        else{
            $titles = ["活动","用户","字数","原因","创建时间"];
        }
        fputcsv($fp, $titles);
        $orm->chunk(30000, function($items) use ($fp, $request){
            foreach ($items as $k => $v) {
                if( $request->input('type') == 'reading' ){
                    $array = [
                        $v->activity->name,
                        $v->user->name,
                        $v->words_number,
                        $v->book_name,
                        $v->created_at
                    ];
                }
                elseif( $request->input('type') == 'prize' ){
                    
                    $array = [
                        $v->activity->name,
                        $v->user->name,
                        $v->rank,
                        $v->prize->name,
                        $item->has_checked == 0 ? '未核销' : '已核销' ,
                        $v->created_at
                    ];
                }
                elseif( $request->input('type') == 'exchange' ){
                    //$status_name = 0;
                    $array = [
                        $v->activity->name,
                        $v->user->name,
                        $v->words_number,
                        $v->item->name,
                        $v->status_name,
                        $v->created_at
                    ];
                }
                else{
                    
                    $array = [
                        $v->activity->name,
                        $v->user->name,
                        $v->words_number,
                        $v->reason,
                        $v->created_at
                    ];
                }
                fputcsv($fp, $array);
            }
        });
        fclose($fp);
        return response()->download("downloads/".$filename);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.log.create',[
            'activities' => Activity::orderBy('created_at', 'DESC')->get(),
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $messages = [
            'user_id.*' => '请输入用户ID~',
            'activity_id.*' => '请选择活动~',
            'reason.*' => '理由不能为空~',
            'words_number.*' => '字数只能为数字且不能为空~',
            'words_number.*' => '阅读字数只能为数字且不能为空~',
        ];
        $validator = Validator::make($request->all(), [
            'user_id' => 'required',
            'reason' => 'required',
            'activity_id' => 'required|exists:activities,id',
            'words_number' => 'required|numeric',
        ], $messages);

        $user_id = str_replace("，", ",", $request->input('user_id'));
        $user_ids = explode(",", $user_id);
        $validator->after(function ($validator) use($user_ids) {
            $count = User::whereIn('id', $user_ids)->count();
            if ( $count != count($user_ids) ) {
                $validator->errors()->add('user_id', '有不存在的ID，请重新输入');
            }
        });

        if ($validator->fails()) {
            return response()->json($validator->errors(), 403);
        }

        foreach($user_ids as $id) {
            $log = new ActivityLog;
            $log->user_id = $id;
            $log->activity_id = $request->input('activity_id');
            $log->reason = $request->input('reason');
            $log->words_number = $request->input('words_number');
            $log->save();

            $activity_user = ActivityUser::where('user_id', $id)
            ->where('activity_id', $request->input('activity_id'))
            ->first();
            $activity_user->words_number += $log->words_number;
            $activity_user->save();
        }
        return response()->json(['ret' => 0, 'url' => route('log.index')]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $class_name = $this->class_name;

        $log = $class_name::find($id);
        $activity_user = ActivityUser::where('user_id', $log->user_id)
            ->where('activity_id', $log->activity_id)
            ->first();
        if( null != $activity_user){
            $activity_user->words_number = $activity_user->words_number - $log->words_number;
            $activity_user->save();
        }
        $log->delete();
        return ['ret'=>0];
    }
    public function check(Request $request, $id)
    {
        if($request->input('type') == 'exchange'){
            $log = ExchangeLog::find($id);
            $log->received_status = 1;
            $log->save();
        }
        else{
            $log = PrizeLog::find($id);
            $log->has_checked = 1;
            $log->save();
        }
        return ['ret'=>0];
        
    }
    public function uncheck(Request $request, $id)
    {
        if($request->input('type') == 'exchange'){
            DB::beginTransaction();
            try{
                $log = ExchangeLog::find($id);
                $activity_user = ActivityUser::where('user_id', $log->user_id)->where('activity_id', $log->activity_id)->first();
                $activity_user->exchanged_words_number += $log->words_number;
                $activity_user->save();
                $log->received_status = -1;
                $log->save();
                # 礼品库存返回
                $item = Item::find($log->item_id);
                $item->has_exchanged_number -= 1;
                $item->save();
                DB::commit();
                return ['ret'=>0];

            }catch(\Exception $e){
                DB::rollback();
                return ['ret'=>1001, 'errMsg'=>$e->getMessage()];
            }
        }
        else{
            $log = PrizeLog::find($id);
            $log->has_checked = 0;
            $log->save();
        }
        return ['ret'=>0];
        
    }

    # 礼品过期处理
    public function overdue(Request $request, $id)
    {
        if($request->input('type') == 'exchange'){
            DB::beginTransaction();
            try{
                $log = ExchangeLog::find($id);
                $log->received_status = -2;
                $log->save();
                # 礼品库存返回
                $item = Item::find($log->item_id);
                $item->has_exchanged_number -= 1;
                $item->save();
                DB::commit();
                return ['ret'=>0];

            }catch(\Exception $e){
                DB::rollback();
                return ['ret'=>1001, 'errMsg'=>$e->getMessage()];
            }
        }
        return ['ret'=>0];
    }
}
