@extends('layouts.admin')
@section('content')
    <div class="smart-widget widget-purple">
		<div class="smart-widget-inner">
			<div class="smart-widget-body">
                {{ Form::open(array('route' => ['city.update',$item->id], 'class'=>'form-horizontal', 'method'=>'PUT', 'id'=>'post-form')) }}
                 <div class="form-group">
                    <label for="name" class="col-lg-2 col-md-2 control-label">名称</label>
                    <div class="col-lg-10 col-md-10">
                        <input value="{{ $item->name }}" name="name" type="text" class="form-control" id="name" placeholder="">
                        <label class="help-block" for="" id="help-name"></label>
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

