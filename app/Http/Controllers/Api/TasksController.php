<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Globals\Ens;
use App\Globals\Responses;
use App\Globals\Wbapi;
use App\Models\Task;
use App\Models\TaskLog;

class TasksController extends Controller{
	public function receiveTaskRes(Request $request)
	{
		//任务状态  1为开始执行 2为执行结束
		$status = $request->input('status');
		//原始包
		$original = $request->input('original');
		$original = json_decode($original,true);
		$taskLog['t_id'] = $original['data']['id'];
		$taskLog['start_time'] = strtotime($original['start']);
		$taskLog['end_time'] = strtotime($original['end']);
		if( $status == 1 ){
			$taskLog['admin_id'] = $original['a_id'];
			$taskLog['status'] = $status;						//1为任务开始
			$taskLog['log'] = [];
			$log['title'] = '任务开始执行';					//标题
			$log['data']  = [
				[
					'title'	=>	'任务执行时间'
					,'text'	=>	'5小时'
				],
				[
					'title'	=>	'视频总数'
					,'text'	=>	'50'
				]
			];
			array_push($taskLog['log'], $log);
			$taskLog['log'] = json_encode($taskLog['log']);
			$taskLog['task_start'] = time();
			$id = TaskLog::insertGetId($taskLog);
			return Responses::success();
		}else{
			$TaskLog = TaskLog::where($taskLog)->first();
			$task['status'] = $status;
			$logArr = json_decode($TaskLog->log);
			//日志包
			$result = $request->input('result');
			$result = json_decode($result,true);
			foreach ($result as $key => $value) {
				$log = [];
				$log['title'] = $value['title'];
				$log['data'] = $value['data'];
				array_push($logArr,$log);
			}
			$task['log'] = json_encode($logArr);
			$task['task_end'] = time();
			TaskLog::where('id','=',$TaskLog->id)->update($task);
			return Responses::success();
		}
	}
		// return Responses::error('错误!');
		
}
