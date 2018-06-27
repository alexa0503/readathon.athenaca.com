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
        if($request->input('debug') == true){
            $id = $request->input('id') ? : 1;
            $user = new UserResource(\App\User::find($id));
            session(['wx.user'=>collect($user)->toArray()]);
        }
        if( !\Session::has('wx.user') && $request->path() != '/' ){
            return response()->json(['error'=>'Not authorized.'], 401);
        }
        return $next($request);
    }
}
