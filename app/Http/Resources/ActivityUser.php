<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\User as UserResource;
use App\VoteLog;
class ActivityUser extends JsonResource
{
    protected $has_user;
    public function __construct($resource, $has_user = true){
        $this->has_user = $has_user;
        parent::__construct($resource);
    }
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        //排名信息
        $orm = ActivityUser::where('activity_id', $this->activity_id);
        //未激活用户
        if( $request->input('type') != 'withoutme' ){
            if( null != $request->input('city') ){
                $orm->where('city_id', $request->input('city'));
            }
            if( null != $request->input('agegroup') ){
                $orm->where('age_group_id', $request->input('agegroup'));
            }
        }
        $orm->where('words_number', '>', $this->words_number);
        $rank = $orm->count() + 1;
        //当前用户得投票信息
        $has_voted = VoteLog::isVoted($this->user_id, $this->activity_id);
        if( $this->has_user ){
            return [
                'user' => new UserResource($this->user),
                'reading_number' => $this->reading_number,
                'voted_number' => $this->voted_number,
                'has_voted' => $has_voted,
                'reading_number' => $this->reading_number,
                'voted_number' => $this->voted_number,
                'words_number' => $this->words_number,
                'city_id' => $this->city_id,
                'rank' => $rank,
                'age_group_id' => $this->age_group_id,
                'format_words_number' => number_format($this->words_number,0,'',','),
                'created_at' => $this->created_at,
            ];
        }
        else{
            return [
                'user' => new UserResource($this->user),
                'reading_number' => $this->reading_number,
                'voted_number' => $this->voted_number,
                'has_voted' => $has_voted,
                'reading_number' => $this->reading_number,
                'voted_number' => $this->voted_number,
                'words_number' => $this->words_number,
                'city_id' => $this->city_id,
                'rank' => $rank,
                'age_group_id' => $this->age_group_id,
                'format_words_number' => number_format($this->words_number,0,'',','),
                'created_at' => $this->created_at,
            ];
        }
        
    }
}