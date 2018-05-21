<?php
namespace App\Http\Controllers\Api;

use App\Helpers\Helper;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\ActivityUser;
use App\Question;
use App\QuestionLog;
use App\QuestionAnswer;
use App\ActivityLog;
use App\User;
use DB;

class QuestionController extends Controller
{
    public function index()
    {
        $user_id = session('wx.user.id');
        $activity = Helper::getCurrentActivity();
        $ret = 0;
        $err_msg = '';
        $data = [];

        if (null == $activity) {
            return response()->json([
                'ret' => 1001,
                'errMsg' => '现在没有可以回答的问题',
                'data' => $data,
            ]);
        }
        $activity_user = ActivityUser::where('activity_id', $activity->id)
            ->where('user_id', $user_id)->first();

        $question = Question::where('activity_id', $activity->id)->first();
        if (null == $question) {
            $ret = 1001;
            $err_msg = '现在没有可以回答的问题';
        } else {
            $log = QuestionLog::where(['question_id' => $question->id, 'user_id' => $user_id])->first();
            $answered_id = $log == null ? null : $log->answered_id;
            $is_right = $log == null ? 0 : $log->is_right;
            $data = [
                'question' => [
                    'title' => $question->title,
                    'id' => $question->id,
                    'rewarded_number' => $question->rewarded_number,
                ],
                'answers' => $question->answers,
                'answered' => $answered_id,
                'is_right' => $is_right,
            ];
            if ($log != null) {
                $ret = 1003;
                $err_msg = '您已经回答过了，期待下次吧。';
            }
            elseif (null == $activity_user) {
                $ret = 1100;
                $err_msg = '您还没参加活动哦。';
            }
        }

        return response()->json([
            'ret' => $ret,
            'errMsg' => $err_msg,
            'data' => $data]);
    }

    public function answer(Request $request, $id)
    {
        
        $user_id = session('wx.user.id');
        $user = User::find($user_id);
        
        if ( null == $user || $user->is_activated != 1) {
            return response()->json(['ret' => 1300, 'errMsg' => '只有激活过才能回答问题哦'], 403);
        }
        $activity = Helper::getCurrentActivity();
        if ($activity == null) {
            return response()->json(['ret' => 1200, 'errMsg' => '活动已过期或者还未开始'], 403);
        }
        $answer_id = $request->input('answer');
        $answer = QuestionAnswer::where('question_id', $id)->where('id', $answer_id)->first();
        if ($answer == null) {
            return response()->json(['ret' => 1001, 'errMsg' => '不存在该问题或者答案'], 403);
        }

        $question = Question::find($id);
        if ($question->activity_id != $activity->id) {
            return response()->json(['ret' => 1003, 'errMsg' => '该问题不属于当前活动'], 403);
        }

        $log = QuestionLog::where(['question_id' => $id, 'user_id' => $user_id])->first();
        if ($log != null) {
            return response()->json(['ret' => 1002, 'errMsg' => '您已经回答过该问题了'], 403);
        }
        DB::beginTransaction();
        try {
            $log = new QuestionLog;
            $log->question_id = $id;
            $log->user_id = $user_id;
            $log->is_right = $answer->is_right;
            $log->answered_id = $answer->id;
            $log->save();
            if ($answer->is_right != '1') {
                DB::commit();
                return response()->json(['ret' => 1003, 'errMsg' => '回答错误'], 403);
            } else {
                $activity_user = ActivityUser::where('activity_id', $activity->id)
                    ->where('user_id', $user_id)->first();
                $activity_user->words_number += $question->rewarded_number;
                $activity_user->save();
                $activity_log = new ActivityLog;
                $activity_log->activity_id = $activity->id;
                $activity_log->reason = '问题回答正确奖励字数';
                $activity_log->words_number = $question->rewarded_number;
                $activity_log->user_id = $user_id;
                $activity_log->save();
                DB::commit();
                return response()->json(['ret' => 0, 'rewarded_number' => $question->rewarded_number]);
            }
        } catch (Exception $e) {
            DB::rollBack();
            return response()->json(['ret' => 1100, 'errMsg' => $e->getMessage()]);
        }
    }
}
