@extends('layouts.admin') @section('content')
<div class="smart-widget">
    <div class="smart-widget-header">
        <form class="form-inline" action="{{ route('activityUser.index') }}">
            <div class="form-group">
                <input class="form-control" name="keywords" placeholder="输入姓名" value="{{Request::input('keywords')}}" />
            </div>
             <div class="form-group">
                <select name="activity" class="form-control">
                    <option value="" disabled>选择活动</option>
                    @foreach($activities as $activity)
                    <option value="{{ $activity->id }}" {!! $activity->id == Request::input('activity') ? 'selected="selected"' : '' !!}>{{ $activity->name }}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group">
                <select name="city_id" class="form-control">
                    <option value="">请选择城市/所有</option>
                    @foreach($cities as $city)
                    <option value="{{ $city->id }}" {!! $city->id == Request::input('city_id') ? 'selected="selected"' : '' !!}>{{ $city->name }}</option>
                    @endforeach
                </select>
            </div>
             <div class="form-group">
                <select name="age_id" class="form-control">
                    <option value="">请选择年龄组/所有</option>
                    @foreach($ages as $age)
                    <option value="{{ $age->id }}" {!! $age->id == Request::input('age_id') ? 'selected="selected"' : '' !!}>{{ $age->title }}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group">
                <select name="receive_status" class="form-control">
                    <option value="">选择核销状态/所有</option>
                    <option value="0" {!! '0' == Request::input('receive_status') ? 'selected="selected"' : '' !!}>未核销</option>
                    <option value="1" {!! '1' == Request::input('receive_status') ? 'selected="selected"' : '' !!}>已核销</option>
                    </select>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">查询</button>
            </div>
        </form>
    </div>
    <div class="smart-widget-inner">
        <div class="smart-widget-body">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>排名</th>
                        <th>头像</th>
                        <th>昵称/姓名</th>
                        <th>阅读字数/阅读数/赞</th>
                        <th>创建时间</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($items as $item)
                    <tr>
                        <td>{{ $item->rank }}</td>
                        <td><a title="点击查看用户信息" href="{{ route('user.index',['id'=>$item->user_id]) }}" target="_blank"><img src="{{ asset($item->user->avatar) }}" class="img-circle" style="max-width:100px;" /></a></td>
                        <td>{{ $item->user->nickname }} / {{ $item->user->name }}</td>
                        <td>{{ $item->words_number }} / {{ $item->reading_number }} / {{ $item->voted_number }}</td>
                        <td>{{ $item->created_at }}</td>
                        <td>
                             <div class="btn-group">
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                    操作 <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu pull-right" role="menu">
                                    <li><a href="{{route('activityUser.edit',['id'=>$item->user_id, 'activity'=>Request::input('activity')])}}" >编辑基础信息</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="{{route('log.index',['user_id'=>$item->user_id, 'activity'=>Request::input('activity'), 'type'=>'reading'])}}" >查看阅读记录</a></li>
                                    <li><a href="{{route('log.index',['user_id'=>$item->user_id, 'activity'=>Request::input('activity'), 'type'=>'activity'])}}" >查看活动记录</a></li>
                                    <li><a href="{{route('log.index',['user_id'=>$item->user_id, 'activity'=>Request::input('activity'), 'type'=>'prize'])}}" >查看奖品记录</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="{{route('log.create',['user_id'=>$item->user_id, 'activity'=>Request::input('activity')])}}" >添加活动记录</a></li>
                                </ul>
                            </div>

                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
            {!! $items->appends(Request::except('page'))->links() !!}
        </div>
    </div>
    <!-- ./smart-widget-inner -->
</div>
@endsection