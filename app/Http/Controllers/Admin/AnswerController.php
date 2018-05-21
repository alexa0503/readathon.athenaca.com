<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
use App\Question;
use App\QuestionAnswer as Answer;

class AnswerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.answer.create', [
            'questions' => Question::all()
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request, $question)
    {
        $messages = [
            'title.*' => '请输入答案~',
            'question_id.*' => '请选择活动~',
            'sort_id.*' => '请输入排序ID，且只能为数字~',
            'is_right.*' => '请选择是否正确答案~',
        ];
        $validator = Validator::make($request->all(), [
            'title' => 'required',
            'question_id' => 'required|exists:questions,id',
            'is_right' => 'required',
            'sort_id' => 'required|numeric'
        ], $messages);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 403);
        }
        $answer = new Answer;
        $answer->title = $request->input('title');
        $answer->question_id = $request->input('question_id');
        $answer->sort_id = $request->input('sort_id');
        $answer->is_right = $request->input('is_right');
        $answer->save();
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
    public function edit($question, $answer)
    {
        return view('admin.answer.edit', [
            'item' => Answer::find($answer),
            'questions' => Question::all()
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $question, $answer)
    {
        $messages = [
            'title.*' => '请输入答案~',
            'question_id.*' => '请选择活动~',
            'sort_id.*' => '请输入排序ID，且只能为数字~',
            'is_right.*' => '请选择是否正确答案~',
        ];
        $validator = Validator::make($request->all(), [
            'title' => 'required',
            'question_id' => 'required|exists:questions,id',
            'is_right' => 'required',
            'sort_id' => 'required|numeric'
        ], $messages);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 403);
        }
        $answer = Answer::find($answer);
        $answer->title = $request->input('title');
        $answer->question_id = $request->input('question_id');
        $answer->sort_id = $request->input('sort_id');
        $answer->is_right = $request->input('is_right');
        $answer->save();
        return response()->json(['ret' => 0, 'url' => route('question.index')]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($question, $id)
    {
        $answer = Answer::find($id);
        $answer->delete();
        return response()->json(['ret' => 0]);
    }
}
