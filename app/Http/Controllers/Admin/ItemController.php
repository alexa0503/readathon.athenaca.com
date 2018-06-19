<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;

use App\Item;
use App\Activity;
use App\ExchangeLog;
use App\City;

class ItemController extends Controller
{
    
    public function __construct()
    {
        $this->middleware(['permission:奖品管理']);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $orm = Item::orderBy('sort_id', 'ASC');
        if( $request->has('keywords') ){
            $orm->where('name', 'LIKE', '%'.$request->keywords.'%');
        }
        if( $request->input('activity') ){
            $orm->where('activity_id', $request->activity);
        }
        $items = $orm->paginate(20);
        /*
        $names = City::whereIn('id', $this->city_ids)->get()->map(function($item){
            return $item->name;
        });
        */
        return view('admin.item.index', [
            'items' => $items,
            'activities' => Activity::all()
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        return view('admin.item.create',[
            'activities' => Activity::all(),
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
            'name.*' => '名称必须填写且~',
            'activity_id.*' => '请选择活动~',
            'words_number.*' => '请输入兑换字数~',
            'total_number.*' => '请输入可兑换最大数量~',
            'sort_id.*' => '请输入排序ID，且为数字~',
        ];
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'activity_id' => 'required|exists:activities,id',
            'words_number' => 'required|numeric',
            'total_number' => 'required|numeric',
            'sort_id' => 'required|numeric',
        ], $messages);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 403);
        }
        $item = new Item;
        $item->name = $request->input('name');
        $item->activity_id = $request->input('activity_id');
        $item->words_number = $request->input('words_number');
        $item->total_number = $request->input('total_number');
        $item->city_ids = $request->input('cities') ?: '[]';
        $item->body = $request->input('body') ?: '';
        $item->sort_id = $request->input('sort_id');
        $item->has_exchanged_number = 0;
        $item->save();
        return response()->json(['ret' => 0, 'url' => route('item.index')]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        return view('admin.item.edit',[
            'activities' => Activity::all(),
            'item' => Item::find($id),
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
        $item = Item::find($id);
        
        $messages = [
            'name.*' => '名称必须填写~',
            'activity_id.*' => '请选择活动~',
            'words_number.*' => '请输入兑换字数~',
            'total_number.*' => '请输入可兑换最大数量~',
            'sort_id.*' => '请输入排序ID，且为数字~',
        ];
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'activity_id' => 'required|exists:activities,id',
            'words_number' => 'required|numeric',
            'total_number' => 'required|numeric',
            'sort_id' => 'required|numeric',
        ], $messages);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 403);
        }
        
        $item->name = $request->input('name');
        $item->activity_id = $request->input('activity_id');
        $item->words_number = $request->input('words_number');
        $item->total_number = $request->input('total_number');
        $item->city_ids = $request->input('cities') ?: '[]';
        $item->body = $request->input('body') ?: '';
        $item->sort_id = $request->input('sort_id');
        $item->has_exchanged_number = 0;
        $item->save();
        return response()->json(['ret' => 0, 'url' => route('item.index')]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if( ExchangeLog::where('item_id', $id)->count() > 0){
            return response()->json(['ret'=>1001, 'errMsg'=>'该奖品已经被领取过，无法删除']);
        }
        $item = Item::find($id);
        $item->delete();
        return response()->json(['ret' => 0]);
    }
}
