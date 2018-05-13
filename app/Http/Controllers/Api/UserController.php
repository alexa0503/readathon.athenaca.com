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
            $orm->where('activity_id', $activity->id);
        }
        $orm->orderBy('words_number', 'DESC');
        $activity_users = $orm->paginate(4);

        return ActivityUserResource::collection($activity_users)->additional([
            'meta' => [
                'is_current_activity' => $is_current_activity,
            ],
        ]);
    }
}
