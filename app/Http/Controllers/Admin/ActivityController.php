<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;
use App\Activity;
use App\ActivityUser;

class ActivityController extends Controller
{
    public function __construct()
    {
        $this->middleware(['permission:活动管理']);
    }
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $orm = \App\Activity::orderBy('start_date', 'DESC');
        if( $request->has('keywords') ){
            $orm->where('name', 'LIKE', '%'.$request->keywords.'%');
        }
        $items = $orm->paginate(20);
        return view('admin.activity.index', [
            'items' => $items,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.activity.create', [
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
        $activity = new \App\Activity;
        $activity->name = $request->input('name');
        $activity->start_date = $request->input('start_date');
        $activity->end_date = $request->input('end_date');
        $activity->body = $request->input('body') ? : '';
        $activity->receive_start_date = $request->input('receive_start_date');
        $activity->receive_end_date = $request->input('receive_end_date');
        $activity->image = $request->input('image') ? : '';
        $activity->save();
        return response()->json(['ret' => 0, 'url' => route('activity.index')]);
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
        $activity = \App\Activity::find($id);
        return view('admin.activity.edit', [
            'item' => $activity,
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
        $activity = \App\Activity::find($id);
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
        $activity->name = $request->input('name');
        $activity->start_date = $request->input('start_date');
        $activity->end_date = $request->input('end_date');
        $activity->body = $request->input('body') ? : '';
        $activity->receive_start_date = $request->input('receive_start_date');
        $activity->receive_end_date = $request->input('receive_end_date');
        $activity->image = $request->input('image') ? : '';
        $activity->save();
        return response()->json(['ret' => 0, 'url' => route('activity.index')]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $activity = \App\Activity::find($id);
        if( strtotime($activity->start_date) < time() ){
            return response()->json(['ret' => 1001, 'errMsg' => '活动已开始，无法删除']);
        }
        $activity->delete();
        return response()->json(['ret' => 0]);
    }

}
