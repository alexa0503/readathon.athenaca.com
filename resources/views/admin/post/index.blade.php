
@extends('layouts.admin')
@push('breadcrump')
<li>页面管理</li>
<li>{{ null == $page ? '通用区块' : $page->title }}</li>
@endpush
@section('content')
<div class="smart-widget">
    <div class="smart-widget-header">
        <form id="form-search" class="form-inline" action="{{ route('page.post.index', Request::segment(3)) }}">
            <div class="form-group">
                <select name="block_type" class="form-control" id="block_type">
                <option>选择区块</option>
                @foreach(config('page.blocks') as $key=>$value)
                <option value="{{ $key }}" {!! $key == Request::input('block_type') ? 'selected="selected"' : '' !!}>{{ $value }}</option>
                @endforeach
                </select>
            </div>
            <div class="form-group">
                <a href="{{ route('page.post.create', ['page'=>Request::segment(3),'block_type'=>Request::input('block_type')]) }}" class="btn btn-primary">新增</a>
            </div>
        </form>
    </div>
    <div class="smart-widget-inner">
        <div class="smart-widget-body">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>标题</th>
                        <th>区块</th>
                        @if( in_array(Request::input('block_type'), ['article','text']))<th>内容</th>@endif
                        @if(Request::input('block_type') == 'slides')<th>图片</th>@endif
                        <th>链接</th>
                        <th>创建时间</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                @if(count($items) > 0)
                    @foreach($items as $item)
                    <tr>
                        <td>{{ $item->title }}</td>
                        <td>{{ config('page.blocks.'.$item->block_type) }}</td>
                        @if( in_array(Request::input('block_type'), ['article','text']))<td>{{ str_limit($item->body, 100, '...') }}</td>@endif
                        @if(Request::input('block_type') == 'slides')<td>@if($item->image)<a href="{{ asset($item->image) }}" title="点击查看大图" target="_blank"><img src="{{ asset($item->image) }}" style="max-width:100px;" /></a>@else{{ '' }}@endif</td>@endif
                        <td>{{ $item->link }}</td>
                        <td>{{ $item->created_at }}</td>
                        <td>
                            <a href="{{ route('page.post.edit', ['page'=>Request::segment(3),'id'=>$item->id]) }}" class="btn btn-default btn-xs">编辑</a>
                            <a href="{{ route('page.post.destroy', ['page'=>Request::segment(3),'id'=>$item->id]) }}" class="btn destroy btn-default btn-xs">删除</a>
                        </td>
                    </tr>
                    @endforeach
                @else
                    <tr><td colspan="6">没有数据，请选择对应区块</td></tr>
                @endif
                </tbody>
            </table>
            {!! $items->appends(Request::except('page'))->links() !!}
        </div>
    </div>
    <!-- ./smart-widget-inner -->
</div>
@endsection
@section('scripts')
<script>
    $(function() {
        $('#block_type').change(function(){
            $('#form-search').submit();
        })
    })
</script>
@endsection