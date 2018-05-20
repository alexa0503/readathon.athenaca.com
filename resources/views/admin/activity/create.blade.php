@extends('layouts.admin')
@section('content')
    <div class="smart-widget widget-purple">
		<div class="smart-widget-inner">
			<div class="smart-widget-body">
                {{ Form::open(array('route' => ['activity.store'], 'class'=>'form-horizontal', 'method'=>'POST', 'id'=>'post-form')) }}
                <div class="form-group">
                    <label for="name" class="col-lg-2 col-md-2 control-label">名称</label>
                    <div class="col-lg-10 col-md-10">
                        <input value="" name="name" type="text" class="form-control" id="name" placeholder="">
                        <label class="help-block" for="" id="help-name"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="" class="col-lg-2 col-md-2 control-label">活动时间段</label>
                    <div class="col-lg-3 col-md-3">
                        <input name="start_date" type="text" class="form-control datepicker" value="" id="start_date" placeholder="">
                        <label class="help-block" for="" id="help-start_date"></label>
                    </div>
                    <div class="col-lg-3 col-md-3">
                        <input name="end_date" type="text" class="form-control datepicker" value="" id="end_date" placeholder="">
                        <label class="help-block" for="" id="help-end_date"></label>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="" class="col-lg-2 col-md-2 control-label">可领奖时间段</label>
                    <div class="col-lg-3 col-md-3">
                        <input name="receive_start_date" type="text" class="form-control datepicker" value="" id="receive_start_date" placeholder="">
                        <label class="help-block" for="" id="help-receive_start_date"></label>
                    </div>
                    <div class="col-lg-3 col-md-3">
                        <input name="receive_end_date" type="text" class="form-control datepicker" value="" id="receive_end_date" placeholder="">
                        <label class="help-block" for="" id="help-receive_end_date"></label>
                    </div>
                </div>

                <div class="form-group">
                    <label for="name" class="col-lg-2 control-label">图片</label>
                    <div class="col-lg-10">
                        <div class="row">
                            <div class="col-md-3" id="image-add">
                                <a href="javascript:;" class="image" onclick="addImage()" style="text-align:center">
                                    <img src="{{ asset('images/material-icon-plus.png') }}" title="点击添加" width="100" id="imageAdd" />
                                </a>
                            </div>
                        </div>
                        <label class="help-block" for="" id="help-image"></label>
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
@section('scripts')
<script>
var imagesCount  = 0;
</script>
<script src="{{ asset('/js/admin.image.js') }}"></script>

@endsection