<?php
namespace App\Http\Controllers\Api;

use App\Activity;
use App\ActivityUser;
use App\Helpers\Helper;
use App\Http\Controllers\Controller;
use App\Http\Resources\ActivityUser as ActivityUserResource;
use App\Http\Resources\User as UserResource;
use itbdw\Ip\IpLocation;
use App\User;
use App\Administrator;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function index(Request $request, $id = null)
    {
        if (null == $id) {
            $id = session('wx.user.id');
        }
        $activity = Activity::current();
        $has_joined = 0;
        $activity_info = [
            'words_number' => 0,
            'reading_number' => 0,
            'rank' => '--',
        ];
        if (null != $activity) {
            $activity_user = ActivityUser::where('activity_id', $activity->id)->where('user_id', $id)->first();
            $has_joined = null == $activity_user ? 0 : 1;
            if (null != $activity_user) {
                $activity_info = new ActivityUserResource($activity_user, false);
            }
        }
        //dd($data);
        $total_reading_number =  ActivityUser::where('user_id', $id)->sum('reading_number');
        $total_words_number = ActivityUser::where('user_id', $id)->sum('words_number');
        return (new UserResource(User::find($id)))->additional([
            'data' => [
                'has_joined' => $has_joined,
                'activity_info' => $activity_info,
                'total_reading_number' => $total_reading_number,
                'total_words_number' => $total_words_number,
            ],
        ]);
    }

    public function board(Request $request)
    {
        $current_user_id = $request->input('id');
        $id = session('wx.user.id');
        $orm = ActivityUser::with('user');
        $activity = Helper::getLatestActivity();

        $wx_activity_user = ActivityUser::where('user_id', session('wx.user.id'))
            ->where('activity_id', $activity->id)
            ->first();
        
        if ($request->input('agegroup')) {
            $orm->where('age_group_id', $request->input('agegroup'));
        }

        if ($request->input('city')) {
            $orm->where('city_id', $request->input('city'));
            /*
            $orm->whereHas('user', function ($query) use ($request) {
                $query->where('city_id', $request->input('city'));
            });
            */
        }

        $current_activity = Helper::getCurrentActivity();
        if ( $request->input('activity') ) {
            $orm->where('activity_id', $request->input('activity'));
            $activity_id = $request->input('activity');
            if (null == $current_activity) {
                $is_current_activity = 0;
            } else {
                $is_current_activity = $request->input('activity') == $current_activity->id ? 1 : 0;
            }
        } else {
            //没有活动
            if (null == $current_activity && $request->input('type') == 'withoutme') {
                if( null != $activity){
                    $activity->start_date = date('m月d日',strtotime($activity->start_date));
                    $activity->end_date = date('m月d日',strtotime($activity->end_date));
                }
                return response()->json([
                    'ret' => 1001, 
                    'errMsg' => '当前没有活动', 
                    'latest'=>$activity
                ]);
            }
            $is_current_activity = null == $current_activity ? 0 : 1;
            $activity_id = $activity->id;
            $orm->where('activity_id', $activity->id);
        }
        $orm->orderBy('words_number', 'DESC')->orderBy('user_id','DESC');
        ///获取当前用户的排名 然后计算出是多少页 直接显示排名小于当前用户的用户 然后滚动至底部
        if ($current_user_id) {
            $current_activity_user = ActivityUser::where('user_id', $current_user_id)->where('activity_id', $activity_id)->first();
            if ($current_activity_user) {
                $count = ActivityUser::where('activity_id', $activity_id)
                    ->where('words_number', '>', $current_activity_user->words_number)
                    ->count();
                $rank = $count + 1;
                $page = (int)(ceil($rank/4));
                if($page > 25){
                    $page = 25;
                }
                //$orm->where('words_number', '<=', $current_activity_user->words_number);
                if( $request->input('page') == 1 || $request->input('page') == null ){
                    $request->merge(['page'=> $page]);
                }
            }
        }
        /*
        if ($request->input('type') == 'withoutme') {
            if ($wx_activity_user != null) {
                $orm->whereHas('user', function ($query) use ($wx_activity_user) {
                    $query->where('city_id', $wx_activity_user->city_id);
                });
            }
        }
        */
        //获取排名99的用户
        $_orm = Clone $orm;
        if ($request->input('type') == 'withoutme') {
            if ($wx_activity_user != null) {
                $orm->where('user_id', '!=', $id);
            }
        }
        $row = $_orm->select('words_number')->limit(1)->offset(99)->get();
        if( count($row) > 0 ){
            $orm->where('words_number', '>', $row[0]->words_number);
        }
        $activity_users = $orm->paginate(4)->appends($request->query());
        return ActivityUserResource::collection($activity_users)->additional([
            'meta' => [
                'is_current_activity' => $is_current_activity,
                'current_activity' => $current_activity,
                'activity_id' => $activity_id
            ],
        ]);
    }

    //用户注册
    public function register(Request $request)
    {
        $id = session('wx.user.id');
        $messages = [
            'name.required' => '请填写姓名~',
            'name.max' => '不能多于:max个字符~',
            'name.min' => '不能小于:min个字符~',
            'birthdate.required' => '请选择出生日期~',
            'birthdate.date' => '出生日期格式不正确~',
            'tel.required' => '请输入联系电话~',
            'is_reading.required' => '请选择是否Athena Academy知慧学院现任成员~',
            'city.required' => '请选择所在城市~',
            'privacy.required' => '请勾选阅读马拉松隐私政策~',
        ];
        $validator = \Validator::make($request->all(), [
            'name' => 'required|string|max:40|min:2',
            'birthdate' => 'required|date',
            'tel' => 'required',
            'is_reading' => 'required',
            'city' => 'required|exists:cities,id',
            'privacy' => [
                'required',
                function($attribute, $value, $fail){
                    if( $value == false ){
                        return $fail('请勾选阅读马拉松隐私政策');
                    }
                }
            ],
        ], $messages);

        $validator->after(function ($validator) use ($id) {
            if (null == $id) {
                $validator->errors()->add('name', '用户不存在');
            }
            $user = \App\User::find($id);
            if (null == $user) {
                $validator->errors()->add('name', '用户不存在');
            }
            if ($user->is_activated == 1) {
                $validator->errors()->add('name', '用户已激活过了');
            }
        });
        if ($validator->fails()) {
            return response()->json($validator->errors(), 403);
        }
        try {
            $utm_source = session('utm_source');
            $ip = $request->ip();
            $qqwry_filepath = storage_path('qqwry.dat');
            $data = IpLocation::getLocation($ip, $qqwry_filepath);
            $registered_city = empty($data['county']) ? $data['province'] : $data['city'];
            $user = User::find($id);
            $user->name = $request->input('name');
            $user->birthdate = substr($request->input('birthdate'), 0, 10);
            $user->city_id = $request->input('city');
            $user->tel = $request->input('tel');
            $user->is_reading = $request->input('is_reading') == true ? 1 : 0;
            $user->is_activated = 0;
            $user->registered_ip = $ip;
            $user->registered_city = $registered_city;
            $user->utm_source = $utm_source;
            $user->save();
            # 自动分配用户
            if( !empty($utm_source) ){
                $administrator = Administrator::where('name', $utm_source)->first();
                if( $administrator ){
                    $user_administrator = \DB::table('user_administrators')->where('administrator_id', $administrator->id)->where('user_id', $user->id)->first();
                    if( !$user_administrator){
                        \DB::table('user_administrators')->insert([
                            'user_id'=>$user->id,
                            'administrator_id' => $administrator->id
                        ]);
                    }
                }
            }
            
        } catch (\Exception $e) {
            $validator->errors()->add('name', '用户已激活过了');
        }
        
        if ($validator->fails()) {
            return response()->json($validator->errors(), 403);
        }
        return [];
    }

    //资料更新
    public function updateProfile(Request $request)
    {
        $id = session('wx.user.id');
        $messages = [
            'nickname.required' => '请填写姓名~',
            'nickname.max' => '不能多于:max个字符~',
            'nickname.min' => '不能小于:min个字符~',
            'tel.required' => '请输入联系电话~',
        ];
        $validator = \Validator::make($request->all(), [
            'nickname' => 'required|string|max:40|min:2',
            'tel' => 'required',
        ], $messages);

        $validator->after(function ($validator) use ($id, $request) {
            if ($request->input('id') !== $id) {
                $validator->errors()->add('name', '没有权限修改');
            }
        });
        if ($validator->fails()) {
            return response()->json($validator->errors(), 403);
        }
        $user = User::find($id);
        $user->nickname = $request->input('nickname');
        $user->tel = $request->input('tel');
        $user->avatar = $request->input('avatar');
        $user->save();
        return [];
    }

}
