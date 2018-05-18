
@extends('layouts.admin') @section('content')
<div class="smart-widget">
    <div class="smart-widget-header">
        <form class="form-inline" action="{{ route('page.post.index', Request::segment(3)) }}">
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
                        <th>标题</th>
                        <th>模块类型</th>
                        <th>内容</th>
                        <th>图片</th>
                        <th>链接</th>
                        <th>创建时间</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($items as $item)
                    <tr>
                        <td>{{ $item->id }}</td>
                        <td>{{ $item->title }}</td>
                        <td>{{ config('page.blocks.'.$item->block_type) }}</td>
                        <td>{{ str_limit($item->body, 100, '...') }}</td>
                        <td>@if($item->image)<a href="{{ asset($item->image) }}" title="点击查看大图" target="_blank"><img src="{{ asset($item->image) }}" style="max-width:100px;" /></a>@else{{ '' }}@endif</td>
                        <td>{{ $item->link }}</td>
                        <td>{{ $item->created_at }}</td>
                        <td>
                            <a href="{{ route('page.post.edit', ['page'=>Request::segment(3),'id'=>$item->id]) }}" class="btn btn-default btn-xs">编辑</a>
                            <a href="{{ route('page.post.destroy', ['page'=>Request::segment(3),'id'=>$item->id]) }}" class="btn destroy btn-default btn-xs">删除</a>
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