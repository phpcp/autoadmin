<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Device;
use App\Models\Account;
use App\Models\Task;
use App\Globals\Responses;

class DevicesController extends Controller{
    //
    public function deviceusers(Request $request){
    	$data 		= $request->input('data');
    	$uid 		= $request->input('uid');
    	$did 		= $request->input('did');

    	if(!$uid || !$did){
    		return false;
    	}
    	if(empty($data)){
    		return false;
    	}

    	$arr 	= [];
    	Device::where('id', $did)->update(['status' => 0]);
    	foreach($data as $item){
    		$dyid 	= $item['uid'] ?? 0;
    		if(!$dyid){
    			continue;
    		}
    		if(Account::where('uid', $dyid)->count() > 0){
    			$item['status'] 	= 1;
    			Account::where('uid', $dyid)->update($item);
    		}else{
    			$arr[] 	= array_merge($item, ['aid' => $uid, 'did' => $did, 'created_at' => date('Y-m-d H:i:s')]);
    		}
    	}
    	if(!empty($arr)){
    		Account::insert($arr);
    	}
    	Device::where('id', $did)->update(['accounts' => Account::where('did', $did)->count()]);
    }

    // 接收设备账号信息
    public function accounts(Request $request){
        // file_put_contents(__DIR__ . '/2.txt', json_encode($request->all()));
        $adminid    = $request->input('uid');
        $did        = $request->input('did');
        $data       = $request->input('data');
        if(!$data){
            return Responses::error('数据格式错误!');
        }
        if(is_string($data)){
            $data   = json_decode($data, true);
        }
        if(!$data || !isset($data['taskId']) || !isset($data['status'])){
            return Responses::error('数据格式错误!');
        }
        if(!isset($data['data'])){
            $task       = Task::find($data['taskId']);
            if($task){
                $task->status       = $data['status'];
                $task->save();
            }
            return Responses::success();
        }
        $resuData   = $data['data'];
        foreach($resuData as $item){
            if(!isset($item['uid'])){
                continue;
            }
            $uid    = $item['uid'];
            $row    = Account::where('admin_id', $adminid)->where('uid', $uid)->first();
            if(!$row){
                $row                = new Account;
                $row->admin_id      = $adminid;
                $row->uid           = $uid;
                $row->did           = $did;
            }
            $row->uuid              = $item['unique_id'];
            $row->sec_uid           = $item['secUid'];
            $row->short_id          = $item['shortId'];
            $row->unique_id         = $item['unique_id'];
            $row->avatar            = $item['avatar'];
            $row->nickname          = $item['nickname'];
            $row->signature         = $item['signature'];
            $row->follower_count    = $item['follower_count'];
            $row->aweme_count       = $item['aweme_count'];
            $row->total_favorited   = $item['total_favorited'];
            $row->following_count   = $item['following_count'];
            $row->favoriting_count  = $item['favoriting_count'];
            $row->secret            = $item['isSecret'] ? 1 : 0;
            $row->create_time       = $item['createTime'];

            $row->save();
        }
        Device::where('id', $did)->where('admin_id', $adminid)->update(['accounts' => Account::where('did', $did)->where('admin_id', $adminid)->count()]);

        $task       = Task::find($data['taskId']);
        if($task){
            $task->status       = $data['status'];
            $task->save();
        }
        return Responses::success();
    }
}
