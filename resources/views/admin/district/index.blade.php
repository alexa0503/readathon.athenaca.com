@extends('layouts.admin') @section('content')
<div class="smart-widget">
    <div class="smart-widget-header">
    </div>
    <div class="smart-widget-inner">
        <div class="smart-widget-body">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>名称</th>
                        <th>城市</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($items as $item)
                    <tr>
                        <td>{{ $item->id }}</td>
                        <td>{{ $item->name }}</td>
                        <td>{{ $item->city->name }}</td>
                        <td>
                            <a href="{{route('district.edit',['id'=>$item->id])}}" class="btn btn-default btn-xs">编辑</a>
                            <a href="{{route('district.destroy',['id'=>$item->id])}}" class="btn destroy btn-default btn-xs">删除</a>
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