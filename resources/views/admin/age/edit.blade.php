@extends('layouts.admin')
@section('content')
    <div class="smart-widget widget-purple">
		<div class="smart-widget-inner">
			<div class="smart-widget-body">
                {{ Form::open(array('route' => ['age.update',$item->id], 'class'=>'form-horizontal', 'method'=>'PUT', 'id'=>'post-form')) }}
                 <div class="form-group">
                    <label for="title" class="col-lg-2 col-md-2 control-label">标题</label>
                    <div class="col-lg-10 col-md-10">
                        <input value="{{ $item->title }}" name="title" type="text" class="form-control" id="title" placeholder="">
                        <label class="help-block" for="" id="help-title"></label>
                    </div>
                </div>
                 <div class="form-group">
                    <label for="min_age" class="col-lg-2 col-md-2 control-label">最小年龄</label>
                    <div class="col-lg-10 col-md-10">
                        <input value="{{ $item->min_age }}" name="min_age" type="text" class="form-control" id="min_age" placeholder="">
                        <label class="help-block" for="" id="help-min_age"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="max_age" class="col-lg-2 col-md-2 control-label">最大年龄</label>
                    <div class="col-lg-10 col-md-10">
                        <input value="{{ $item->max_age }}" name="max_age" type="text" class="form-control" id="max_age" placeholder="">
                        <label class="help-block" for="" id="help-max_age"></label>
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
					<div class="col-lg-offset-2 col-md-offset-2 col-lg-10 col-md-10">
						<button type="submit" class="btn btn-success btn-sm">提交</button>
					</div>
				</div>
				{{ Form::close() }}
			</div>
		</div>
	</div>
@endsection

