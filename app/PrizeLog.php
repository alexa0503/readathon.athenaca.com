<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PrizeLog extends Model
{
    public function activity()
    {
        return $this->belongsTo('App\Activity');
    }
    public function prize()
    {
        return $this->belongsTo('App\Prize');
    }
}
