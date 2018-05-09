<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{

    public function city()
    {
        return $this->belongsTo('App\City');
    }
    public function administrators()
    {
        return $this->belongsToMany('App\Administrator', 'user_administrators', 'user_id', 'administrator_id');
    }
    public function getAdministratorNamesAttribute()
    {
        $administrator = $this->administrators();
        if( empty($administrator) ){
            return '--';
        }
        else{
            $plucked  = $administrator->pluck('name');
            return implode(',', $plucked ->all());
        }
    }
}
