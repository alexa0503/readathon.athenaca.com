<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Carbon\Carbon;

class PrizeLog extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'activity_name' => $this->activity->name,
            'prize_name' => $this->prize->name,
            'rank' => $this->rank,
            'created_at' =>  Carbon::createFromFormat('Y-m-d H:i:s', $this->created_at)->format('Y-m-d'),
        ];
    }
}
