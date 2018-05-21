<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;

class AgeController extends Controller
{
    
    
    public function __construct()
    {
        $this->middleware(['permission:年龄管理']);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $orm = \App\AgeGroup::orderBy('sort_id', 'ASC');
        if( $request->has('keywords') ){
            $orm->where('title', 'LIKE', '%'.$request->keywords.'%');
        }
        $cities = $orm->paginate(20);
        return view('admin.age.index', [
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
        $sort_id = \App\AgeGroup::max('sort_id') + 1;
        return view('admin.age.create', [
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
            'title.*' => '标题为必填~',
            'sort_id.*' => '排序ID必须为数字~',
            'min_age.*' => '最小年龄必须为数字~',
            'max_age.*' => '最大年龄必须为数字~',
        ];
        $validator = Validator::make($request->all(), [
            'title' => 'required',
            'sort_id' => 'required|numeric',
            'min_age' => 'required|numeric',
            'max_age' => 'required|numeric',
        ], $messages);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 403);
        }
        $age = new \App\AgeGroup;
        $age->title = $request->input('title');
        $age->sort_id = $request->input('sort_id');
        $age->min_age = $request->input('min_age');
        $age->max_age = $request->input('max_age');
        $age->save();
        return response()->json(['ret' => 0, 'url' => route('age.index')]);
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
        $age = \App\AgeGroup::find($id);
        return view('admin.age.edit', [
            'item' => $age,
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
        $age = \App\AgeGroup::find($id);
        $messages = [
            'title.*' => '标题为必填~',
            'sort_id.*' => '排序ID必须为数字~',
            'min_age.*' => '最小年龄必须为数字~',
            'max_age.*' => '最大年龄必须为数字~',
        ];
        $validator = Validator::make($request->all(), [
            'title' => 'required',
            'sort_id' => 'required|numeric',
            'min_age' => 'required|numeric',
            'max_age' => 'required|numeric',
        ], $messages);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 403);
        }
        $age->title = $request->input('title');
        $age->sort_id = $request->input('sort_id');
        $age->min_age = $request->input('min_age');
        $age->max_age = $request->input('max_age');
        $age->save();
        return response()->json(['ret' => 0, 'url' => route('age.index')]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $age = \App\AgeGroup::find($id);
        $age->delete();
        return response()->json(['ret' => 0]);
    }
}
