<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    public function answers()
    {
        return $this->hasMany('App\QuestionAnswer', 'question_id', 'id')->orderBy('sort_id', 'ASC');
    }
    
    public function activity()
    {
        return $this->belongsTo('App\Activity');
    }
}
