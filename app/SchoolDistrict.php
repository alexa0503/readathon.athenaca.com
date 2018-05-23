<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SchoolDistrict extends Model
{
    public $timestamps = false;
    
    public function city()
    {
        return $this->belongsTo('App\City', 'city_id', 'id');
    }
}
