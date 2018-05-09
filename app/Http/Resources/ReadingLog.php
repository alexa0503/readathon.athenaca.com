<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Carbon\Carbon;

class ReadingLog extends JsonResource
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
            'book_name' => $this->book_name,
            'words_number' => number_format($this->words_number,0,'',','),
            'created_at' =>  Carbon::createFromFormat('Y-m-d H:i:s', $this->created_at)->format('Y-m-d'),
        ];
    }
}
