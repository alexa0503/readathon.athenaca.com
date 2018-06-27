<?php
namespace App\Http\Controllers\Api;

use App\Helpers\Wx;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use  Intervention\Image\Facades\Image;

class WxController extends Controller
{
    // 微信分享
    public function share(Request $request)
    {
        if( $request->ip() == '127.0.0.1' ){
            return;
        }
        $url = urldecode($request->input('url'));
        if (null == $url) {
            $protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
            $url = "$protocol$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
        }
        $wx = new Wx($url);
        $config = $wx->getSignPackage();
        return response()->json($config);
    }
    //根据media id 获取图片
    public function media(Request $request, $media_id)
    {
        try{
            $user_id = session('wx.user.id');
            if( env('APP_ENV') == 'local' ){
                $avatar = 'avatars/'.$user_id.'.jpg';
            }
            else{
                $wx = new Wx();
                $access_token = $wx->getAccessToken();
                $url = 'https://api.weixin.qq.com/cgi-bin/media/get?access_token='.$access_token.'&media_id='.$media_id;
                $fileContents = file_get_contents($url);
                $avatar = 'avatars/'.$user_id.'.jpg';
                Storage::put($avatar, $fileContents);
            }
            //图片处理，居中最大正方形
            $img = Image::make(public_path('storage/'.$avatar));
            $img->fit(400, 400);
            $img->save();
            return response()->json(['ret'=>0, 'data'=>[
                'url' =>Storage::url($avatar).'?_='.time(),
            ]]);
        }catch(\Exception $e){
            return response()->json([
                'ret'=>1001,
                 'errMsg'=>$e->getMessage()
            ]);
        }
    }
}
