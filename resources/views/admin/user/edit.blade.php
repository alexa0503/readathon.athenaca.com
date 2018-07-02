@extends('layouts.admin')
@section('content')
    <div class="smart-widget widget-purple">
		<div class="smart-widget-inner">
			<div class="smart-widget-body">
                {{ Form::open(array('route' => ['user.update',$item->id], 'class'=>'form-horizontal', 'method'=>'PUT', 'id'=>'post-form')) }}
                <div class="form-group">
                    <label for="name" class="col-lg-2 col-md-2 control-label">姓名</label>
                    <div class="col-lg-10 col-md-10">
                        <input value="{{ $item->name }}" name="name" type="text" class="form-control" id="name" placeholder="">
                        <label class="help-block" for="" id="help-name"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="nickname" class="col-lg-2 col-md-2 control-label">昵称</label>
                    <div class="col-lg-10 col-md-10">
                        <input value="{{ $item->nickname }}" name="nickname" type="text" class="form-control" id="nickname" placeholder="">
                        <label class="help-block" for="" id="help-nickname"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="birthdate" class="col-lg-2 col-md-2 control-label">出生年月</label>
                    <div class="col-lg-10 col-md-10">
                        <input name="birthdate" type="text" class="datepicker form-control" value="{{ $item->birthdate }}" id="birthdate" placeholder="">
                        <label class="help-block" for="" id="help-birthdate"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="city_id" class="col-lg-2 col-md-2 control-label">城市</label>
                    <div class="col-lg-10 col-md-10">
                        <select name="city_id" class="form-control">
                        @foreach($cities as $city)
                        <option value="{{ $item->city_id }}" {!! $city->id == $item->city_id ? 'selected="selected"' : '' !!}>{{ $city->name }}</option>
                        @endforeach
                        </select>
                        <label class="help-block" for="" id="help-city_id"></label>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="school_district_id" class="col-lg-2 col-md-2 control-label">校区</label>
                    <div class="col-lg-10 col-md-10">
                        <select name="school_district_id" class="form-control" id="school_district_id">
                            <option value="" >选择校区/所有</option>
                            @foreach($districts as $district)
                            <option value="{{ $district->id }}" {!! $district->id == $item->school_district_id ? 'selected="selected"' : '' !!}>{{ $district->name }}</option>
                            @endforeach
                        </select>
                        <label class="help-block" for="" id="help-school_district_id"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="" class="col-lg-2 col-md-2 control-label">联系电话</label>
                    <div class="col-lg-10 col-md-10">
                        <input name="tel" type="text" class="form-control" value="{{ $item->tel }}" id="tel" placeholder="">
                        <label class="help-block" for="" id="help-tel"></label>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="" class="col-lg-2 col-md-2 control-label">性别</label>
                    <div class="col-lg-10 col-md-10">
                        <select name="sex" class="form-control">
                        <option value="0" {!! $item->sex == '0' ? 'selected="selected"' : '' !!}>男</option>
                        <option value="1" {!!$item->sex == '1' ? 'selected="selected"' : '' !!}>女</option>
                        </select>
                        <label class="help-block" for="" id="help-tel"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="tel" class="col-lg-2 col-md-2 control-label">在读学员</label>
                    <div class="col-lg-10 col-md-10">
                        <select name="is_reading" class="form-control">
                        <option value="1" {!! $item->is_reading == 1 ? 'seis_readinglected="selected"' : '' !!}>是</option>
                        <option value="0" {!!$item->is_reading == 0 ? 'selected="selected"' : '' !!}>否</option>
                        </select>
                        <label class="help-block" for="" id="help-tel"></label>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="" class="col-lg-2 col-md-2 control-label">GE</label>
                    <div class="col-lg-10 col-md-10">
                        <input name="ge" type="text" class="form-control" value="{{ $item->ge }}" id="ge" placeholder="">
                        <label class="help-block" for="" id="help-ge"></label>
                    </div>
                </div>

                <div class="form-group">
                    <label for="" class="col-lg-2 col-md-2 control-label">备注</label>
                    <div class="col-lg-10 col-md-10">
                        <textarea name="remark" type="text" class="form-control" id="remark">{{ $item->remark }}</textarea>
                        <label class="help-block" for="" id="help-remark"></label>
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

