<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Carbon\Carbon;

class UserController extends Controller
{
    public function __construct()
    {
        $this->middleware(['role:管理员','permission:用户管理']) || $this->middleware(['role:超级管理员']);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $orm = \App\User::orderBy('id', 'ASC');
        if( $request->has('keywords') ){
            $orm->where('name', 'LIKE', '%'.$request->keywords.'%');
        }
        if( $request->city_id ){
            $orm->where('city_id', $request->city_id);
        }
        if( $request->age_id ){
            $age = \App\AgeGroup::find($request->age_id);
            $date1 = Carbon::now()->addYear(-1*$age->min_age);
            $date2 = Carbon::now()->addYear(-1*$age->max_age);
            $orm->where('birthdate', '<', $date1);
            $orm->where('birthdate', '>=', $date2);
        }
        $users = $orm->paginate(20);
        $cities = \App\City::all();
        $ages = \App\AgeGroup::all();
        $administrators = \App\Administrator::all();
        return view('admin.user.index', [
            'items' => $users,
            'cities' => $cities,
            'ages' => $ages,
            'administrators' => $administrators
        ]);
    }

    public function export(Request $request)
    {
        $orm = \App\User::orderBy('id', 'ASC');
        if( $request->has('keywords') ){
            $orm->where('name', 'LIKE', '%'.$request->keywords.'%');
        }
        if( $request->city_id ){
            $orm->where('city_id', $request->city_id);
        }
        if( $request->age_id ){
            $age = \App\AgeGroup::find($request->age_id);
            $date1 = Carbon::now()->addYear(-1*$age->min_age);
            $date2 = Carbon::now()->addYear(-1*$age->max_age);
            $orm->where('birthdate', '<', $date1);
            $orm->where('birthdate', '>=', $date2);
        }
        $filename = date('YmdHis').'.csv';
        $fp = fopen(public_path("downloads/".$filename), 'w');
        fwrite($fp, chr(0xEF).chr(0xBB).chr(0xBF));
        $titles = ["姓名","昵称","城市","电话","生日","在读学员","注册时间"];
        fputcsv($fp, $titles);
        $orm->chunk(30000, function($items) use ($fp){
            foreach ($items as $k => $v) {
                $array = [
                    $v->name,
                    $v->nickname,
                    $v->city->name,
                    $v->tel,
                    $v->birthdate,
                    $v->is_reading,
                    $v->created_at
                ];
                fputcsv($fp, $array);
            }
        });
        fclose($fp);
        return response()->download("downloads/".$filename);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
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
        $user = \App\User::find($id);
        $cities = \App\City::all();
        return view('admin.user.edit', [
            'item' => $user,
            'cities' => $cities,
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
        $user = \App\User::find($id);
        $messages = [
            'name.*' => '姓名必须填写~',
            'nickname.*' => '昵称必须填写~',
            'birthdate.*' => '出生日期必须是日期格式~',
            'city_id.*' => '请选择城市~',
            'tel.*' => '电话必须填写~',
            'is_reading.*' => '请选择是否在读学员~',
            'sex.*' => '请选择性别~',
        ];
        $validator = \Validator::make($request->all(), [
            'name' => 'required',
            'nickname' => 'required',
            'birthdate' => 'required|date',
            'city_id' => 'required|exists:cities,id',
            'tel' => 'required',
            'is_reading' => 'required',
            'sex' => 'required',
        ], $messages);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 403);
        }
        $user->name = $request->input('name');
        $user->nickname = $request->input('nickname');
        $user->birthdate = $request->input('birthdate');
        $user->city_id = $request->input('city_id');
        $user->tel = $request->input('tel');
        $user->is_reading = $request->input('is_reading');
        $user->sex = $request->input('sex');
        $user->save();
        return response()->json(['ret' => 0, 'url' => route('user.index')]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
