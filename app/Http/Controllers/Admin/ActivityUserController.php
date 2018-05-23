<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;
use App\User;
use App\Activity;
use App\ActivityUser;
use App\City;
use App\AgeGroup;
use Illuminate\Support\Facades\Auth;

class ActivityUserController extends Controller
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

        if( null != $request->input('receive_status') ){
            $orm->where('receive_status', $request->input('receive_status'));
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
        $cities = City::all();
        $ages = AgeGroup::all();
        $activities = Activity::all();
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
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
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
    public function edit(Request $request,$user_id)
    {
        
        $cities = City::all();
        $age_groups = AgeGroup::all();
        $activity_user = ActivityUser::where('user_id', $user_id)
            ->where('activity_id', $request->input('activity'))
            ->first();
        $has_permission = Auth::guard('admin')->user()->hasAnyRole(['超级管理员']);
        return view('admin.activity_user.edit', [
            'item' => $activity_user,
            'age_groups' => $age_groups,
            'cities' => $cities,
            'has_permission' => $has_permission
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $user_id)
    {
        
        $messages = [
            'reading_number.*' => '请输入阅读数，且为数字~',
            'words_number.*' => '请输入阅读字数，且为数字~',
            'voted_number.*' => '请输入点赞数，且为数字~',
            'age_group_id.*' => '请选择年龄组~',
            'city_id.*' => '请选择城市~',
            'receive_status.*' => '请选择核销状态~',
        ];
        $validator = Validator::make($request->all(), [
            'reading_number' => 'required|numeric',
            'words_number' => 'required|numeric',
            'voted_number' => 'required|numeric',
            'age_group_id' => 'required|numeric',
            'city_id' => 'required|numeric',
            'receive_status' => 'required|numeric',
        ], $messages);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 403);
        }
        
        $activity_user = ActivityUser::where('user_id', $user_id)
            ->where('activity_id', $request->input('activity'))
            ->first();
        if( Auth::guard('admin')->user()->hasAnyRole(['超级管理员']) ){
            $activity_user->reading_number = $request->input('reading_number');
            $activity_user->words_number = $request->input('words_number');
            $activity_user->voted_number = $request->input('voted_number');
        }
        $activity_user->age_group_id = $request->input('age_group_id');
        $activity_user->city_id = $request->input('city_id');
        //$activity_user->receive_status = $request->input('receive_status');
        $activity_user->save();
        return response()->json(['ret' => 0, 'url' => route('activityUser.index',['activity'=>$request->input('activity')])]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
    }

}
