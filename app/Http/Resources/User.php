<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Carbon\Carbon;
use App\Helpers\Helper;


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
        $age = $this->birthdate ? Helper::age($this->birthdate) : 0;
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
            'city_id' => $this->city_id,
            'ge' => $this->ge,
            'tel' => $this->tel,
            //'has_joined' => 1
            //'has_joined' => null == $activity_user ? 0 : 1
        ];
        return $return;
    }
}
