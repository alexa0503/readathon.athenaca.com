<?php

namespace App\Http\Middleware;

use Closure;
use App\Http\Resources\User as UserResource;

class WxAuth
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        /*
        if($request->input('debug') == true){
            $id = $request->input('id') ? : 1;
            $user = new UserResource(\App\User::find($id));
            $arr = collect($user)->toArray();
            $arr['age_group_id'] = \App\Helpers\Helper::ageGroup($user->birthdate);
            session(['wx.user'=>$arr]);
        }
        */
        if( !\Session::has('wx.user') && $request->path() == '/' ){
            return redirect('/login');
        }
        elseif( !\Session::has('wx.user') ){
            return response()->json(['error'=>'Not authorized.'], 401);
        }
        $user = \App\User::find(\Session::has('wx.user.id'));
        if( null == $user ){
            return response()->json(['error'=>'Not authorized.'], 401);
        }
        return $next($request);
    }
}
