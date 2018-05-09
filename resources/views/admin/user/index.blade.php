@extends('layouts.admin') @section('content')
<div class="smart-widget">
    <div class="smart-widget-header">
        <form class="form-inline" action="{{ route('user.index') }}">
            <div class="form-group">
                <input class="form-control" name="keywords" placeholder="输入姓名" value="{{Request::input('keywords')}}" />
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
                <button type="submit" class="btn btn-primary">查询</button>
                <a href="{{ url('/admin/user/export') }}" class="btn btn-info">导出</a>
            </div>
        </form>
    </div>
    <div class="smart-widget-inner">
        <div class="smart-widget-body">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th><input name="all" type="checkbox" value="1" /></th>
                        <th>姓名</th>
                        <th>昵称</th>
                        <th>头像</th>
                        <th>城市</th>
                        <th>电话</th>
                        <th>性别</th>
                        <th>生日</th>
                        <th>在读学员</th>
                        <th>是否激活</th>
                        <th>注册时间</th>
                        <th>管理者</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($items as $item)
                    <tr>
                        <td><input name="id[]" type="checkbox" value="{{ $item->id }}" /></td>
                        <td>{{ $item->name }}</td>
                        <td>{{ $item->nickname }}</td>
                        <td><img src="{{ asset('$item->avatar') }}" /></td>
                        <td>{{ $item->city->name }}</td>
                        <td>{{ $item->tel }}</td>
                        <td>{{ $item->birthdate }}</td>
                        <td>{{ $item->sex == '0' ? '男' : '女' }}</td>
                        <td>{{ $item->is_reading ? '是' : '否' }}</td>
                        <td>{{ $item->is_activated == 1 ? '是' : '否' }}</td>
                        <td>{{ $item->created_at }}</td>
                        <td>{{ $item->administrator_names }}</td>
                        <td>
                            <a href="{{route('user.edit',['id'=>$item->id])}}" class="btn btn-default btn-xs">激活</a>
                            <a href="{{route('user.edit',['id'=>$item->id])}}" class="btn btn-default btn-xs">编辑</a>
                            <a href="{{route('user.destroy',['id'=>$item->id])}}" class="btn destroy btn-default btn-xs">删除</a>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="13">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                    将所选分配给<span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu pull-right" role="menu">
                                    @foreach($administrators as $administrator)
                                    <li><a href="#" data-id="{{ $administrator->id }}">{{ $administrator->name }}</a></li>
                                    @endforeach
                                </ul>
                            </div>
                        </td>
                    </tr>
                </tfoot>
            </table>
            {!! $items->appends(Request::except('page'))->links() !!}
        </div>
    </div>
</div>
@endsection