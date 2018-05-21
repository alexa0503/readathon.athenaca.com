@extends('layouts.admin')
@section('content')
    <div class="smart-widget widget-purple">
		<div class="smart-widget-inner">
			<div class="smart-widget-body">
                {{ Form::open(array('route' => ['prize.update',$item->id], 'class'=>'form-horizontal', 'method'=>'PUT', 'id'=>'post-form')) }}
                 
                <div class="form-group">
                    <label for="name" class="col-lg-2 col-md-2 control-label">名称</label>
                    <div class="col-lg-10 col-md-10">
                        <input value="{{ $item->name }}" name="name" type="text" class="form-control" id="name" placeholder="">
                        <label class="help-block" for="" id="help-name"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="activity_id" class="col-lg-2 col-md-2 control-label">活动</label>
                    <div class="col-lg-10 col-md-10">
                        <select name="activity_id" class="form-control" id="activity_id">
                            <option value="" >选择活动</option>
                            @foreach($activities as $activity)
                            <option value="{{ $activity->id }}" {!! $activity->id == $item->activity_id ? 'selected="selected"' : '' !!}>{{ $activity->name }}</option>
                            @endforeach
                        </select>
                        <label class="help-block" for="" id="help-activity_id"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="winning_min_rank" class="col-lg-2 col-md-2 control-label">中奖名次</label>
                    <div class="col-lg-5 col-md-5">
                        <input value="{{ $item->winning_min_rank }}" name="winning_min_rank" type="text" class="form-control" id="winning_min_rank" placeholder="">
                        <label class="help-block" for="" id="help-winning_min_rank"></label>
                    </div>
                    <div class="col-lg-5 col-md-5">
                        <input value="{{ $item->winning_max_rank }}" name="winning_max_rank" type="text" class="form-control" id="winning_max_rank" placeholder="">
                        <label class="help-block" for="" id="help-winning_max_rank"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="sort_id" class="col-lg-2 col-md-2 control-label">排序ID【从小至大】</label>
                    <div class="col-lg-10 col-md-10">
                        <input name="sort_id" type="text" class="form-control" value="{{ $item->sort_id }}" id="sort_id" placeholder="">
                        <label class="help-block" for="" id="help-sort_id"></label>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="body" class="col-lg-2 col-md-2 control-label">奖品说明</label>
                    <div class="col-lg-10 col-md-10">
                        <textarea class="form-control" id="body" name="body">{!! $item->body !!}</textarea>
                        <label class="help-block" for="" id="body"></label>
                    </div>
                </div>

                
            <div class="form-group">
                <label for="image" class="col-lg-2 control-label">幻灯片/头图</label>
                <div class="col-lg-10">
                    <div class="row">
                    @if($item->image)
                        <div class="col-md-3">
                            <a href="javascript:;" title="点击删除" onclick="thumbRemove($(this))" class="thumbnail">
                                <img src="{{ asset($item->image) }}">
                            </a>
                            <input type="hidden" name="image" value="{{ $item->image }}">
                        </div>
                        @endif
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
<script src="/vendor/unisharp/laravel-ckeditor/ckeditor.js"></script>
<script src="/vendor/unisharp/laravel-ckeditor/adapters/jquery.js"></script>
<script>
$('#body').ckeditor({
    filebrowserImageBrowseUrl: '/filemanager?type=Images',
    filebrowserBrowseUrl: '/filemanager?type=Files',
    height: 600
})
@if( $item->image )
var imagesCount  = 1;
@else
var imagesCount  = 0;
@endif
</script>
<script src="{{ asset('/js/admin.image.js') }}"></script>
@endsection
