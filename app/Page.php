<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Page extends Model
{
    public function posts()
    {
        return $this->hasMany('App\Post');
    }
    public function getPostsByType($type)
    {
        return $this->hasMany('App\Post')->where('block_type', $type)->get();
    }
}
