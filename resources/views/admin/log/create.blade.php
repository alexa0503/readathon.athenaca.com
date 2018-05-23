@extends('layouts.admin')
@section('content')
    <div class="smart-widget widget-purple">
		<div class="smart-widget-inner">
			<div class="smart-widget-body">
                {{ Form::open(array('route' => ['log.store'], 'class'=>'form-horizontal', 'method'=>'POST', 'id'=>'post-form')) }}
                <div class="form-group">
                    <label for="user_id" class="col-lg-2 col-md-2 control-label">用户ID<br/>多个用“，”分隔</br>[<a href="{{ route('user.index') }}" target="_blank">点击查询</a>]</label>
                    <div class="col-lg-10 col-md-10">
                        <textarea name="user_id"class="form-control" id="user_id">{{ Request::input('user_id') }}</textarea>
                        <label class="help-block" for="" id="help-user_id"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="activity_id" class="col-lg-2 col-md-2 control-label">比赛</label>
                    <div class="col-lg-10 col-md-10">
                        <select name="activity_id" id="activity_id" class="form-control">
                            <option value="" disabled>选择比赛</option>
                            @foreach($activities as $activity)
                            <option value="{{ $activity->id }}" {!! $activity->id == Request::input('activity') ? 'selected="selected"' : '' !!}>{{ $activity->name }}</option>
                            @endforeach
                        </select>
                        <label class="help-block" for="" id="help-activity_id"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="reason" class="col-lg-2 col-md-2 control-label">活动/理由</label>
                    <div class="col-lg-10 col-md-10">
                        <textarea name="reason"class="form-control" id="reason"></textarea>
                        <label class="help-block" for="" id="help-reason"></label>
                    </div>
                </div>
                
                 <div class="form-group">
                    <label for="words_number" class="col-lg-2 col-md-2 control-label">阅读字数</label>
                    <div class="col-lg-10 col-md-10">
                        <input value="" name="words_number" type="text" class="form-control" id="words_number" placeholder="">
                        <label class="help-block" for="" id="help-words_number"></label>
                    </div>
                </div>
				<div class="form-group">
					<div class="col-lg-offset-2 col-md-offset-2 col-lg-10 col-md-10">
						<button type="submit" class="btn btn-success btn-sm">提交</button>
					</div>
				</div>
				{{ Form::close() }}
			</div>
		</div>
	</div>
@endsection