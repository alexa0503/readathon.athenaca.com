<?php
namespace App\Http\Controllers\Api;

use App\Helpers\Wx;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class UserController extends Controller
{
    public function share(Request $request)
    {
        $url = $request->input('url');
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
        $user_id = session('wx.user.id');
        $wx = new Wx();
        $access_token = $wx->getAccessToken();
        $url = 'https://api.weixin.qq.com/cgi-bin/media/get?access_token='.$access_token.'&media_id='.$media_id;
        $fileContents = file_get_contents($url);
        $avatar = 'avatars/'.$user_id;
        Storage::put($avatar, $fileContents);
    }
}
