@extends('layouts.admin')
@section('content')
    <div class="smart-widget widget-purple">
		<div class="smart-widget-inner">
			<div class="smart-widget-body">
                {{ Form::open(array('route' => ['permission.store'], 'class'=>'form-horizontal', 'method'=>'POST', 'id'=>'post-form')) }}
                <div class="form-group">
                    <label for="title" class="col-lg-2 col-md-2 control-label">登录名</label>
                    <div class="col-lg-10 col-md-10">
                        <input value="" name="name" type="text" class="form-control" id="name" placeholder="">
                        <label class="help-block" for="" id="help-name"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="title" class="col-lg-2 col-md-2 control-label">Email</label>
                    <div class="col-lg-10 col-md-10">
                        <input value="" name="email" type="text" class="form-control" id="email" placeholder="">
                        <label class="help-block" for="" id="help-email"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="text" class="col-lg-2 col-md-2 control-label">密码</label>
                    <div class="col-lg-10 col-md-10">
                        <input value="" name="password" type="password" class="form-control" id="password" placeholder="">
                        <label class="help-block" for="" id="help-password"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="text" class="col-lg-2 col-md-2 control-label">角色/供应商</label>
                    <div class="col-lg-10 col-md-10">
                        <select class="form-control select2" name="role[]" id="role" multiple="multiple">
                            <option value="管理员">管理员</option>
                            @foreach($dealers as $dealer)
                            <option value="{{ $dealer->name }}">{{ $dealer->name }}</option>
                            @endforeach
                        </select>
                        <label class="help-block" for="" id="help-role"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="text" class="col-lg-2 col-md-2 control-label">权限</label>
                    <div class="col-lg-10 col-md-10">
                        <select class="form-control select2" name="permission[]" id="permission" multiple="multiple">
                        @foreach($permissions as $permission)
                        <option value="{{ $permission->name }}">{{ $permission->name }}</option>
                        @endforeach
                        </select>
                        <label class="help-block" for="" id="help-permission"></label>
                    </div>
                </div>
				<div class="form-group">
					<div class="col-lg-offset-2 col-md-offset-2 col-lg-10 col-md-10">
						<button type="submit" class="btn btn-success btn-sm">提交</button>
					</div>
				</div>
				{{ Form::close() }}
			</div>
		</div><!-- ./smart-widget-inner -->
	</div>
@endsection
@section('scripts')
<script>
 $().ready(function(){
    $('#post-form').ajaxForm({
        dataType: 'json',
        success: function(json) {
            //$('#post-form').modal('hide');
            $('.form-group').removeClass('has-error');
            alert('操作成功！');
            location.href= json.url;
        },
        error: function(xhr){
            $('.form-group').removeClass('has-error');
            var json = jQuery.parseJSON(xhr.responseText);
            if (xhr.status == 200){
                //$('#post-form').modal('hide');
                alert('操作成功！');
                location.href= json.url;
            }
            $('.help-block').html('');
            $.each(json, function(index,value){
                $('#'+index).parents('.form-group').addClass('has-error');
                $('#help-'+index).html(value);
                //$('#'+index).next('.help-block').html(value);
            });
        }
    });
 })
</script>
@endsection
