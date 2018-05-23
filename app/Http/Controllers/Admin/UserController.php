<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Helpers\Helper;
use App\ActivityUser;
use App\User;
use App\ActivityLog;
use DB;


class UserController extends Controller
{
    public function __construct()
    {
        $this->middleware(['permission:用户管理']);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $admin = Auth::guard('admin')->user();
        
        $orm = \App\User::orderBy('created_at', 'DESC');

        if( !$admin->hasAnyRole(['超级管理员']) ){
            $super_administrator = false;
            //$user_administrator = DB::table('user_administrators')->where('administrator_id', $id)->where('user_id', $user)->first();
            
            $orm->whereHas('administrators',  function($query) use($admin){
                $query->where('administrator_id', $admin->id);
            });
        }
        else{
            $super_administrator = true;
        }
        if( $request->input('keywords') ){
            $orm->where('name', 'LIKE', '%'.$request->keywords.'%');
        }
        if( $request->input('city_id') ){
            $orm->where('city_id', $request->input('city_id'));
        }
        if( null != $request->input('is_activated') ){
            $orm->where('is_activated', $request->input('is_activated') );
        }
        if( null != $request->input('id') ){
            $orm->where('id', $request->input('id') );
        }
        if( $request->input('status') != null ){
            if( $request->input('status') == 1){
                $orm->whereNotNull('name');
            }
            elseif(  $request->input('status') == '0' ){
                $orm->whereNull('name');
            }
        }
        if( $request->age_id ){
            $age = \App\AgeGroup::find($request->age_id);
            $date1 = Carbon::now()->addYear(-1*$age->min_age)->toDateString();
            $date2 = Carbon::now()->addYear(-1*$age->max_age-1)->toDateString();
            $orm->where('birthdate', '<=', $date1);
            $orm->where('birthdate', '>=', $date2);
        }
        $users = $orm->paginate(20);
        $cities = \App\City::all();
        $ages = \App\AgeGroup::all();
        $administrators = \App\Administrator::all();
        return view('admin.user.index', [
            'items' => $users,
            'cities' => $cities,
            'ages' => $ages,
            'administrators' => $administrators,
            'super_administrator' => $super_administrator
        ]);
    }
    public function disable(Request $request, $user_id){
        $user = User::find($user_id);
        $user->is_activated = -1;
        $user->save();
        return response()->json(['ret'=>0]);
    }
    public function activate(Request $request, $user_id)
    {
        DB::beginTransaction();
        try{
            $user = User::find($user_id);
            if( null != $user->invite_id && $user->is_activated == 0 ){
                $inviter = $user->inviter;
                $activity = Helper::getCurrentActivity();
                if( null != $activity ){
                    $activity_user = ActivityUser::where('user_id', $user->invite_id)->where('activity_id', $activity->id)->first();
                    if( null == $activity_user ){
                        $activity_user = new ActivityUser;
                        $activity_user->words_number = 500;
                        $activity_user->user_id = $user->invite_id;
                        $activity_user->activity_id = $activity->id;
                        $activity_user->age_group_id = Helper::age($inviter->birthdate);
                        $activity_user->reading_number = 0;
                        $activity_user->voted_number = 0;
                        $activity_user->receive_status = 0;
                    }
                    else{
                        $activity_user->words_number += 500;
                    }
                    $activity_user->save();
                    $activity_log = new ActivityLog;
                    $activity_log->user_id = $user->invite_id;
                    $activity_log->activity_id = $activity->id;
                    $activity_log->words_number = 500;
                    $activity_log->reason = '被邀请用户激活奖励字数';
                    $activity_log->save();
                }
            }
            $user->is_activated = 1;
            $user->save();
            DB::commit();
            return response()->json(['ret'=>0]);
        }
        catch(\Exception $e){
            DB::rollback();
            return response()->json(['ret'=>1001,'errMsg'=>$e->getMessage()]);
        }
        
    }

