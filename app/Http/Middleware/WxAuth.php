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
        //dd(session('wx.user'));
        if( !\Session::has('wx.user') ){
            $appid = config('wx.appid');
            $redirect_uri = url(config('wx.redirect_uri'));
            $url = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid='.$appid.'&redirect_uri='.$redirect_uri.'&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect';
            return redirect($url);
        }
        
        return $next($request);
    }
}
