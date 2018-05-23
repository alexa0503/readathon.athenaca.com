@extends('layouts.admin')
@section('content')
    <div class="smart-widget widget-purple">
		<div class="smart-widget-inner">
			<div class="smart-widget-body">
                {{ Form::open(array('route' => ['activityUser.update',$item->user_id], 'class'=>'form-horizontal', 'method'=>'PUT', 'id'=>'post-form')) }}
                
                <div class="form-group">
                    <label for="words_number" class="col-lg-2 col-md-2 control-label">阅读字数</label>
                    <div class="col-lg-10 col-md-10">
                        <input value="{{ $item->words_number }}" {{ !$has_permission ? 'readonly' : '' }} name="words_number" type="text" class="form-control" id="name" placeholder="" id="words_number">
                        <label class="help-block" for="" id="help-words_number"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="reading_number" class="col-lg-2 col-md-2 control-label">阅读数（本）</label>
                    <div class="col-lg-10 col-md-10">
                    <input name="activity" value="{{ $item->activity_id }}" type="hidden" />
                        <input value="{{ $item->reading_number }}" {{ !$has_permission ? 'readonly' : '' }} name="reading_number" type="text" class="form-control" id="reading_number" placeholder="">
                        <label class="help-block" for="" id="help-reading_number"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="voted_number" class="col-lg-2 col-md-2 control-label">点赞数</label>
                    <div class="col-lg-10 col-md-10">
                        <input value="{{ $item->voted_number }}" {{ !$has_permission ? 'readonly' : '' }} name="voted_number" type="text" class="form-control" id="name" placeholder="" id="voted_number">
                        <label class="help-block" for="" id="help-voted_number"></label>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="age_group_id" class="col-lg-2 col-md-2 control-label">年龄组</label>
                    <div class="col-lg-10 col-md-10">
                        <select name="age_group_id" id="age_group_id" class="form-control">
                        @foreach($age_groups as $age_group)
                            <option value="{{ $age_group->id }}" {!! $age_group->id == $item->age_group_id ? 'selected="selected"' : '' !!}>{{ $age_group->title }}</option>
                        @endforeach
                        </select>
                        <label class="help-block" for="" id="help-age_group_id"></label>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="age_group_id" class="col-lg-2 col-md-2 control-label">城市</label>
                    <div class="col-lg-10 col-md-10">
                        <select name="city_id" id="city_id" class="form-control">
                        @foreach($cities as $city)
                            <option value="{{ $city->id }}" {!! $city->id == $item->city_id ? 'selected="selected"' : '' !!}>{{ $city->name }}</option>
                        @endforeach
                        </select>
                        <label class="help-block" for="" id="help-age_group_id"></label>
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
var imagesCount  = 1;
@else
var imagesCount  = 0;
@endif
</script>
<script src="{{ asset('/js/admin.image.js') }}"></script>
@endsection