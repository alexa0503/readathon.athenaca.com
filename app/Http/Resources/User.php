<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Carbon\Carbon;
use App\ActivityUser;
use App\Activity;
use App\Helpers\Helper;
use App\ReadingLog;
use App\ActivityLog;
use App\VoteLog;


class User extends JsonResource
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        ///获取最近一次活动
        if( $request->input('activity') ){
            $activity = Activity::find($request->input('activity'));
        }
        else{
            $activity = Helper::getLatestActivity();
        }
        //活动用户
        $activity_user = ActivityUser::where('user_id', $this->id)
        ->where('activity_id', $activity->id)
        ->first();
        
        //基本信息
        $age = $this->birthdate ? \App\Helpers\Helper::age($this->birthdate) : 0;
        if( null != $activity_user && null != $activity_user->age_group_id ){
            $age_group_id = $activity_user->age_group_id;
        }
        else{
            $age_group = \App\AgeGroup::where('min_age', '<=', $age)
                ->where('max_age', '>=', $age)
                ->first();
            if( $age_group == null ){
                $age_group_id = null;
            }
            else{
                $age_group_id = $age_group->id;
            }
        }
        $words_number = null == $activity_user ? '0' : $activity_user->words_number;
        //当前用户得投票信息
        $vote_log = VoteLog::where('voter_id', session('wx.user.id'))->where('user_id', $this->id)->where('activity_id', $activity->id)->first();
        $has_voted = $vote_log == null ? 0 : 1;

        
        $_orm = ActivityUser::where('activity_id', $activity->id);
        //未激活用户
        if($this->is_activated != 1){
            $_orm->where('words_number', '>', 0);
        }
        else{
            if( $request->input('type') == 'withoutme' ){
                /*
                $wx_activity_user = ActivityUser::where('user_id', session('wx.user.id'))
                    ->where('activity_id', $activity->id)
                    ->first();
                if( $wx_activity_user != null ){
                    $_orm->where('city_id', $wx_activity_user->city_id);
                    $_orm->where('age_group_id', $wx_activity_user->age_group_id);
                }
                */
            }
            else{
                if( null != $request->input('city') ){
                    $_orm->where('city_id', $request->input('city'));
                }
                if( null != $request->input('agegroup') ){
                    $_orm->where('age_group_id', $request->input('agegroup'));
                }
            }
            
            if( null != $activity_user ){
                $_orm->where('words_number', '>', $activity_user->words_number);
            }
            else{
                $_orm->where('words_number', '>', 0);
            }
        }
        $count = $_orm->count();
        $rank = $count + 1;
        $return = [
            'id' => $this->id,
            'name' => $this->name,
            'openid' => $this->openid,
            'avatar' => asset($this->avatar),
            'nickname' => $this->nickname,
            'age' => $age,
            'birthdate' => $this->birthdate,
            'is_activated' => $this->is_activated,
            'is_reading' => $this->is_reading,
            'age_group_id' => $age_group_id,
            'rank' => $rank,
            'city_id' => $this->city_id,
            'ge' => $this->ge,
            'tel' => $this->tel,
            'city_name' => $this->city ? $this->city->name : '',
            'words_number' => $words_number,
            'format_words_number' => number_format($words_number,0,'',','),
            'reading_number' => null == $activity_user ? 0 : $activity_user->reading_number,
            'voted_number' => null == $activity_user ? 0 : $activity_user->voted_number,
            'has_voted' => $has_voted,
            'has_joined' => null == $activity_user ? 0 : 1
        ];
        return $return;
    }
}
