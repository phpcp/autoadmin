<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TaskLog extends Model{
    use HasFactory;
    public $timestamps = false;

    // 格式化ws请求数据
    public static function fmt($request){
    	$uid 		= (int)$request->input('uid', 0);
		$did 		= (int)$request->input('did');
		$data 		= $request->input('data', null);
		if($uid < 1 || $did < 1){
			return false;
		}

		if(is_string($data)){
			$data 	= json_decode($data, true);
		}
		$status 	= $data['status'] ?? null;
		$taskId 	= $data['taskId'] ?? null;
		if($status === null || $taskId === null){
			return false;
		}
		$status 	= (int)$status;
		$taskId 	= (int)$taskId;
		return [
			'uid'		=> $uid,
			'did'		=> $did,
			'status'	=> $status,
			'taskId'	=> $taskId,
			'data'		=> $data,
		];
    }

    // ws请求日志记录
    public static function todb($res, $remark){
    	$task 				= Task::find($res['taskId']);
		if($task){
			$task->status 	= $res['status'];
			$task->save();
			$task_log 				= new TaskLog;
			$task_log->task_id		= $res['taskId'];
			$task_log->admin_id		= $res['uid'];
			$task_log->did			= $res['did'];
			$task_log->status		= $res['status'];
			$task_log->task_title 	= $task->name;
			$task_log->task_type	= $task->task_id;
			$task_log->task_qty 	= $task->quality;
			$task_log->remark		= $remark;
			if(isset($res['data']['data'])){
				$task_log->origin 		= json_encode($res['data']['data']);
			}
			$task_log->addtime		= time();
			if($task_log->save()){
				return true;
			}
		}
		return false;
    }

    // 处理数据
    public static function setTodb($request, $callback){
    	try {
    		$res 		= self::fmt($request);
    		if(!$res){
    			return false;
    		}
    		return self::todb($res, $callback($res['data']));
    	} catch (Exception $e) {
    		return false;
    	}
    }
}
