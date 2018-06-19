
@extends('layouts.admin')
@section('content')
    <div class="smart-widget widget-purple">
		<div class="smart-widget-inner">
			<div class="smart-widget-body">
                {{ Form::open(array('route' => ['item.store'], 'class'=>'form-horizontal', 'method'=>'POST', 'id'=>'post-form')) }}
                <div class="form-group">
                    <label for="name" class="col-lg-2 col-md-2 control-label">名称</label>
                    <div class="col-lg-10 col-md-10">
                        <input value="" name="name" type="text" class="form-control" id="name" placeholder="">
                        <label class="help-block" for="" id="help-name"></label>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="words_number" class="col-lg-2 col-md-2 control-label">兑换字数</label>
                    <div class="col-lg-10 col-md-10">
                        <input value="" name="words_number" type="text" class="form-control" id="words_number" placeholder="">
                        <label class="help-block" for="" id="help-words_number"></label>
                    </div>
                </div>

                <div class="form-group">
                    <label for="total_number" class="col-lg-2 col-md-2 control-label">可兑最大数量</label>
                    <div class="col-lg-10 col-md-10">
                        <input value="" name="total_number" type="text" class="form-control" id="total_number" placeholder="">
                        <label class="help-block" for="" id="help-total_number"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="cities" class="col-lg-2 col-md-2 control-label">生效城市【多选】</label>
                    <div class="col-lg-10 col-md-10">
                        <select multiple name="cities[]" class="form-control select2" id="cities">
                            @foreach($cities as $city)
                            <option value="{{ $city->id }}">{{ $city->name }}</option>
                            @endforeach
                        </select>
                        <label class="help-block" for="" id="help-cities"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="activity_id" class="col-lg-2 col-md-2 control-label">活动</label>
                    <div class="col-lg-10 col-md-10">
                        <select name="activity_id" class="form-control" id="activity_id">
                            <option value="" >选择活动/所有</option>
                            @foreach($activities as $activity)
                            <option value="{{ $activity->id }}">{{ $activity->name }}</option>
                            @endforeach
                        </select>
                        <label class="help-block" for="" id="help-activity_id"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="sort_id" class="col-lg-2 col-md-2 control-label">排序ID【从小至大】</label>
                    <div class="col-lg-10 col-md-10">
                        <input name="sort_id" type="text" class="form-control" value="999" id="sort_id" placeholder="">
                        <label class="help-block" for="" id="help-sort_id"></label>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="body" class="col-lg-2 col-md-2 control-label">奖品说明</label>
                    <div class="col-lg-10 col-md-10">
                        <textarea class="form-control" id="body" name="body"></textarea>
                        <label class="help-block" for="" id="body"></label>
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
@endsection @section('scripts')
<script src="/vendor/unisharp/laravel-ckeditor/ckeditor.js"></script>
<script src="/vendor/unisharp/laravel-ckeditor/adapters/jquery.js"></script>

<script>
$('#body').ckeditor({
    filebrowserImageBrowseUrl: '/filemanager?type=Images',
    filebrowserBrowseUrl: '/filemanager?type=Files',
    height: 600
})
</script>
@endsection