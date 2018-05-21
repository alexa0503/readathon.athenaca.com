<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;

class CityController extends Controller
{
    
    public function __construct()
    {
        $this->middleware(['permission:城市管理']);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $orm = \App\City::orderBy('sort_id', 'ASC');
        if( $request->has('keywords') ){
            $orm->where('name', 'LIKE', '%'.$request->keywords.'%');
        }
        $cities = $orm->paginate(20);
        return view('admin.city.index', [
            'items' => $cities,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $sort_id = \App\City::max('sort_id') + 1;
        return view('admin.city.create', [
            'sort_id' => $sort_id ?: 1,
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
            'name.*' => '城市名必须填写且唯一~',
            'sort_id.*' => '排序ID必须为数字~',
        ];
        $validator = Validator::make($request->all(), [
            'name' => 'required|unique:cities',
            'sort_id' => 'required|numeric',
        ], $messages);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 403);
        }
        $city = new \App\City;
        $city->name = $request->input('name');
        $city->sort_id = $request->input('sort_id');
        $city->save();
        return response()->json(['ret' => 0, 'url' => route('city.index')]);
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
        $city = \App\City::find($id);
        return view('admin.city.edit', [
            'item' => $city,
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
        $city = \App\City::find($id);
        $messages = [
            'name.*' => '城市名必须填写且唯一~',
            'sort_id.*' => '排序ID必须为数字~',
        ];
        $validator = Validator::make($request->all(), [
            'name' => 'required|unique:cities,name,' . $city->id . ',id',
            'sort_id' => 'required|numeric',
        ], $messages);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 403);
        }
        $city->name = $request->input('name');
        $city->sort_id = $request->input('sort_id');
        $city->save();
        return response()->json(['ret' => 0, 'url' => route('city.index')]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $count = \App\User::where('city_id', $id)->count();
        if ($count > 0) {
            return response()->json(['ret' => 1001, 'errMsg' => '该城市下有用户无法删除']);
        }
        $city = \App\City::find($id);
        $city->delete();
        return response()->json(['ret' => 0]);
    }
}
