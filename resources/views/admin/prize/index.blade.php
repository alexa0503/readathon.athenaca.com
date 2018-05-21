@extends('layouts.admin') @section('content')
<div class="smart-widget">
    <div class="smart-widget-header">
        <form class="form-inline" action="{{ route('prize.index') }}">
            <div class="form-group">
                <input class="form-control" name="keywords" placeholder="输入关键词" value="{{Request::input('keywords')}}" />
            </div>
            
             <div class="form-group">
                <select name="activity" class="form-control">
                    <option value="" >选择活动/所有</option>
                    @foreach($activities as $activity)
                    <option value="{{ $activity->id }}" {!! $activity->id == Request::input('activity') ? 'selected="selected"' : '' !!}>{{ $activity->name }}</option>
                    @endforeach
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
                        <th>名称</th>
                        <th>活动</th>
                        <th>幻灯片/头图</th>
                        <th>中奖最高排名</th>
                        <th>中奖最低排名</th>
                        <th>已中</th>
                        <th>奖品说明</th>
                        <th>排序</th>
                        <th>创建时间</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($items as $item)
                    <tr>
                        <td>{{ $item->name }}</td>
                        <td>{{ $item->activity->name }}</td>
                        <td>@if($item->image)<a href="{{ asset($item->image) }}" title="点击查看大图" target="_blank"><img src="{{ asset($item->image) }}" style="max-width:100px;" /></a>@else{{ '' }}@endif</td>
                        <td>{{ $item->winning_min_rank }}</td>
                        <td>{{ $item->winning_max_rank }}</td>
                        <td>{{ $item->winned_number }}</td>
                        <td>{{ str_limit($item->body, 100, '...') }}</td>
                        <td>{{ $item->sort_id }}</td>
                        <td>{{ $item->created_at }}</td>
                        <td>
                            <a href="{{route('prize.edit',['id'=>$item->id])}}" class="btn btn-default btn-xs">编辑</a>
                            <a href="{{route('prize.destroy',['id'=>$item->id])}}" class="btn destroy btn-default btn-xs">删除</a>
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