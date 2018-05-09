<?php
namespace App\Helpers;

use App\Activity;
use App\ActivityUser;
use Carbon\Carbon;

class Helper
{
    public static function age($birthdate)
    {
        $dt1 = Carbon::now();
        $dt2 = Carbon::createFromFormat('Y-m-d', $birthdate);
        return $dt1->diffInYears($dt2);
    }
    public static function checkUserActivity($user_id, Activity $activity)
    {
        $activity_user = ActivityUser::where('user_id', $user_id)->where('activity_id', $activity->id)->first();
        if (null == $activity_user) {
            ///获取当前用户的年龄组
            $activity_user = new ActivityUser;
            $activity_user->user_id = $user_id;
            $activity_user->activity_id = $activity->id;
            $activity_user->age_group_id = session('wx.user.age_group_id') ?: 1;
            $activity_user->reading_number = 0;
            $activity_user->voted_number = 0;
            $activity_user->city_id = session('wx.user.city_id') ?: 1;
            $activity_user->save();
        }
        return;
    }
    public static function getCurrentActivity()
    {
        $dt = Carbon::now();
        $activity = Activity::where('start_date', '<=', $dt)->where('end_date', '>', $dt)->first();
        return $activity;
    }
    public static function getLatestActivity()
    {
        $activity = Activity::orderBy('start_date', 'DESC')->first();
        return $activity;
    }
    public static function httpGet($url)
    {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_TIMEOUT, 500);
        // 为保证第三方服务器与微信服务器之间数据传输的安全性，所有微信接口采用https方式调用，必须使用下面2行代码打开ssl安全校验。
        // 如果在部署过程中代码在此处验证失败，请到 http://curl.haxx.se/ca/cacert.pem 下载新的证书判别文件。
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, true);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 2);
        curl_setopt($curl, CURLOPT_URL, $url);

        $res = curl_exec($curl);
        curl_close($curl);
        return $res;
    }
}
