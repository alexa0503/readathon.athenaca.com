@extends('layouts.admin') @section('content')
<div class="smart-widget">
    <div class="smart-widget-header">
        <form class="form-inline" action="{{ route('age.index') }}">
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
                        <th>最小年龄</th>
                        <th>最大年龄</th>
                        <th>排序ID</th>
                        <th>创建时间</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($items as $item)
                    <tr>
                        <td>{{ $item->id }}</td>
                        <td>{{ $item->title }}</td>
                        <td>{{ $item->min_age }}</td>
                        <td>{{ $item->max_age }}</td>
                        <td>{{ $item->sort_id }}</td>
                        <td>{{ $item->created_at }}</td>
                        <td>
                            <a href="{{route('age.edit',['id'=>$item->id])}}" class="btn btn-default btn-xs">编辑</a>
                            <a href="{{route('age.destroy',['id'=>$item->id])}}" class="btn destroy btn-default btn-xs">删除</a>
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