<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Activity extends Model
{
    public static function current()
    {
        $dt = Carbon::now();
        return self::where('start_date', '<=', $dt)->where('end_date', '>', $dt)->first();
    }
}
