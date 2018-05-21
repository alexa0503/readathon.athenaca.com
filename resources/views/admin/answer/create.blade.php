@extends('layouts.admin')
@section('content')
    <div class="smart-widget widget-purple">
		<div class="smart-widget-inner">
			<div class="smart-widget-body">
                {{ Form::open(array('route' => ['question.answer.store', Request::segment(3)], 'class'=>'form-horizontal', 'method'=>'POST', 'id'=>'post-form')) }}
                <div class="form-group">
                    <label for="question_id" class="col-lg-2 col-md-2 control-label">所属问题</label>
                    <div class="col-lg-10 col-md-10">
                        <select name="question_id" class="form-control" id="question_id">
                            <option value="" >选择问题</option>
                            @foreach($questions as $question)
                            <option value="{{ $question->id }}"  {!! $question->id == Request::segment(3) ? 'selected="selected"' : '' !!}>{{ $question->title }}</option>
                            @endforeach
                        </select>
                        <label class="help-block" for="" id="help-question_id"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="title" class="col-lg-2 col-md-2 control-label">答案</label>
                    <div class="col-lg-10 col-md-10">
                        <input value="" name="title" type="text" class="form-control" id="title" placeholder="">
                        <label class="help-block" for="" id="help-title"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="sort_id" class="col-lg-2 col-md-2 control-label">排序</label>
                    <div class="col-lg-10 col-md-10">
                        <input value="999" name="sort_id" type="text" class="form-control" id="sort_id" placeholder="">
                        <label class="help-block" for="" id="help-sort_id"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="is_right" class="col-lg-2 col-md-2 control-label">是否正确答案</label>
                    <div class="col-lg-10 col-md-10">
						<select name="is_right" class="form-control">
							<option value="0">否</option>
							<option value="1">是</option>
						</select>
                        <label class="help-block" for="" id="help-is_right"></label>
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
