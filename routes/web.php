<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Helpers;

//微信回调页
Route::get('/oauth', function(Request $request){
    $code = $request->input('code');
    $url = 'https://api.weixin.qq.com/sns/oauth2/access_token?appid='.config('wx.appid').'&secret='.config('wx.secret').'&code='.$code.'&grant_type=authorization_code';
    $result = json_decode(App\Helpers\Helper::httpGet($url));
    if( $result && isset($result->openid) ){
        $user = App\User::where('openid', $result->openid)->first();
        if( null == $user ){
            $info_url = 'https://api.weixin.qq.com/sns/userinfo?access_token='.$result->access_token.'&openid='.$result->openid.'&lang=zh_CN';
            $user_info = json_decode(App\Helpers\Helper::httpGet($info_url));
            $user = new \App\User;
            $user->openid = $user_info->openid;
            $user->nickname = $user_info->nickname;
            $user->sex = $user_info->sex;
            $user->avatar = $user_info->headimgurl;
            $user->invite_id = session('invite_id');
            //$user->birthdate = null;
            $user->is_activated = 0;
            $user->save();
        }
        session(['wx.user'=>collect($user)->toArray()]);
        $redirect_url = session('redirect_url');
        if( null != $redirect_url){
            session(['redirect_url'=>null]);
            return redirect($redirect_url);
        }
        else{
            return redirect('/');
        }
    }
    else{
        return response()->view('error');
    }
});
Route::get('/invite/{id}', function(Request $request, $id){
    $user = App\User::find($id);
    if( null != $user ){
        //写入session 授权时候插入
        session([
            'invite_id'=>$id
        ]);
    }
    return redirect('/');
});
/*
Route::get('/random', function(Request $request){
    $i = 0;
    while(true){
        $i++;
        $user_id = rand(1,102);
        $activity_id = 2;
        $activity_user = App\ActivityUser::where('user_id', $user_id)->where('activity_id', $activity_id)->first();
        if( App\User::find($user_id) == null ){
            continue;
        }
        if( $activity_user == null ){
            $activity_user = new App\ActivityUser;
            $activity_user->user_id = $user_id;
            $activity_user->activity_id = $activity_id;
            $activity_user->city_id = 1;
            $activity_user->age_group_id = 2;
            $activity_user->reading_number = rand(1000, 99999);
            $activity_user->words_number = rand(1000, 99999);
            $activity_user->voted_number = rand(1000, 99999);
            $activity_user->save();
        }
        if($i > 1000){
            break;
        }
    }
});
*/
Route::group(['middleware'=>['wx.auth']], function(){
    Route::get('/logout', function(Request $request){
        //session(['wx.user'=>null]);
        $request->session()->forget('wx.user');
        return redirect('/');
    });
    //首页根据用户状态自动跳转
    Route::get('/', function(Request $request){
        $data = $request->all();
        //如果已激活跳转到首页 未激活跳转到注册页面
        if( session('wx.user.is_activated') == 0 ){
            if( empty($query) ){
                return redirect('/page/register');
            }
            else{
                return redirect('/page/register?'.http_build_query($data));
                
            }
        }
        else{
            if( empty($query) ){
                return redirect('/page/home');
            }
            else{
                return redirect('/page/home?'.http_build_query($data));
                
            }
        }
    });
    //vue页面 需要判断用户状态然后进行跳转，排行榜页面 账户查看页面等
    Route::get('/page/{vue}/{id?}/{parms?}', function (Request $request) {
        /*
        $path = $request->path();
        $allow_paths = [
            'page/register'
        ];
        if( session('wx.user.is_activated') == 0 && !in_array($path, $allow_paths)  ){
            return redirect('/page/register');
        }
        */
        session(['redirect_url'=>$request->fullurl()]);
        return view('index');
    });
});

Route::group(['middleware' => ['role:管理员|超级管理员', 'menu'], 'prefix' => 'admin'], function () {
    
    Route::get('/', function () {
        return redirect('/admin/dashboard');
    });
    Route::get('/dashboard', 'Admin\IndexController@index');
    Route::resource('permission', 'Admin\PermissionController');
    Route::get('/user/export', 'Admin\UserController@export')->name('user.export');
    Route::post('/user/activate/{id}', 'Admin\UserController@activate')->name('user.activate');
    Route::post('/user/disable/{id}', 'Admin\UserController@disable')->name('user.disable');
    Route::post('/user/dispatch/{id}', 'Admin\UserController@dispatchUser')->name('user.dispatch');
    Route::post('/user/revoke/{id}', 'Admin\UserController@revokeUser')->name('user.revoke');
    Route::resource('user', 'Admin\UserController');
    Route::resource('age', 'Admin\AgeController');
    Route::resource('city', 'Admin\CityController');
    Route::resource('question', 'Admin\QuestionController');
    Route::resource('question.answer', 'Admin\AnswerController');
    Route::resource('activity', 'Admin\ActivityController');
    Route::resource('activityUser', 'Admin\ActivityUserController');

    Route::get('/log/check/{id}', 'Admin\LogController@check')->name('log.check');
    Route::get('/log/overdue/{id}', 'Admin\LogController@overdue')->name('log.overdue');
    Route::get('/log/uncheck/{id}', 'Admin\LogController@uncheck')->name('log.uncheck');
    Route::get('/log/export', 'Admin\LogController@export')->name('log.export');
    Route::resource('log', 'Admin\LogController');
    Route::resource('prize', 'Admin\PrizeController');
    Route::resource('item', 'Admin\ItemController');
    Route::resource('page.post', 'Admin\PostController');
    Route::resource('district', 'Admin\SchoolDistrictController');
    
});

Route::get('/admin/login', 'Admin\LoginController@ShowLogin');
Route::post('/admin/login', 'Admin\LoginController@login');
Route::get('/admin/logout', 'Admin\LoginController@logout');
Route::get('/admin/install', function () {
    dd(bcrypt('admin@2017'));
    if (\App\User::count() == 0) {
        $role = Role::create(['guard_name'=>'admin','name' => 'superadmin']);
        $permission = Permission::create(['guard_name'=>'admin','name' => 'global privileges']);
        $role->givePermissionTo('global privileges');
        $user = new \App\Administrator();
        $user->name = 'admin';
        $user->email = 'admin@admin.com';
        $user->password = bcrypt('admin@2017');
        $user->save();
        $user->givePermissionTo('global privileges');
        $user->assignRole(['superadmin']);
        $user->roles()->pluck('name');
        //$user->givePermissionTo('global privileges');
    }
    return redirect('/login');
});
Auth::routes();