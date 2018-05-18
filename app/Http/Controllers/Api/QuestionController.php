<?php
namespace App\Http\Controllers\Api;

use App\Helpers\Helper;
use App\Http\Controllers\Controller;

use App\ActivityUser;
use App\Question;
use App\QuestionLog;

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
                'answered' => $log->answered_id,
                'is_right' => $log->is_right,
            ];
            if ($log != null) {
                $ret = 1003;
                $err_msg = '已经没有可以回答的问题了';
            }
            elseif (null == $activity_user) {
                $ret = 1100;
                $err_msg = '您还没用参加活动';
            }
        }

        return response()->json([
            'ret' => $ret,
            'errMsg' => $err_msg,
            'data' => $data]);
    }
}
