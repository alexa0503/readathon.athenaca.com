@extends('layouts.admin')
@push('breadcrump')
<li>页面管理</li>
<li>{{ config('page.blocks.'.Request::input('block_type')) }}</li>
@endpush
@section('content')
    <div class="smart-widget widget-purple">
		<div class="smart-widget-inner">
			<div class="smart-widget-body">
                {{ Form::open(array('route' => ['page.post.store', Request::segment(3)], 'class'=>'form-horizontal', 'method'=>'POST', 'id'=>'post-form')) }}
            <div class="form-group">
                <label for="title" class="col-lg-2 col-md-2 control-label">标题</label>
                <div class="col-lg-10 col-md-10">
                <input name="block_type" value={{ Request::input('block_type') }} type="hidden" />
                    <input value="" id="title" name="title" type="text" class="form-control" id="title" placeholder="">
                    <label class="help-block" for="" id="help-title"></label>
                </div>
            </div>
            <div class="form-group">
                <label for="link" class="col-lg-2 col-md-2 control-label">链接</label>
                <div class="col-lg-10 col-md-10">
                    <input name="link" id="link" type="text" class="form-control" value="" id="sort_id" placeholder="">
                    <label class="help-block" for="" id="help-link"></label>
                </div>
            </div>
            <div class="form-group">
                <label for="sort_id" class="col-lg-2 col-md-2 control-label">排序ID【从小至大】</label>
                <div class="col-lg-10 col-md-10">
                    <input name="sort_id" id="sort_id" type="text" class="form-control" value="999" id="sort_id" placeholder="">
                    <label class="help-block" for="" id="help-sort_id"></label>
                </div>
            </div>
            @if(Request::input('block_type') == 'slides')
            <div class="form-group">
                <label for="image" class="col-lg-2 control-label">图片</label>
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
            @endif
            @if(Request::input('block_type') == 'article')
            <div class="form-group">
                <label for="body" class="col-lg-2 col-md-2 control-label">内容</label>
                <div class="col-lg-10 col-md-10">
                    <textarea class="form-control" id="body" name="body"></textarea>
                    <label class="help-block" for="" id="body"></label>
                </div>
            </div>
            @endif
            @if(Request::input('block_type') == 'text')
            <div class="form-group">
                <label for="body" class="col-lg-2 col-md-2 control-label">内容</label>
                <div class="col-lg-10 col-md-10">
                    <textarea class="form-control" id="body" name="body"></textarea>
                    <label class="help-block" for="" id="body"></label>
                </div>
            </div>
            @endif
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
@if(Request::input('block_type') == 'article')
    $('#body').ckeditor({
        filebrowserImageBrowseUrl: '/filemanager?type=Images',
        filebrowserBrowseUrl: '/filemanager?type=Files',
        height: 600
    })
@endif
    var imagesCount = 0;
</script>
<script src="{{ asset('/js/admin.image.js') }}"></script>
@endsection