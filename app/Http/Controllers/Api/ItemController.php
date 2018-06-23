<?php
namespace App\Http\Controllers\Api;

use App\Activity;
use App\ActivityUser;
use App\ExchangeLog;
use App\Http\Controllers\Controller;
use App\Http\Resources\Activity as ActivityResource;
use App\Item;
use Carbon\Carbon;
use Illuminate\Http\Request;

class ItemController extends Controller
{
    public function index(Request $request, $id = null)
    {
        $user_id = session('wx.user.id');
        if ($id == null) {
            $dt = Carbon::now();
            $activity = Activity::where('start_date', '<=', $dt)->where('items_end_date', '>=', $dt)->orderBy('start_date', 'DESC')->first();
            if (null == $activity) {
                $activity = Activity::where('start_date', '<=', $dt)->orderBy('start_date', 'ASC')->first();
            }
        } else {
            $activity = Activity::find($id);
        }
        if (null == $activity) {
            return response()->json(['ret' => 1001, 'errMsg' => '当前没有活动哦']);
        }

        $activity_user = ActivityUser::where('activity_id', $activity->id)->where('user_id', $user_id)->first();
        if ($activity_user == null) {
            $rank = null;
        } else {
            $city_id = $activity_user->city_id;
            $age_group_id = $activity_user->age_group_id;
        }

        # 仅显示用户自己城市奖品
        $items = Item::orderBy('sort_id', 'ASC')->where('city_ids', 'LIKE', '%"'.$city_id.'"%')->where('activity_id', $activity->id)->paginate(2);
        $collection = $items->getCollection()->map(function ($item) use ($user_id, $activity, $activity_user) {
            if($activity_user->exchanged_words_number < $item->words_number){
                $received_status = 5; // 字数不够 不可兑换
            }
            elseif( !in_array($activity_user->city_id, $item->city_ids) ){
                $received_status = 6; //非适用城市
            }
            elseif ($item->has_exchanged_number >= $item->total_number) {
                $received_status = 4; // 无库存
            } else {
                $exchange_log = ExchangeLog::where('user_id', $user_id)->where('received_status', 0)->where('item_id', $item->id)->first();
                if (null == $exchange_log) {
                    $received_status = 0; //可兑换
                } else {
                    $received_status = 1; //已兑换
                }

                if ($received_status == 0) {
                    $now = time();
                    //$ts1 = strtotime($activity->start_date);
                    //$ts2 = strtotime($activity->end_date);
                    $ts3 = strtotime($activity->items_start_date);
                    $ts4 = strtotime($activity->items_end_date);
                    if ($now < $ts3) {
                        $received_status = 2;
                    } elseif ($now > $ts4) {
                        $received_status = 3;
                    }
                }
            }

            return [
                'id' => $item->id,
                'name' => $item->name,
                'received_status' => $received_status,
                'body' => $item->body,
                'words_number' => $item->words_number,
                'total_number' => $item->total_number,
                'city_names' => $item->city_names,
                'remaining_number' => $item->total_number - $item->has_exchanged_number,
            ];
        })->toArray();

        $itemsWithPaginator = new \Illuminate\Pagination\LengthAwarePaginator(
            $collection,
            $items->total(),
            $items->perPage(),
            $items->currentPage(), [
                'path' => \Request::url(),
                'query' => [
                    'page' => $items->currentPage(),
                ],
            ]
        );
//return ItemResource::collection($items);
        return response()->json([
            'ret' => 0,
            'data' => [
                'activity' => new ActivityResource($activity),
                'items' => $itemsWithPaginator,
            ],
        ]);
    }

    //领取物品
    public function receive(Request $request, $id)
    {
        $user_id = session('wx.user.id');
        $exchange_log = ExchangeLog::where('item_id', $id)->where('user_id', $user_id)->where('received_status', 0)->first();
        if (null != $exchange_log) {
            return response()->json(['ret' => 1001, 'errMsg' => '您还有此礼品未通过审核'], 403);
        }
        $item = Item::find($id);
        if ($item->has_exchanged_number >= $item->total_number) {
            return response()->json(['ret' => 1002, 'errMsg' => '此礼品已被兑换完了，您来晚了哦'], 403);
        }
        $activity = $item->activity;
        $now = time();
        $ts3 = strtotime($activity->items_start_date);
        $ts4 = strtotime($activity->items_end_date);
        if ($now < $ts3) {
            return response()->json(['ret' => 1003, 'errMsg' => '此礼品还未开始兑换呢'], 403);
        } elseif ($now > $ts4) {
            return response()->json(['ret' => 1004, 'errMsg' => '此礼品超出兑换时间了'], 403);
        }
        $activity_user = ActivityUser::where('activity_id', $activity->id)->where('user_id', $user_id)->first();
        if($activity_user->exchanged_words_number < $item->words_number){
            return response()->json(['ret' => 1005, 'errMsg' => '您字数不够呢'], 403);
        }
        elseif( !in_array($activity_user->city_id, $item->city_ids) ){
            return response()->json(['ret' => 1006, 'errMsg' => '该礼品不能在您的城市兑换'], 403);
        }
        # 物品数量更新
        $item->has_exchanged_number += 1;
        $item->save();

        # 用户活动可兑换字数更新
        $activity_user->exchanged_words_number -= $item->words_number;
        $activity_user->save();
        # 兑换记录插入
        $exchange_log = new ExchangeLog;
        $exchange_log->user_id = $user_id;
        $exchange_log->item_id = $id;
        $exchange_log->activity_id = $item->activity_id;
        $exchange_log->words_number = $item->words_number;
        $exchange_log->received_status = 0;
        $exchange_log->save();
        return response()->json(['ret' => 0]);
    }
}
