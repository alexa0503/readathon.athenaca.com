@extends('layouts.admin') @section('content')
<div class="smart-widget">
    <div class="smart-widget-header">
        <form class="form-inline" action="{{ route('log.index') }}" id="form-search">
            <div class="form-group">
                <input class="form-control" name="keywords" placeholder="输入用户名" value="{{Request::input('keywords')}}" />
            </div>
             <div class="form-group">
                <select name="activity" class="form-control">
                    <option value="" >选择比赛/所有</option>
                    @foreach($activities as $activity)
                    <option value="{{ $activity->id }}" {!! $activity->id == Request::input('activity') ? 'selected="selected"' : '' !!}>{{ $activity->name }}</option>
                    @endforeach
                </select>
            </div>
             <div class="form-group">
                <select name="type" class="form-control">
                    <option value="" disabled>记录类型</option>
                    <option value="activity" {!! Request::input('type') == 'activity' ? 'selected="selected"' : '' !!}>活动记录</option>
                    <option value="reading" {!! Request::input('type') == 'reading' ? 'selected="selected"' : '' !!}>阅读记录</option>
                    <option value="prize" {!! Request::input('type') == 'prize' ? 'selected="selected"' : '' !!}>奖品记录</option>
                    <option value="exchange" {!! Request::input('type') == 'exchange' ? 'selected="selected"' : '' !!}>兑换记录</option>
                </select>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">查询</button>
                <a href="{{ route('log.export') }}" class="btn btn-info btn-export">导出</a>
            </div>
        </form>
    </div>
    <div class="smart-widget-inner">
        <div class="smart-widget-body">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>活动</th>
                        <th>用户</th>
                        @if(Request::input('type') != 'prize')<th>字数</th>@endif
                        @if(Request::input('type') == 'activity')<th>原因</th>
                        @elseif(Request::input('type') == 'prize')<th>排名</th><th>奖品</th><th>状态</th>
                        @elseif(Request::input('type') == 'exchange')<th>奖品</th><th>状态</th>
                        @elseif(Request::input('type') == 'reading')<th>书名</th>@endif
                        <th>创建时间</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($items as $item)
                    <tr>
                        <td>{{ $item->activity->name }}</td>
                        <td>{{ $item->user->name }}</td>
                        @if(Request::input('type') != 'prize')<td>{{ $item->words_number }}</td>@endif
                        @if(Request::input('type') == 'activity')<td>{{ $item->reason }}</td>
                        @elseif(Request::input('type') == 'prize')<td>{{ $item->rank }}</td>
                        <td>{{ $item->prize->name }}</td>
                        <td>{{ $item->has_checked == 0 ? '未核销' : '已核销' }}</td>
                        @elseif(Request::input('type') == 'exchange')
                        <td>{{ $item->item->name }}</td>
                        <td>{{ $item->status_name }}</td>
                        @elseif(Request::input('type') == 'reading')<td>{{ $item->book_name }}</td>@endif
                        <td>{{ $item->created_at }}</td>
                        <td>
                            @if(Request::input('type') !== 'exchange')<a href="{{route('log.destroy',['id'=>$item->id])}}" class="btn destroy btn-default btn-xs">删除</a>@endif
                            @if(Request::input('type') == 'prize')
                            @if($item->has_checked == 0)<a href="{{route('log.check',['id'=>$item->id,'type'=>Request::input('type')])}}" class="btn checked btn-default btn-xs">核销</a>@else
                            <a href="{{route('log.uncheck',['id'=>$item->id,'type'=>Request::input('type')])}}" class="btn checked btn-default btn-xs">撤销核销</a>@endif
                            @elseif(Request::input('type') == 'exchange')
                            @if($item->received_status == 0)<a href="{{route('log.check',['id'=>$item->id,'type'=>Request::input('type')])}}" class="btn checked btn-default btn-xs">核销领取</a>
                            <a href="{{route('log.overdue',['id'=>$item->id,'type'=>Request::input('type')])}}" class="btn checked btn-default btn-xs">过期</a>
                            <a href="{{route('log.uncheck',['id'=>$item->id,'type'=>Request::input('type')])}}" class="btn checked btn-default btn-xs">取消领取</a>@else{{ '--' }}@endif
                            @endif
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
            {!! $items->appends(Request::except('page'))->links() !!}
        </div>
    </div>
</div>
@endsection
@section('scripts')
<script>
$(function() {
    $('.checked').on('click', function(){
        var url = $(this).attr('href');
		if (confirm('确认此操作?')) {
			$.ajax(url, {
				dataType: 'json',
				type: 'get',
				data: {
					_token: window.Laravel.csrfToken
				},
				success: function (json) {
					if (json.ret == 0) {
						window.location.reload();
					} else {
						alert(json.errMsg);
					}
				},
				error: function () {
					alert('请求失败~');
				}
			});
		}
		return false;
    })
})
</script>
@endsection