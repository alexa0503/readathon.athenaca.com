@extends('layouts.admin')
@push('breadcrump')
<li>页面管理</li>
<li>{{ config('page.blocks.'.$item->block_type) }}</li>
@endpush
@section('content')
<div class="smart-widget widget-purple">
    <div class="smart-widget-inner">
        <div class="smart-widget-body">
            {{ Form::open(array('route' => ['page.post.update',Request::segment(3),$item->id], 'class'=>'form-horizontal', 'method'=>'PUT', 'id'=>'post-form')) }}
            <div class="form-group">
                <label for="title" class="col-lg-2 col-md-2 control-label">标题</label>
                <div class="col-lg-10 col-md-10">
                    <input value="{{ $item->title }}" id="title" name="title" type="text" class="form-control" id="title" placeholder="">
                    <label class="help-block" for="" id="help-title"></label>
                </div>
            </div>
            <div class="form-group">
                <label for="link" class="col-lg-2 col-md-2 control-label">链接</label>
                <div class="col-lg-10 col-md-10">
                    <input name="link" id="link" type="text" class="form-control" value="{{ $item->link }}" id="sort_id" placeholder="">
                    <label class="help-block" for="" id="help-link"></label>
                </div>
            </div>
            <div class="form-group">
                <label for="sort_id" class="col-lg-2 col-md-2 control-label">排序ID【从小至大】</label>
                <div class="col-lg-10 col-md-10">
                    <input name="sort_id" id="sort_id" type="text" class="form-control" value="{{ $item->sort_id }}" id="sort_id" placeholder="">
                    <label class="help-block" for="" id="help-sort_id"></label>
                </div>
            </div>
            @if($item->block_type == 'slides')
            <div class="form-group">
                <label for="image" class="col-lg-2 control-label">图片</label>
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
            @endif
            @if($item->block_type == 'article')
            <div class="form-group">
                <label for="body" class="col-lg-2 col-md-2 control-label">内容</label>
                <div class="col-lg-10 col-md-10">
                    <textarea class="form-control" id="body" name="body">{!! $item->body !!}</textarea>
                    <label class="help-block" for="" id="body"></label>
                </div>
            </div>
            @endif
            @if($item->block_type == 'text')
            <div class="form-group">
                <label for="body" class="col-lg-2 col-md-2 control-label">内容</label>
                <div class="col-lg-10 col-md-10">
                    <textarea class="form-control" id="body" name="body">{{ $item->body }}</textarea>
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
@if($item->block_type == 'article')
    $('#body').ckeditor({
        filebrowserImageBrowseUrl: '/filemanager?type=Images',
        filebrowserBrowseUrl: '/filemanager?type=Files',
        height: 600
    })
@endif

@if( $item->image )
var imagesCount  = 1;
@else
var imagesCount  = 0;
@endif
</script>
<script src="{{ asset('/js/admin.image.js') }}"></script>
@endsection