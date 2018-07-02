<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    public function city()
    {
        return $this->belongsTo('App\City');
    }
    
    public function inviter()
    {
        return $this->belongsTo('App\User', 'invite_id', 'id');
    }
    public function school_district()
    {
        return $this->belongsTo('App\SchoolDistrict', 'school_district_id', 'id');
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
