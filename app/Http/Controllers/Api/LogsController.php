<?php
namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Helpers\Helper;
use App\Http\Resources\PrizeLog as PrizeLogResource;
use App\Http\Resources\ReadingLog as ReadingLogResource;
use App\PrizeLog;
use App\ReadingLog;
use App\ActivityUser;
use DB;

class LogsController extends Controller
{
    public function reading(Request $request, $user_id = null)
    {
        if (null == $user_id) {
            $user_id = session('wx.user.id');
        }
        $logs = ReadingLog::where('user_id', $user_id)->orderBy('created_at', 'DESC')->paginate(4);
        return ReadingLogResource::collection($logs);
    }
    public function activity(Request $request, $user_id = null)
    {
        if (null == $user_id) {
            $user_id = session('wx.user.id');
        }
        $logs = ReadingLog::where('user_id', $user_id)->orderBy('created_at', 'DESC')->paginate(4);
        return ReadingLogResource::collection($logs);
    }
    public function prize(Request $request, $user_id = null)
    {
        if (null == $user_id) {
            $user_id = session('wx.user.id');
        }
        $logs = PrizeLog::where('user_id', $user_id)->orderBy('created_at', 'DESC')->paginate(4);
        return PrizeLogResource::collection($logs);
    }
    public function postReading(Request $request)
    {
        $id = session('wx.user.id');
        $messages = [
            'book_name.required' => '请填写姓名~',
            'book_name.max' => '不能多于:max个字符~',
            'book_name.min' => '不能小于:min个字符~',
            'words_number.required' => '请输入字数~',
            'words_number.numeric' => '字数只能为数字~',
            'words_number.max' => '您已超过上限，请分条记录~',
        ];
        $validator = \Validator::make($request->all(), [
            'book_name' => 'required|string|max:100|min:2',
            'words_number' => 'required|numeric|max:10000',
        ], $messages);

        $activity = Helper::getCurrentActivity();
        $validator->after(function ($validator) use ($id, $request, $activity) {
            if (session('wx.user.is_activated') != 1) {
                $validator->errors()->add('book_name', '您的账户还没有被激活');
            }
            if (null == $id) {
                $validator->errors()->add('book_name', '没有权限修改');
            }
            if (null == $activity) {
                $validator->errors()->add('book_name', '当前没有活动');
            }
            //$activity_user = ActivityUser::where('user_id', $id)->where('activity_id', $activity->id)->first();

        });
        if ($validator->fails()) {
            return response()->json($validator->errors(), 403);
        }

        DB::beginTransaction();
        try {
            $log = new ReadingLog;
            $log->user_id = $id;
            $log->book_name = $request->input('book_name');
            $log->activity_id = $activity->id;
            $log->words_number = $request->input('words_number');
            $log->save();
            //ActivityUser::update()
            Helper::checkUserActivity($id, $activity);
            $activity_user = ActivityUser::where('activity_id', $activity->id)->where('user_id', $id)->first();
            $activity_user->words_number += $request->input('words_number');
            $activity_user->reading_number += 1;
            $activity_user->save();
            DB::commit();
        } catch (\Exception $e) {
            DB::rollBack();
            $validator->errors()->add('book_name', $e->getMessage());
        }
        return [];
    }
}
