<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Activity as ActivityResource;
use App\PrizeLog;
use App\Activity;
use Carbon\Carbon;
use App\ActivityUser;

class Prize extends JsonResource
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
            'name' => $this->name,
            'body' => $this->body,
            'winning_min_rank' => $this->winning_min_rank,
            'winning_max_rank' => $this->winning_max_rank,
            //'activity' => new ActivityResource($this->activity),
        ];
    }
}
