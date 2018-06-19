<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\City;
class Item extends Model
{
    protected $casts = [
        'city_ids' => 'array',
    ];
    public function activity()
    {
        return $this->belongsTo('App\Activity');
    }
    public function getCityNamesAttribute($value)
    {
        $ids = $this->city_ids;
        $names = City::whereIn('id', $ids)->get()->map(function($item){
            return $item->name;
        })->toArray();
        return implode(',', array_values($names));
    }
    
}
