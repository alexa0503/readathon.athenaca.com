@extends('layouts.admin')
@section('content')
    <div class="smart-widget widget-purple">
		<div class="smart-widget-inner">
			<div class="smart-widget-body">
                {{ Form::open(array('route' => ['question.update',$item->id], 'class'=>'form-horizontal', 'method'=>'PUT', 'id'=>'post-form')) }}
                 
                <div class="form-group">
                    <label for="title" class="col-lg-2 col-md-2 control-label">标题</label>
                    <div class="col-lg-10 col-md-10">
                        <input value="{{ $item->title }}" name="title" type="text" class="form-control" id="title" placeholder="">
                        <label class="help-block" for="" id="help-title"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="activity_id" class="col-lg-2 col-md-2 control-label">活动</label>
                    <div class="col-lg-10 col-md-10">
                        <select name="activity_id" class="form-control" id="activity_id">
                            <option value="" >选择活动/所有</option>
                            @foreach($activities as $activity)
                            <option value="{{ $activity->id }}" {!! $activity->id == $item->activity_id ? 'selected="selected"' : '' !!}>{{ $activity->name }}</option>
                            @endforeach
                        </select>
                        <label class="help-block" for="" id="help-activity_id"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="start_date" class="col-lg-2 col-md-2 control-label">日期范围</label>
                    <div class="col-lg-5 col-md-5">
                        <input value="{{ $item->start_date }}" name="start_date" type="text" class="datepicker form-control" id="start_date" placeholder="">
                        <label class="help-block" for="" id="help-start_date"></label>
                    </div>
                    <div class="col-lg-5 col-md-5">
                        <input value="{{ $item->end_date }}" name="end_date" type="text" class="datepicker form-control" id="end_date" placeholder="">
                        <label class="help-block" for="" id="help-end_date"></label>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="rewarded_number" class="col-lg-2 col-md-2 control-label">奖励字数</label>
                    <div class="col-lg-10 col-md-10">
                        <input value="{{ $item->rewarded_number }}" name="rewarded_number" type="text" class="form-control" id="rewarded_number" placeholder="">
                        <label class="help-block" for="" id="help-rewarded_number"></label>
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
