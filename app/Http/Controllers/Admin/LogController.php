<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Activity;
use App\ActivityLog;
use App\PrizeLog;
use App\ReadingLog;
use App\ActivityUser;
use App\User;
use Validator;

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
        $activity_user->words_number = $activity_user->words_number - $log->words_number;
        $activity_user->save();
        $log->delete();
        return ['ret'=>0];
    }
    public function check($id)
    {
        $log = PrizeLog::find($id);
        $log->has_checked = 1;
        $log->save();
        return ['ret'=>0];
        
    }
    public function uncheck($id)
    {
        $log = PrizeLog::find($id);
        $log->has_checked = 0;
        $log->save();
        return ['ret'=>0];
        
    }
}
