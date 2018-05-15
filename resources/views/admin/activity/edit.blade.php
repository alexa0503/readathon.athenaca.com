@extends('layouts.admin')
@section('content')
    <div class="smart-widget widget-purple">
		<div class="smart-widget-inner">
			<div class="smart-widget-body">
                {{ Form::open(array('route' => ['activity.update',$item->id], 'class'=>'form-horizontal', 'method'=>'PUT', 'id'=>'post-form')) }}
                <div class="form-group">
                    <label for="name" class="col-lg-2 col-md-2 control-label">名称</label>
                    <div class="col-lg-10 col-md-10">
                        <input value="{{ $item->name }}" name="name" type="text" class="form-control" id="name" placeholder="">
                        <label class="help-block" for="" id="help-name"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="" class="col-lg-2 col-md-2 control-label">活动时间段</label>
                    <div class="col-lg-3 col-md-3">
                        <input name="start_date" type="text" class="form-control datepicker" value="{{ $item->start_date }}" id="start_date" placeholder="">
                        <label class="help-block" for="" id="help-start_date"></label>
                    </div>
                    <div class="col-lg-3 col-md-3">
                        <input name="end_date" type="text" class="form-control datepicker" value="{{ $item->end_date }}" id="end_date" placeholder="">
                        <label class="help-block" for="" id="help-end_date"></label>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="" class="col-lg-2 col-md-2 control-label">可领奖时间段</label>
                    <div class="col-lg-3 col-md-3">
                        <input name="receive_start_date" type="text" class="form-control datepicker" value="{{ $item->receive_start_date }}" id="receive_start_date" placeholder="">
                        <label class="help-block" for="" id="help-receive_start_date"></label>
                    </div>
                    <div class="col-lg-3 col-md-3">
                        <input name="receive_end_date" type="text" class="form-control datepicker" value="{{ $item->receive_end_date }}" id="receive_end_date" placeholder="">
                        <label class="help-block" for="" id="help-receive_end_date"></label>
                    </div>
                </div>

                <div class="form-group">
                    <label for="name" class="col-lg-2 control-label">图片</label>
                    <div class="col-lg-10">
                        <div class="row">
                            <div class="col-md-3"><a href="javascript:;" title="点击删除" onclick="thumbRemove($(this))" class="thumbnail"><img src="{{ asset($item->image) }}"></a><input type="hidden" name="image" value="{{ $item->image }}"></div>
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
@if( $item->image )
var count = 1;
@else
var count = 0;
@endif
var maxNumber = 1
function thumbRemove(obj) {
    if (confirm('确认删除?')) {
        obj.parent('.col-md-3').remove();
        count--;
        if( count < maxNumber){
            $('#imageAdd').show();
        }
    }
}
function addImage()
{
    if( count >= maxNumber ){
        alert('最多只能添加一张图片')
        return false;
    }
    window.open('{{url("/filemanager?type=Images")}}','upload','fullscreen=no,width=1000,height=600',true);
}
function SetUrl(url1, url2) {
    if( count >= maxNumber ){
        alert('最多只能添加一张图片')
        return false;
    }
    var url = '{{url("/")}}' + url2.replace('//', '/');
    var html = '';
    html +=
        '<div class="col-md-3"><a href="javascript:;" title="点击删除" onclick="thumbRemove($(this))" class="thumbnail"><img src="' +
        url + '" /></a><input type="hidden" name="image" value="' + url + '"></div>';
    $('#image-add').before(html);
    count++ ;
    if( count >= maxNumber ){
        $('#imageAdd').hide();
    }
}
</script>
@endsection