@extends('layouts.admin') @section('content')
<div class="smart-widget">
    <div class="smart-widget-header">
        <form class="form-inline" action="{{ route('question.index') }}">
            <div class="form-group">
                <input class="form-control" name="keywords" placeholder="输入关键词" value="{{Request::input('keywords')}}" />
            </div>
            <div class="form-group">
                <select name="activity" class="form-control">
                    <option value="">选择活动/所有</option>
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
                        <th>标题</th>
                        <th>答案</th>
                        <th>活动</th>
                        <th>开始日期</th>
                        <th>结束日期</th>
                        <th>奖励字数</th>
                        <th>创建时间</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($items as $item)
                    <tr>
                        <td>{{ $item->title }}</td>
                        <td>@if(count($item->answers) > 0)
                            <table class="table table-bordered">
                            @foreach($item->answers as $answer)
                                <tr><td>{{ $answer->title }}</td><td>{{ $answer->sort_id }}</td><td>{{ $answer->is_right == 1 ? '√' : '×' }}</td><td><a href="{{ route('question.answer.edit', ['question'=>$item->id,'answer'=>$answer->id]) }}" class="btn btn-xs btn-default">编辑</a></td><td><a href="{{ route('question.answer.destroy', ['question'=>$item->id,'answer'=>$answer->id]) }}" class="btn btn-xs btn-default destroy">删除</a></td></tr>
                            @endforeach
                            </table>
                            @endif
                        </td>
                        <td>{{ $item->activity->name }}</td>
                        <td>{{ $item->start_date }}</td>
                        <td>{{ $item->end_date }}</td>
                        <td>{{ $item->rewarded_number }}</td>
                        <td>{{ $item->created_at }}</td>
                        <td>
                            <div class="dropdown">
                                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="true">
                                    操作
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                    <li>
                                        <a href="{{route('question.edit',['id'=>$item->id])}}">编辑问题</a>
                                    </li>
                                    <li>
                                        <a href="{{route('question.answer.create',['question'=>$item->id])}}">新增答案</a>
                                    </li>
                                    <li>
                                        <a href="{{route('question.destroy',['id'=>$item->id])}}" class="destroy">删除问题</a>
                                    </li>
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