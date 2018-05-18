<?php
namespace App\Http\Controllers\Api;

use App\Activity;
use App\ActivityUser;
use App\Helpers\Helper;
use App\Http\Controllers\Controller;
use App\Http\Resources\ActivityUser as ActivityUserResource;
use App\Http\Resources\User as UserResource;
use App\User;
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

        return (new UserResource(User::find($id)))->additional([
            'data' => [
                'has_joined' => $has_joined,
                'activity_info' => $activity_info,
            ],
        ]);
    }

    public function board(Request $request)
    {
        $current_user_id = $request->input('id');
        $id = session('wx.user.id');
        $orm = ActivityUser::with('user');
        $activity = Helper::getLatestActivity();

        if ($request->input('type') == 'withoutme') {
            $wx_activity_user = ActivityUser::where('user_id', session('wx.user.id'))
                ->where('activity_id', $activity->id)
                ->first();
            if ($wx_activity_user != null) {
                $orm->where('user_id', '!=', $id);
                //所有城市年龄组
                //$orm->where('age_group_id', $wx_activity_user->age_group_id);
                //$orm->where('city_id', $wx_activity_user->city_id);
            }
        } else {
            if ($request->input('agegroup')) {
                $orm->where('age_group_id', $request->input('agegroup'));
            }

            if ($request->input('city')) {
                $orm->whereHas('user', function ($query) use ($request) {
                    $query->where('city_id', $request->input('city'));
                });
            }
        }

        $current_activity = Helper::getCurrentActivity();
        if ($request->input('activity')) {
            $orm->where('activity_id', $request->input('activity'));
            $activity_id = $request->input('activity');
            if (null == $current_activity) {
                $is_current_activity = 0;
            } else {
                $is_current_activity = $request->input('activity') == $current_activity->id ? 1 : 0;
            }
        } else {
            //没有活动
            if (null == $current_activity) {
                return response()->json(['ret' => 1001, 'errMsg' => '当前没有活动'], 433);
            }
            $is_current_activity = null == $current_activity ? 0 : 1;
            $activity_id = $activity->id;
            $orm->where('activity_id', $activity->id);
        }

        $orm->orderBy('words_number', 'DESC');
        ///获取当前用户的排名 然后计算出是多少页 直接显示排名小于当前用户的用户 然后滚动至底部
        if ($current_user_id) {
            $current_activity_user = ActivityUser::where('user_id', $current_user_id)->where('activity_id', $activity_id)->first();
            if ($current_activity_user) {
                $count = ActivityUser::where('activity_id', $activity_id)
                    ->where('words_number', '>', $current_activity_user->words_number)
                    ->count();
                $rank = $count + 1;
                $page = (int)(ceil($rank/4));
                //$orm->where('words_number', '<=', $current_activity_user->words_number);
                if( $request->input('page') == 1 || $request->input('page') == null ){
                    $request->merge(['page'=> $page]);
                }
            }
        }
        $activity_users = $orm->paginate(4);
        return ActivityUserResource::collection($activity_users)->additional([
            'meta' => [
                'is_current_activity' => $is_current_activity,
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
        try {
            $user = User::find($id);
            $user->name = $request->input('name');
            $user->birthdate = substr($request->input('birthdate'), 0, 10);
            $user->city_id = $request->input('city');
            $user->tel = $request->input('tel');
            $user->is_reading = $request->input('is_reading') == true ? 1 : 0;
            $user->is_activated = 0;
            $result = $user->save();
        } catch (Exception $e) {
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