    public function export(Request $request)
    {
        $orm = \App\User::orderBy('id', 'ASC');
        if( $request->has('keywords') ){
            $orm->where('name', 'LIKE', '%'.$request->keywords.'%');
        }
        if( $request->city_id ){
            $orm->where('city_id', $request->city_id);
        }
        if( $request->age_id ){
            $age = \App\AgeGroup::find($request->age_id);
            $date1 = Carbon::now()->addYear(-1*$age->min_age);
            $date2 = Carbon::now()->addYear(-1*$age->max_age);
            $orm->where('birthdate', '<', $date1);
            $orm->where('birthdate', '>=', $date2);
        }
        $filename = date('YmdHis').'.csv';
        $fp = fopen(public_path("downloads/".$filename), 'w');
        fwrite($fp, chr(0xEF).chr(0xBB).chr(0xBF));
        $titles = ["姓名","昵称","城市","电话","生日","在读学员","注册时间"];
        fputcsv($fp, $titles);
        $orm->chunk(30000, function($items) use ($fp){
            foreach ($items as $k => $v) {
                $array = [
                    $v->name,
                    $v->nickname,
                    $v->city->name,
                    $v->tel,
                    $v->birthdate,
                    $v->is_reading,
                    $v->created_at
                ];
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
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
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
        $user = \App\User::find($id);
        $cities = \App\City::all();
        return view('admin.user.edit', [
            'item' => $user,
            'cities' => $cities,
        ]);
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
        $user = \App\User::find($id);
        $messages = [
            'name.*' => '姓名必须填写~',
            'nickname.*' => '昵称必须填写~',
            'birthdate.*' => '出生日期必须是日期格式~',
            'city_id.*' => '请选择城市~',
            'tel.*' => '电话必须填写~',
            'is_reading.*' => '请选择是否在读学员~',
            'sex.*' => '请选择性别~',
            'ge.*' => '请输入GE~',
        ];
        $validator = \Validator::make($request->all(), [
            'name' => 'required',
            'nickname' => 'required',
            'birthdate' => 'required|date',
            'city_id' => 'required|exists:cities,id',
            'tel' => 'required',
            'is_reading' => 'required',
            'sex' => 'required',
            'ge' => 'required',
        ], $messages);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 403);
        }
        $user->name = $request->input('name');
        $user->nickname = $request->input('nickname');
        $user->birthdate = $request->input('birthdate');
        $user->city_id = $request->input('city_id');
        $user->tel = $request->input('tel');
        $user->ge = $request->input('ge');
        $user->is_reading = $request->input('is_reading');
        $user->sex = $request->input('sex');
        $user->save();
        return response()->json(['ret' => 0, 'url' => route('user.index')]);
    }

    public function dispatchUser(Request $request, $id)
    {
        $users = $request->input('users');
        if( null == $users || empty($users) ){
            return response()->json([
                'ret' => 1001,
                'errMsg' => '请勾选需要分配的用户'
            ]);
        }
        if( !is_array($users) ){
            $users = [$users];
        }
        //DB::table('user_administrators')->where('administrator_id', $id)->delete();
        foreach($users as $user){
            $user_administrator = DB::table('user_administrators')->where('administrator_id', $id)->where('user_id', $user)->first();
            if( null == $user_administrator){
                DB::table('user_administrators')->insert([
                    'user_id'=>$user,
                    'administrator_id' => $id
                ]);
            }
        }
        return response()->json(['ret' => 0]);
    }
    public function revokeUser(Request $request, $id)
    {
        $users = $request->input('users');
        if( null == $users || empty($users) ){
            return response()->json([
                'ret' => 1001,
                'errMsg' => '请勾选需要取消的用户'
            ]);
        }
        if( !is_array($users) ){
            $users = [$users];
        }
        //DB::table('user_administrators')->where('administrator_id', $id)->delete();
        foreach($users as $user){
            DB::table('user_administrators')->where('administrator_id', $id)->where('user_id', $user)->delete();
        }
        return response()->json(['ret' => 0]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
