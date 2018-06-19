<?php
namespace App\Http\Controllers\Api;

use App\Activity;
use App\ActivityLog;
use App\ActivityUser;
use App\Helpers\Helper;
use App\Http\Controllers\Controller;
use App\Http\Resources\ActivityLog as ActivityLogResource;
use App\Http\Resources\PrizeLog as PrizeLogResource;
use App\Http\Resources\ReadingLog as ReadingLogResource;
use App\PrizeLog;
use App\ReadingLog;
use App\VoteLog;
use App\ExchangeLog;
use App\User;
use DB;
use Illuminate\Http\Request;

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
        $logs = ActivityLog::where('user_id', $user_id)->orderBy('created_at', 'DESC')->paginate(4);
        return ActivityLogResource::collection($logs);
    }
    public function prize(Request $request, $user_id = null)
    {
        if (null == $user_id) {
            $user_id = session('wx.user.id');
        }
        $current_page = (int)$request->input('page');
        if( $current_page < 1 ){
            $current_page = 1;
        }
        $per_page = 4;
        $init = ($current_page - 1)*$per_page;
        $items = DB::select('(SELECT exchange_logs.activity_id,items.name as name,received_status as status,exchange_logs.created_at FROM exchange_logs LEFT JOIN items ON (items.id = exchange_logs.item_id) WHERE user_id = ?) UNION ALL (SELECT prize_logs.activity_id,prizes.name as name,has_checked as status,prize_logs.created_at FROM prize_logs LEFT JOIN prizes ON (prizes.id = prize_logs.prize_id) WHERE user_id = ?) ORDER BY created_at DESC LIMIT ?,?',[$user_id,$user_id,$init,$per_page]);

        $count1 = DB::table('exchange_logs')->where('user_id', $user_id)->count();
        $count2 = DB::table('prize_logs')->where('user_id', $user_id)->count();

        $collection = collect($items)->map(function($item){
            if( $item->status == -1 ){
                $status_name = '取消领取';
            }
            elseif($item->status == 0){
                $status_name = '审核中';
            }
            else{
                $status_name = '已领取';
            }
            $activity = Activity::find($item->activity_id);
            return [
                'activity_name' => $activity->name,
                'status_name' => $status_name,
                'prize_name' => $item->name,
                'created_at' => date('Y-m-d', strtotime($item->created_at))
            ];
        });
       
        $itemsWithPaginator = new \Illuminate\Pagination\LengthAwarePaginator(
            $collection,
            $count1+$count2,
            $per_page,
            $current_page, [
                'path' => \Request::url(),
                'query' => [
                    'page' => $current_page,
                ],
            ]
        );
        $meta = $itemsWithPaginator->toArray();
        unset($meta['data']);
        return ['data'=>$collection,'meta'=>$meta];
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
        $user_id = session('wx.user.id');
        $user = User::find($user_id);
        $validator->after(function ($validator) use ($id, $request, $activity, $user) {
            if ( null == $user || $user->is_activated != 1) {
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
            $activity_user->exchanged_words_number += $request->input('words_number');
            $activity_user->reading_number += 1;
            $activity_user->save();
            DB::commit();
        } catch (\Exception $e) {
            DB::rollBack();
            $validator->errors()->add('book_name', $e->getMessage());
        }
        return [];
    }

    public function vote(Request $request, $activity_user_id)
    {
        $voter_id = session('wx.user.id');
        $activity = Helper::getCurrentActivity();
        $today = date('Y-m-d');
        $voted_add_words_number = env('VOTED_ADD_WORDS_NUMBER', 10);
        $voted_limit_add_times = env('VOTED_LIMIT_ADD_TIMES', 10);

        //判断当前是否有活动
        if (null == $activity) {
            return response()->json(['ret' => 1101, 'errMsg' => '当前没有活动'], 403);
        }
        //判断用户是否参加活动
        $activity_user = ActivityUser::where('user_id', $activity_user_id)->where('activity_id', $activity->id)->first();
        if (null == $activity_user) {
            return response()->json(['ret' => 1102, 'errMsg' => '该用户还没参加活动哦'], 403);
        }

        if ($activity_user->activity_id != $activity->id) {
            return response()->json(['ret' => 1103, 'errMsg' => '活动已结束'], 403);
        }
        //被点赞用户
        $user_id = $activity_user->user_id;
        DB::beginTransaction();
        try {
            $log = VoteLog::where('voter_id', $voter_id)->where('user_id', $user_id)->where('activity_id', $activity->id)->where('vote_date', $today)->first();
            $count = VoteLog::where('user_id', $user_id)->where('activity_id', $activity->id)->where('vote_date', $today)->count();
            //取消点赞
            if (null != $log) {
                $log->delete();
                $has_voted = 0;
                if ($count <= $voted_limit_add_times) {
                    $activity_user->words_number -= $voted_add_words_number;
                    $activity_user->exchanged_words_number -= $voted_add_words_number;
                    /*
                    $activity_log = new ActivityLog;
                    $activity_log->activity_id = $activity->id;
                    $activity_log->reason = '用户取消点赞';
                    $activity_log->words_number = -1*$voted_add_words_number;
                    $activity_log->user_id = $user_id;
                    $activity_log->save();
                    */
                }
                $activity_user->voted_number -= 1;
                $activity_user->save();
            } else {
                $log = new VoteLog;
                $log->user_id = $user_id;
                $log->activity_id = $activity->id;
                $log->voter_id = $voter_id;
                $log->vote_date = $today;
                $log->save();
               
                if ($count < $voted_limit_add_times) {
                    $activity_user->words_number += $voted_add_words_number;
                    $activity_user->exchanged_words_number += $voted_add_words_number;
                    /*
                    $activity_log = new ActivityLog;
                    $activity_log->activity_id = $activity->id;
                    $activity_log->reason = '用户点赞赠送字数';
                    $activity_log->words_number = $voted_add_words_number;
                    $activity_log->user_id = $user_id;
                    $activity_log->save();
                    */
                }
                $activity_user->voted_number += 1;
                $activity_user->save();
                $has_voted = 1;
            }
            DB::commit();
            return response()->json(['ret' => 0, 'data' => [
                'words_number' => $activity_user->words_number,
                'voted_number' => $activity_user->voted_number,
                'has_voted' => $has_voted,
            ]]);
        } catch (Exception $e) {
            DB::rollBack();
            return response()->json(['ret' => 1002, 'errMsg' => $e->getMessage()], 403);
        }
    }
}
