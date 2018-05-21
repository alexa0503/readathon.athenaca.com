<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;

use App\Question;
use App\Activity;

class QuestionController extends Controller
{
    public function __construct()
    {
        $this->middleware(['permission:问答管理']);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        
        $orm = Question::orderBy('created_at', 'DESC');
        if( $request->has('keywords') ){
            $orm->where('title', 'LIKE', '%'.$request->keywords.'%');
        }
        $items = $orm->paginate(20);
        return view('admin.question.index', ['items'=>$items,'activities'=>Activity::all()]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        
        return view('admin.question.create', [
            'activities'=>Activity::all()
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
            'title.*' => '请填写标题~',
            'activity_id.*' => '请选择活动~',
            'start_date.*' => '请选择开始日期~',
            'end_date.*' => '请选择结束日期~',
            'rewarded_number.*' => '请输入奖励字数，且必须为数字~',
        ];
        $validator = Validator::make($request->all(), [
            'title' => 'required',
            'activity_id' => 'required|exists:activities,id',
            'start_date' => 'required|date',
            'end_date' => 'required|date',
            'rewarded_number' => 'required|numeric'
        ], $messages);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 403);
        }
        $question = new Question;
        $question->title = $request->input('title');
        $question->activity_id = $request->input('activity_id');
        $question->start_date = $request->input('start_date');
        $question->end_date = $request->input('end_date');
        $question->rewarded_number = $request->input('rewarded_number');
        $question->save();
        return response()->json(['ret' => 0, 'url' => route('question.index')]);
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
        return view('admin.question.edit', [
            'item' => Question::find($id),
            'activities'=>Activity::all()
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
            'title.*' => '请填写标题~',
            'activity_id.*' => '请选择活动~',
            'start_date.*' => '请选择开始日期~',
            'end_date.*' => '请选择结束日期~',
            'rewarded_number.*' => '请输入奖励字数，且必须为数字~',
        ];
        $validator = Validator::make($request->all(), [
            'title' => 'required',
            'activity_id' => 'required|exists:activities,id',
            'start_date' => 'required|date',
            'end_date' => 'required|date',
            'rewarded_number' => 'required|numeric'
        ], $messages);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 403);
        }
        $question = Question::find($id);
        $question->title = $request->input('title');
        $question->activity_id = $request->input('activity_id');
        $question->start_date = $request->input('start_date');
        $question->end_date = $request->input('end_date');
        $question->rewarded_number = $request->input('rewarded_number');
        $question->save();
        return response()->json(['ret' => 0, 'url' => route('question.index')]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $question = Question::find($id);
        $question->answers()->delete();
        $question->delete();
        return response()->json(['ret' => 0]);
    }
}
