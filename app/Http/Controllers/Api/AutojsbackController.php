<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\TaskLog;
use App\Models\Task;
use App\Globals\Responses;
use Illuminate\Support\Facades\Storage;

class AutojsbackController extends Controller{
	// 养号回调
	public function raise(Request $request){
		//{"type":"raise","code":200,"msg":null,"data":{"status":1,"taskId":5},"noreback":true,"uid":2,"did":54}
		//{"type":"raise","code":200,"msg":"\u6210\u529f\uff01","data":{"data":[{"commentProNum":0,"dianzanNum":0,"realSeetimeNum":43,"result":true,"seetimeNum":43,"username":"zhutoushini666","videoNum":7}],"status":10,"taskId":5},"noreback":true,"uid":2,"did":54}
		$rs 	= TaskLog::setTodb($request, function($data){
			if(isset($data['data'])){
				try {
					$remark 	= [];
					$fmt 		= ': 观看视频数(%d), 时长:%d秒, 评论数量(%d), 点赞数量(%d)';
					foreach($data['data'] as $item){
						if($item['result']){
							$str 		= sprintf($fmt, $item['videoNum'], $item['realSeetimeNum'], $item['commentProNum'], $item['dianzanNum']);
							$remark[]	= $item['username'] . $str;
						}else{
							$remark[]	= $item['username'] . ': 执行失败!';
						}
					}
					return implode("\r\n", $remark);
				} catch (\Exception $e) {
					return '未捕获到任务状态!' . $e->getMessage();
				}
			}else{
				$msg 	= isset($data['msg']) && $data['msg'] ? $data['msg'] : '开始任务';
				return $msg;
			}
		});
		if($rs == false){
			return Responses::error('', null, 404, 404);
		}
		return true;
	}

	//视频发布日志
	public function post(Request $request){
		// {"status":1,"taskId":6}
		// {"data":[{"data":[{"commant":"#fyp","media":"http:\/\/192.168.31.231:998\/uploads\/files\/7071534611045616933.mp4","result":true}],"username":"juddlynice99865"}],"status":10,"taskId":6}
		$rs 	= TaskLog::setTodb($request, function($data){
			if(isset($data['data'])){
				try {
					$remark 	= [];
					foreach($data['data'] as $item){
						$sendNum 	= 0;
						$errNum 	= 0;
						foreach($item['data'] as $btem){
							if($btem['result']){
								$sendNum++;
								Storage::disk('admin')->delete(str_replace(env('APP_URL').'/uploads', '', $btem['media']));
							}else{
								$errNum++;
							}
						}
						$remark[] 	= $item['username'] . ' 发送成功: ' . $sendNum . ', 发送失败: ' . $errNum;
					}
					return implode("\r\n", $remark);
				} catch (\Exception $e) {
					return '获取数据失败!' . $e->getMessage();
				}
			}else{
				$msg 	= isset($data['msg']) && $data['msg'] ? $data['msg'] : '开始任务';
				return $msg;
			}
		});
		if($rs == false){
			return Responses::error('', null, 404, 404);
		}
		return true;
	}
}
