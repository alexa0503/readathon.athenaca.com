<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class ActivityUser extends Model
{
    protected $primaryKey = ['activity_id','user_id'];
    //protected $keyType = 'string';
    public $incrementing = false;

    /**
     * Set the keys for a save update query.
     *
     * @param  \Illuminate\Database\Eloquent\Builder  $query
     * @return \Illuminate\Database\Eloquent\Builder
     */
    protected function setKeysForSaveQuery(Builder $query)
    {
        $keys = $this->getKeyName();
        if(!is_array($keys)){
            return parent::setKeysForSaveQuery($query);
        }

        foreach($keys as $keyName){
            $query->where($keyName, '=', $this->getKeyForSaveQuery($keyName));
        }

        return $query;
    }

    /**
     * Get the primary key value for a save query.
     *
     * @param mixed $keyName
     * @return mixed
     */
    protected function getKeyForSaveQuery($keyName = null)
    {
        if(is_null($keyName)){
            $keyName = $this->getKeyName();
        }

        if (isset($this->original[$keyName])) {
            return $this->original[$keyName];
        }

        return $this->getAttribute($keyName);
    }
    public function user()
    {
        return $this->belongsTo('App\User');
    }
    public function activity()
    {
        return $this->belongsTo('App\Activity');
    }

    public function getRank($city_id = null, $age_group_id = null)
    {
        $orm = ActivityUser::where('words_number', '>', $this->words_number);
        if( $city_id != null ){
            $orm->where('city_id', $city_id);
        }
        if( $age_group_id != null ){
            $orm->where('age_group_id', $age_group_id);
        }
        $orm->where('activity_id', $this->activity_id);
        return $orm->count() + 1;
    }
}
