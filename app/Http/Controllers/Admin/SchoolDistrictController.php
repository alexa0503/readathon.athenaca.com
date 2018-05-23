<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;
use App\City;
use App\SchoolDistrict as District;

class SchoolDistrictController extends Controller
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
        $items = District::paginate(20);
        return view('admin.district.index', [
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
        return view('admin.district.create', [
            'cities' => City::all(),
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
            'name.*' => '城市名必须填写~',
            'city_id.*' => '请选择城市~',
        ];
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'city_id' => 'required',
        ], $messages);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 403);
        }
        $district = new District;
        $district->name = $request->input('name');
        $district->city_id = $request->input('city_id');
        $district->save();
        return response()->json(['ret' => 0, 'url' => route('district.index')]);
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
        $item = District::find($id);
        return view('admin.district.edit', [
            'item' => $item,
            'cities' => City::all(),
            
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
        $messages = [
            'name.*' => '城市名必须填写~',
            'city_id.*' => '请选择城市~',
        ];
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'city_id' => 'required',
        ], $messages);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 403);
        }
        $district = District::find($id);
        $district->name = $request->input('name');
        $district->city_id = $request->input('city_id');
        $district->save();
        return response()->json(['ret' => 0, 'url' => route('district.index')]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $item = District::find($id);
        $item->delete();
        return response()->json(['ret' => 0]);
    }
}
