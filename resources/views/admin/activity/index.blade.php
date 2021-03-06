@extends('layouts.admin') @section('content')
<div class="smart-widget">
    <div class="smart-widget-header">
        <form class="form-inline" action="{{ route('activity.index') }}">
            <div class="form-group">
                <input class="form-control" name="keywords" placeholder="输入关键词" value="{{Request::input('keywords')}}" />
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
                        <th>ID</th>
                        <th>名称</th>
                        <th>图片</th>
                        <th>活动时间段</th>
                        <th>奖品可领取时间段</th>
                        <th>创建时间</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($items as $item)
                    <tr>
                        <td>{{ $item->id }}</td>
                        <td>{{ $item->name }}</td>
                        <td>@if($item->image)<img src="{{ $item->image }}" style="max-width:200px;" />@endif</td>
                        <td>{{ $item->start_date }} / {{ $item->end_date }}</td>
                        <td>{{ $item->receive_start_date }} / {{ $item->receive_end_date }}</td>
                        <td>{{ $item->created_at }}</td>
                        <td>
                            <a href="{{route('activity.edit',['id'=>$item->id])}}" class="btn btn-default btn-xs">编辑</a>
                            <a href="{{route('activity.destroy',['id'=>$item->id])}}" class="btn destroy btn-default btn-xs">删除</a>
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