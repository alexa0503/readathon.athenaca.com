@extends('layouts.admin') @section('content')
<div class="smart-widget">
    <div class="smart-widget-header">
        <form class="form-inline" action="{{ route('user.index') }}" id="form-search">
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
                <select name="school_district_id" class="form-control" id="school_district_id">
                    <option value="">选择校区/所有</option>
                    <option value="null" {!! Request::input('school_district_id') == 'null' ? 'selected="selected"' : '' !!}>无校区</option>
                    @foreach($districts as $district)
                    <option value="{{ $district->id }}" {!! $district->id == Request::input('school_district_id') ? 'selected="selected"' : '' !!}>{{ $district->name }}</option>
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
                <select name="status" class="form-control">
                    <option value="">请选择状态/所有</option>
                    <option value="1" {{ Request::input( 'status')=='1' ? 'selected="selected"' : '' }}>已注册</option>
                    <option value="0" {{ Request::input( 'status')=='0' ? 'selected="selected"' : '' }}>未注册</option>
                </select>
            </div>
            <div class="form-group">
                <select name="is_activated" class="form-control">
                    <option value="">是否激活/所有</option>
                    <option value="1" {{ Request::input( 'is_activated')=='1' ? 'selected="selected"' : '' }}>已激活</option>
                    <option value="0" {{ Request::input( 'is_activated')=='0' ? 'selected="selected"' : '' }}>未激活</option>
                    <option value="0" {{ Request::input( 'is_activated')=='-1' ? 'selected="selected"' : '' }}>禁用</option>
                </select>
            </div>
            <div class="form-group">
                <select name="is_reading" class="form-control">
                    <option value="">是否在读/所有</option>
                    <option value="1" {{ Request::input('is_reading') == '1' ? 'selected="selected"' : '' }}>在读</option>
                    <option value="0" {{ Request::input('is_reading') == '0' ? 'selected="selected"' : '' }}>未在读</option>
                </select>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">查询</button>
                <a href="{{ url('/admin/user/export') }}" class="btn btn-info btn-export">导出</a>
            </div>
        </form>
    </div>
    <div class="smart-widget-inner">
        <div class="smart-widget-body">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>
                            <input name="all" type="checkbox" value="1" />
                        </th>
                        <th>头像</th>
                        <th>ID</th>
                        <th>姓名</th>
                        <th>昵称</th>
                        <th>城市</th>
                        <th>电话</th>
                        <th>生日</th>
                        <th>性别</th>
                        <th>在读学员</th>
                        <th>校区</th>
                        <th>GE</th>
                        <th>邀请人</th>
                        <th>是否激活</th>
                        <th>状态</th>
                        <th>授权时间</th>
                        <th>UTM SOURCE</th>
                        <th>注册IP</th>
                        <th>注册城市</th>
                        <th>备注</th>
                        <th>管理者</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($items as $item)
                    <tr>
                        <td>
                            <input name="id[]" type="checkbox" value="{{ $item->id }}" />
                        </td>
                        <td>
                            <img src="{{ asset($item->avatar) }}" class="img-circle" style="max-width:100px;" />
                        </td>
                        <td>{{ $item->id }}</td>
                        <td>{{ $item->name }}</td>
                        <td>{{ $item->nickname }}</td>
                        <td>{{ $item->city_id ? $item->city->name : '-' }}</td>
                        <td>{{ $item->tel }}</td>
                        <td>{{ $item->birthdate }}</td>
                        <td>{{ $item->sex == '0' ? '男' : '女' }}</td>
                        <td>{{ $item->is_reading ? '是' : '否' }}</td>
                        <td>{{ $item->school_district_id ? $item->school_district->name : '--' }}</td>
                        <td>{{ $item->ge }}</td>
                        <td>@if($item->invite_id)
                            <a href="{{ route('user.index').'?id='.$item->invite_id }}" target="_blank">{{ $item->inviter->name }}</a>@else{{ '--' }}@endif</td>
                        <td>@if($item->is_activated == 1){{ '已激活' }}@elseif($item->is_activated == 0){{ '未激活' }}@else{{ '已禁用'
                            }}@endif</td>
                        <td>{{ $item->name != null ? '已注册' : '未注册' }}</td>
                        <td>{{ $item->created_at }}</td>
                        <td>{{ $item->utm_source }}</td>
                        <td>{{ $item->registered_ip }}</td>
                        <td>{{ $item->registered_city }}</td>
                        <td>{{ $item->remark }}</td>
                        <td>{{ $item->administrator_names }}</td>
                        <td>
                            <div class="btn-group">
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                    操作
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu pull-right" role="menu">
                                    @if($item->is_activated == 0 && $item->name != null)
                                    <li>
                                        <a href="{{route('user.activate',['id'=>$item->id])}}" class="activate">激活</a>
                                    </li>@endif @if($item->is_activated == 1)
                                    <li>
                                        <a href="{{route('user.disable',['id'=>$item->id])}}" class="activate">禁用</a>
                                    </li>@endif @if($item->is_activated == -1)
                                    <li>
                                        <a href="{{route('user.activate',['id'=>$item->id])}}" class="activate">重新启用</a>
                                    </li>@endif
                                    <li>
                                    @php
                                    $url = urlencode(Request::fullurl())

                                    @endphp
                                        <a href="{{route('user.edit',['id'=>$item->id,'redirect'=>urlencode(Request::fullurl())] )}}" class="edit">编辑</a>
                                    </li>

                                    <li role="separator" class="divider"></li>
                                    <li>
                                        <a href="{{route('log.index',['user_id'=>$item->id, 'activity'=>Request::input('activity'), 'type'=>'reading'])}}">查看阅读记录</a>
                                    </li>
                                    <li>
                                        <a href="{{route('log.index',['user_id'=>$item->id, 'activity'=>Request::input('activity'), 'type'=>'activity'])}}">查看活动记录</a>
                                    </li>
                                    <li>
                                        <a href="{{route('log.index',['user_id'=>$item->id, 'activity'=>Request::input('activity'), 'type'=>'prize'])}}">查看奖品记录</a>
                                    </li>
                                    <li>
                                        <a href="{{route('log.index',['user_id'=>$item->id, 'activity'=>Request::input('activity'), 'type'=>'exchange'])}}">查看兑换记录</a>
                                    </li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
                @if($super_administrator)
                <tfoot>
                    <tr>
                        <td colspan="22">
                            <div class="btn-group dropup">
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    将所选分配给
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu pull-right" role="menu">
                                    @foreach($administrators as $administrator)
                                    <li>
                                        <a href="{{ route('user.dispatch',$administrator->id) }}" class="dispatch" data-id="{{ $administrator->id }}">{{ $administrator->name }}</a>
                                    </li>
                                    @endforeach
                                </ul>
                            </div>
                            <div class="btn-group dropup">
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    将所选取消权限
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu pull-right" role="menu">
                                    @foreach($administrators as $administrator)
                                    <li>
                                        <a href="{{ route('user.revoke',$administrator->id) }}" class="dispatch" data-id="{{ $administrator->id }}">{{ $administrator->name }}</a>
                                    </li>
                                    @endforeach
                                </ul>
                            </div>
                        </td>
                    </tr>
                </tfoot>
                @endif
            </table>
            {!! $items->appends(Request::except('page'))->links() !!}
        </div>
    </div>
</div>
@endsection @section('scripts')
<script>
    $(function () {
        $('.dispatch').on('click', function () {
            var url = $(this).attr('href')
            var users = []
            $('input[name="id[]"]:checked').each(function () {
                users.push($(this).val())
            })
            //var users = $('input[name="id[]"]').val();
            $.post(url, {
                users: users
            }, function (data) {
                if (data.ret == 0) {
                    alert('提交成功')
                    window.location.reload();
                } else {
                    alert(data.errMsg)
                }
            }, "JSON")
            return false;
        })
        $('input[name="all"]').on('click', function () {
            if ($(this).is(':checked')) {
                $('input[name="id[]"]').prop('checked', true)
            } else {
                $('input[name="id[]"]').prop('checked', false)
            }
        })
    });
</script>
@endsection