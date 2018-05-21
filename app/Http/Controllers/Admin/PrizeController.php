<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;

use App\Prize;
use App\Activity;
use App\PrizeLog;

class PrizeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $orm = Prize::orderBy('sort_id', 'ASC');
        if( $request->has('keywords') ){
            $orm->where('name', 'LIKE', '%'.$request->keywords.'%');
        }
        if( $request->input('activity') ){
            $orm->where('activity_id', $request->activity);
        }
        $items = $orm->paginate(20);
        return view('admin.prize.index', [
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
        return view('admin.prize.create',[
            'activities' => Activity::all()
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
            'name.*' => '名称必须填写且唯一~',
            'activity_id.*' => '请选择活动~',
            'winning_min_rank.*' => '请输入中奖所需最高排名，且为数字~',
            'winning_max_rank.*' => '请输入中奖所需最低排名，且为数字~',
            'sort_id.*' => '请输入排序ID，且为数字~',
        ];
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'activity_id' => 'required|exists:activities,id',
            'winning_min_rank' => 'required|numeric',
            'winning_max_rank' => 'required|numeric',
            'sort_id' => 'required|numeric',
        ], $messages);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 403);
        }
        $prize = new Prize;
        $prize->name = $request->input('name');
        $prize->activity_id = $request->input('activity_id');
        $prize->winning_min_rank = $request->input('winning_min_rank');
        $prize->winning_max_rank = $request->input('winning_max_rank');
        $prize->body = $request->input('body') ?: '';
        $prize->sort_id = $request->input('sort_id');
        $prize->image = $request->input('image') ?: '';
        $prize->save();
        return response()->json(['ret' => 0, 'url' => route('prize.index')]);
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
        return view('admin.prize.edit',[
            'activities' => Activity::all(),
            'item' => Prize::find($id)
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
        $prize = Prize::find($id);
        $messages = [
            'name.*' => '名称必须填写且唯一~',
            'activity_id.*' => '请选择活动~',
            'winning_min_rank.*' => '请输入中奖所需最高排名，且为数字~',
            'winning_max_rank.*' => '请输入中奖所需最低排名，且为数字~',
            'sort_id.*' => '请输入排序ID，且为数字~',
        ];
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'activity_id' => 'required|exists:activities,id',
            'winning_min_rank' => 'required|numeric',
            'winning_max_rank' => 'required|numeric',
            'sort_id' => 'required|numeric',
        ], $messages);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 403);
        }
        $prize->name = $request->input('name');
        $prize->activity_id = $request->input('activity_id');
        $prize->winning_min_rank = $request->input('winning_min_rank');
        $prize->winning_max_rank = $request->input('winning_max_rank');
        $prize->body = $request->input('body') ?: '';
        $prize->sort_id = $request->input('sort_id');
        $prize->image = $request->input('image') ?: '';
        $prize->save();
        return response()->json(['ret' => 0, 'url' => route('prize.index')]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if( PrizeLog::where('prize_id', $id)->count() > 0){
            return response()->json(['ret'=>1001, 'errMsg'=>'该奖品已经被领取过，无法删除']);
        }
        $prize = Prize::find($id);
        $prize->delete();
        return response()->json(['ret' => 0]);
    }
}
