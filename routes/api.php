<?php

use App\Activity;
use App\ActivityLog;
use App\ActivityUser;
use App\Helpers\Helper;
use App\Helpers\Wx;
use App\Http\Resources\Activity as ActivityResource;
use App\Http\Resources\ActivityLog as ActivityLogResource;
use App\Http\Resources\ActivityUser as ActivityUserResource;
use App\Http\Resources\AgeGroup as AgeGroupResource;
use App\Http\Resources\City as CityResource;
use App\Http\Resources\Page as PageResource;
use App\Http\Resources\Post as PostResource;
use App\Http\Resources\PrizeLog as PrizeLogResource;
use App\Http\Resources\ReadingLog as ReadingLogResource;
use App\Http\Resources\User as UserResource;
use App\Prize;
use App\PrizeLog;
use App\Question;
use App\ReadingLog;
use App\User;
use Carbon\Carbon;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
 */
use Illuminate\Http\Request;
/*
Route::middleware('auth:api')->get('/user', function (Request $request) {
return $request->user();
});
 */
Route::group(['middleware' => ['wx.auth']], function () {
    Route::get('user/{id?}', 'Api\UserController@index');
    Route::get('board', 'Api\UserController@board');
    Route::post('register', 'Api\UserController@register');
    Route::post('profile', 'Api\UserController@updateProfile');

    Route::get('/cities', function (Request $request) {
        $cities = \App\City::orderBy('sort_id', 'ASC')->get();
        return CityResource::collection($cities);
    });

    Route::get('/activities', function (Request $request) {
        $limit = $request->input('limit') ?: 100;
        $activities = \App\Activity::orderBy('start_date', 'DESC')->limit($limit)->get();
        return ActivityResource::collection($activities);
    });

    Route::get('/agegroups', function (Request $request) {
        $aget_groups = \App\AgeGroup::orderBy('sort_id', 'ASC')->get();
        return AgeGroupResource::collection($aget_groups);
    });



    //日志相关
    Route::get('/logs/reading/{user_id?}', 'Api\LogsController@reading');
    Route::get('/logs/activity/{user_id?}', 'Api\LogsController@activity');
    Route::get('/logs/prize/{user_id?}', 'Api\LogsController@prize');
    Route::post('/logs/reading', 'Api\LogsController@postReading');
    Route::any('/vote/{activity_user_id}', 'Api\LogsController@vote');
    
    Route::get('/question', 'Api\QuestionController@index');
    
    Route::post('answer/{id}', function (Request $request, $id = null) {
        if (session('wx.user') && session('wx.user.is_activated') != 1) {
            return response()->json(['ret' => 1300, 'errMsg' => '只有激活过才能回答问题哦'], 403);
        }
        $activity = Helper::getCurrentActivity();
        if ($activity == null) {
            return response()->json(['ret' => 1200, 'errMsg' => '活动已过期或者还未开始'], 403);
        }
        $user_id = session('wx.user.id');
        $answer_id = $request->input('answer');
        $answer = App\QuestionAnswer::where('question_id', $id)->where('id', $answer_id)->first();
        if ($answer == null) {
            return response()->json(['ret' => 1001, 'errMsg' => '不存在该问题或者答案'], 403);
        }

        $question = Question::find($id);
        if ($question->activity_id != $activity->id) {
            return response()->json(['ret' => 1003, 'errMsg' => '该问题不属于当前活动'], 403);
        }

        $log = App\QuestionLog::where(['question_id' => $id, 'user_id' => $user_id])->first();
        if ($log != null) {
            return response()->json(['ret' => 1002, 'errMsg' => '您已经回答过该问题了'], 403);
        }
        DB::beginTransaction();
        try {
            $log = new App\QuestionLog;
            $log->question_id = $id;
            $log->user_id = $user_id;
            $log->is_right = $answer->is_right;
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
    });

    //奖品列表
    Route::get('/prizes/{id?}', function (Request $request, $id = null) {
        //$activity = Helper::getCurrentActivity();
        //获取最近一次可以领取奖品的活动
        if ($id == null) {
            $dt = Carbon::now();
            $activity = Activity::where('start_date', '<=', $dt)->orderBy('start_date', 'ASC')->first();
        } else {
            $activity = Activity::find($id);
        }
        $user_id = session('wx.user.id');
        if (null == $activity) {
            return response()->json(['ret' => 1001, 'errMsg' => '当前没有活动哦']);
        }

        $activity_user = ActivityUser::where('activity_id', $activity->id)->where('user_id', $user_id)->first();
        if ($activity_user == null) {
            $rank = null;
            //return response()->json(['ret' => 1002, 'errMsg' => '你没有办法获取该活动得奖品']);
        } else {
            $rank = $activity_user->getRank();
        }

        $prizes = App\Prize::where('activity_id', $activity->id)->paginate(2);
        $collection = $prizes->getCollection()->map(function ($item) use ($user_id, $rank, $activity) {
            $prize_log = PrizeLog::where('user_id', $user_id)->where('activity_id', $item->activity_id)->first();
            if (null == $prize_log) {
                $received_status = 0;
            } elseif ($prize_log->prize_id == $item->id) {
                $received_status = 1;
            } else {
                $received_status = 6; //已领取其他奖品
            }

            $now = time();
            $ts1 = strtotime($activity->start_date);
            $ts2 = strtotime($activity->end_date);

            $ts3 = strtotime($activity->receive_start_date);
            $ts4 = strtotime($activity->receive_end_date);

            //dd($ts2,$now);
            if ($now < $ts2) {
                $received_status = 2;
            } elseif ($now < $ts3) {
                $received_status = 3;
            } elseif ($now > $ts4) {
                $received_status = 4;
            }
            if ($rank == null) {
                $received_status = 7; //没有排名
            }
            //dd($rank,$item->winning_min_rank,$item->winning_max_rank);
            elseif ($rank < $item->winning_min_rank || $rank > $item->winning_max_rank) {
                $received_status = 5;
            }

            return [
                'id' => $item->id,
                'name' => $item->name,
                'received_status' => $received_status,
                'body' => $item->body,
                'winning_min_rank' => $item->winning_min_rank,
                'winning_max_rank' => $item->winning_max_rank,
            ];
        })->toArray();
        //dd($collection);
        $prizesWithPaginator = new \Illuminate\Pagination\LengthAwarePaginator(
            $collection,
            $prizes->total(),
            $prizes->perPage(),
            $prizes->currentPage(), [
                'path' => \Request::url(),
                'query' => [
                    'page' => $prizes->currentPage(),
                ],
            ]
        );
        //return PrizeResource::collection($prizes);
        return response()->json([
            'ret' => 0,
            'data' => [
                'activity' => new ActivityResource($activity),
                'prizes' => $prizesWithPaginator,
            ],
        ]);
    });
    Route::post('/receive/{id}', function (Request $request, $id = null) {

        $prize = Prize::where('id', $id)->first();
        $user_id = session('wx.user.id');

        if (null == $user_id) {
            return response()->json(['ret' => 1200, 'errMsg' => '请登陆'], 403);
        }
        if (null == $prize) {
            return response()->json(['ret' => 1001, 'errMsg' => '该奖品不存在'], 403);
        }

        $prize_log = PrizeLog::where('user_id', $user_id)->where('activity_id', $prize->activity_id)->first();
        if (null != $prize_log) {
            return response()->json(['ret' => 1002, 'errMsg' => '您已经领取过奖品了'], 403);
        }

        $activity = $prize->activity;
        $now = time();
        $ts1 = strtotime($activity->start_date);
        $ts2 = strtotime($activity->end_date);

        $ts3 = strtotime($activity->receive_start_date);
        $ts4 = strtotime($activity->receive_end_date);

        if ($now < $ts2) {
            return response()->json(['ret' => 1003, 'errMsg' => '活动未结束，该奖品暂时无法领取'], 403);
        }
        if ($now < $ts3) {
            return response()->json(['ret' => 1004, 'errMsg' => '该奖品还没有到可以领取的时间'], 403);
        }
        if ($now > $ts4) {
            return response()->json(['ret' => 1005, 'errMsg' => '该奖品领取时间已过期'], 403);
        }
        $activity_user = ActivityUser::where('activity_id', $activity->id)->where('user_id', $user_id)->first();
        $rank = $activity_user->getRank();
        if ($rank < $prize->winning_min_rank || $rank > $prize->winning_max_rank) {
            return response()->json(['ret' => 1006, 'errMsg' => '您没有中到此奖品'], 403);
        }

        $prize_log = new PrizeLog;
        $prize_log->activity_id = $activity->id;
        $prize_log->user_id = $user_id;
        $prize_log->prize_id = $id;
        $prize_log->rank = $rank;
        $prize_log->save();
        return response()->json(['ret' => 0]);
    });

    Route::get('/page/{name?}/{block_type?}', function (Request $request, $name = null, $block_type = null) {
        $page = App\Page::where('name', $name)->first();
        if (null == $page) {
            return response()->json(['ret' => 1001, 'errMsg' => '没有此页面'], 403);
        }
        return new PageResource($page, $block_type);
    });
    Route::get('/posts/{name}/{block_type?}', function (Request $request, $name = null, $block_type) {
        $page = App\Page::where('name', $name)->first();
        if (null == $page) {
            $orm = App\Post::where('page_id', null)->where('block_type', $block_type);
        } else {
            $orm = App\Post::where('page_id', $page->id)->where('block_type', $block_type);
        }
        if ($block_type == 'slides') {
            //如果该页面没用幻灯片内容 则取默认
            $count = $orm->count();
            if( $count == 0 ){
                $orm = App\Post::where('page_id', null)->where('block_type', $block_type);
            }
            $posts = $orm->get();
        } else {
            $posts = $orm->paginate(2);
        }

        return PostResource::collection($posts);
    });

    //微信分享接口
    Route::get('/wx/share', 'Api\WxController@share');
    Route::get('/wx/avatar/{media_id}', 'Api\WxController@media');
});
