<?php

namespace App\Http\Middleware;

use Closure;
use Menu;
use Auth;
use App\Activity;

class GenerateMenu
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
        $admin = Auth::guard('admin')->user();
        Menu::make('menu', function ($menu)use($admin) {
            $menu->add('Dashboard', ['url'=>url('/admin'),'class'=>'bg-palette1']);

            //页面管理
            if(($admin->hasPermissionTo('页面管理') && $admin->hasAnyRole(['管理员'])) || $admin->hasAnyRole(['管理员'])){
                $menu1 = $menu->add('页面管理', ['url'=>route('page.post.index',['page'=>1]),'class'=>'openable bg-palette1']);
                $pages = \App\Page::all();
                $menu1->add('通用设置', ['url'=>route('page.post.index',['page'=>'common']),'class'=>'bg-palette1']);
                foreach($pages as $page){
                    $menu1->add($page->title, ['url'=>route('page.post.index',['page'=>$page->id]),'class'=>'bg-palette1']);
                }
            }
            
            //活动管理
            if(($admin->hasPermissionTo('活动管理') && $admin->hasAnyRole(['管理员'])) || $admin->hasAnyRole(['管理员'])){
                $activity = $menu->add('活动管理', ['url'=>route('activity.index'),'class'=>'openable bg-palette2']);
                $activity->add('查看', ['url'=>route('activity.index'),'class'=>'bg-palette2']);
                $activity->add('新增', ['url'=>route('activity.create'),'class'=>'bg-palette2']);
                $activity_user = $menu->add('活动排名', ['url'=>route('activityUser.index'),'class'=>'openable bg-palette9']);
                //$activity_user->add('所有', ['url'=>route('activityUser.index'),'class'=>'bg-palette9']);
                $rows = Activity::orderBy('start_date', 'DESC')->get();
                foreach($rows as $row){
                    $activity_user->add($row->name, ['url'=>route('activityUser.index', ['activity'=>$row->id]),'class'=>'bg-palette9']);
                }
            }
            //奖品管理
            if(($admin->hasPermissionTo('奖品管理') && $admin->hasAnyRole(['管理员'])) || $admin->hasAnyRole(['管理员'])){
                $prize = $menu->add('奖品管理', ['url'=>route('prize.index'),'class'=>'openable bg-palette3']);
                $prize->add('查看', ['url'=>route('prize.index'),'class'=>'bg-palette3']);
                $prize->add('新增', ['url'=>route('prize.create'),'class'=>'bg-palette3']);
            }
            //问答管理
            if(($admin->hasPermissionTo('问答管理') && $admin->hasAnyRole(['管理员'])) || $admin->hasAnyRole(['管理员'])){
                $question = $menu->add('问答管理', ['url'=>route('question.index'),'class'=>'openable bg-palette4']);
                $question->add('查看', ['url'=>route('question.index'),'class'=>'bg-palette4']);
                $question->add('新增', ['url'=>route('question.create'),'class'=>'bg-palette4']);
            }
            //城市管理
            if(($admin->hasPermissionTo('城市管理') && $admin->hasAnyRole(['管理员'])) || $admin->hasAnyRole(['管理员'])){
                $city = $menu->add('城市管理', ['url'=>route('city.index'),'class'=>'openable bg-palette5']);
                $city->add('查看', ['url'=>route('city.index'),'class'=>'bg-palette5']);
                $city->add('新增', ['url'=>route('city.create'),'class'=>'bg-palette5']);
            }
            //年龄组管理
            if(($admin->hasPermissionTo('年龄组管理') && $admin->hasAnyRole(['管理员'])) || $admin->hasAnyRole(['管理员'])){
                $age = $menu->add('年龄组管理', ['url'=>route('age.index'),'class'=>'openable bg-palette6']);
                $age->add('查看', ['url'=>route('age.index'),'class'=>'bg-palette6']);
                $age->add('新增', ['url'=>route('age.create'),'class'=>'bg-palette6']);
            }
            //用户管理
            if(($admin->hasPermissionTo('用户管理') && $admin->hasAnyRole(['管理员'])) || $admin->hasAnyRole(['管理员'])){
                $user = $menu->add('用户管理', ['url'=>route('user.index'),'class'=>'openable bg-palette7']);
                $user->add('查看', ['url'=>route('user.index'),'class'=>'bg-palette7']);
                //$user->add('新增', ['url'=>route('user.create'),'class'=>'bg-palette7']);
            }
            //权限管理
            if(($admin->hasPermissionTo('权限管理') && $admin->hasAnyRole(['管理员'])) || $admin->hasAnyRole(['管理员'])){
                $permission = $menu->add('权限管理', ['url'=>route('permission.index'),'class'=>'openable bg-palette8']);
                $permission->add('查看', ['url'=>route('permission.index'),'class'=>'bg-palette8']);
                $permission->add('新增', ['url'=>route('permission.create'),'class'=>'bg-palette8']);
            }
           
        });
        return $next($request);
    }
}
