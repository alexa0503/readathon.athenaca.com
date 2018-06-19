<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ExchangeLog extends Model
{
    protected $received_status_names = [
        '-1'=>'取消领取',
        '0'=>'已兑换',
        '1'=>'已领取',
    ];
    public function user()
    {
        return $this->belongsTo('App\User');
    }
    
    public function activity()
    {
        return $this->belongsTo('App\Activity');
    }
    
    public function item()
    {
        return $this->belongsTo('App\Item');
    }
    public function getStatusNameAttribute($value)
    {
        return $this->received_status_names[$this->received_status];
    }
}
