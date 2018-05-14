<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;
use App\User;
use App\Activity;
use App\ActivityUser;

class ActivityUserController extends Controller
{
    
    public function __construct()
    {
        $this->middleware(['role:管理员','permission:活动管理']) || $this->middleware(['role:超级管理员']);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if( $request->input('activity') == null ){
            $activity = Activity::orderBy('start_date', 'DESC')->first();
        }
        else{
            $activity = Activity::find($request->input('activity'));
        }
        $orm = ActivityUser::with('user')->where('activity_id', $activity->id)->orderBy('words_number', 'DESC');

        if( null != $request->input('city_id') ){
            $orm->where('city_id', $request->input('city_id'));
        }

        if( null != $request->input('age_id') ){
            $orm->where('age_id', $request->input('age_id'));
        }

        if( null != $request->input('keywords') ){
            $orm->whereHas('user', function ($query) use($request) {
                $query->where('name', 'LIKE', '%'.$request->keywords.'%');
            });
        }
        $items = $orm->paginate(20);
        $items->getCollection()->transform(function ($item) use($request) {
            $orm = ActivityUser::where('activity_id', $item->activity_id)->where('words_number', '>', $item->words_number);
            if( null != $request->input('city_id') ){
                $orm->where('city_id', $request->input('city_id'));
            }
            if( null != $request->input('age_id') ){
                $orm->where('age_id', $request->input('age_id'));
            }
            $count = $orm->count();
            $item->rank = $count + 1;
            return $item;
        });
        $cities = \App\City::all();
        $ages = \App\AgeGroup::all();
        $activities = \App\Activity::all();
        return view('admin.activity_user.index', [
            'items' => $items,
            'activity' => $activity,
            'ages' => $ages,
            'cities' => $cities,
            'activities' => $activities,
            ''
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.activity_user.create', [
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $messages = [
            'name.*' => '请输入活动名称~',
            'start_date.*' => '请选择活动开始日期~',
            'end_date.*' => '请选择活动结束如期~',
            'receive_start_date.*' => '请选择活动礼品开始领取日期~',
            'receive_end_date.*' => '请选择活动礼品结束领取日期~',
            'image.*' => '请上传图片~',
        ];
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'start_date' => 'required|date',
            'end_date' => 'required|date',
            'receive_start_date' => 'required|date',
            'receive_end_date' => 'required|date',
            'image' => 'required',
        ], $messages);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 403);
        }
        $activity_user = new \App\ActivityUser;
        $activity_user->name = $request->input('name');
        $activity_user->start_date = $request->input('start_date');
        $activity_user->end_date = $request->input('end_date');
        $activity_user->body = $request->input('body') ? : '';
        $activity_user->receive_start_date = $request->input('receive_start_date');
        $activity_user->receive_end_date = $request->input('receive_end_date');
        $activity_user->image = $request->input('image') ? : '';
        $activity_user->save();
        return response()->json(['ret' => 0, 'url' => route('activity_user.index')]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $activity_user = \App\ActivityUser::find($id);
        return view('admin.activity_user.edit', [
            'item' => $activity_user,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $activity_user = \App\ActivityUser::find($id);
        $messages = [
            'name.*' => '请输入活动名称~',
            'start_date.*' => '请选择活动开始日期~',
            'end_date.*' => '请选择活动结束如期~',
            'receive_start_date.*' => '请选择活动礼品开始领取日期~',
            'receive_end_date.*' => '请选择活动礼品结束领取日期~',
            'image.*' => '请上传图片~',
        ];
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'start_date' => 'required|date',
            'end_date' => 'required|date',
            'receive_start_date' => 'required|date',
            'receive_end_date' => 'required|date',
            'image' => 'required',
        ], $messages);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 403);
        }
        $activity_user->name = $request->input('name');
        $activity_user->start_date = $request->input('start_date');
        $activity_user->end_date = $request->input('end_date');
        $activity_user->body = $request->input('body') ? : '';
        $activity_user->receive_start_date = $request->input('receive_start_date');
        $activity_user->receive_end_date = $request->input('receive_end_date');
        $activity_user->image = $request->input('image') ? : '';
        $activity_user->save();
        return response()->json(['ret' => 0, 'url' => route('activity_user.index')]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $activity_user = \App\ActivityUser::find($id);
        if( strtotime($activity_user->start_date) < time() ){
            return response()->json(['ret' => 1001, 'errMsg' => '活动已开始，无法删除']);
        }
        $activity_user->delete();
        return response()->json(['ret' => 0]);
    }

}
