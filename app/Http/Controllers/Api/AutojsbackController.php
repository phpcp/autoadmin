<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\TaskLog;
use App\Models\Task;
use App\Globals\Responses;
use App\Models\Device;
use App\Models\Account;
use Illuminate\Support\Facades\Storage;

class AutojsbackController extends Controller{
	// 获取账号信息回调
	public function accounts(Request $request){
		$rs 	= TaskLog::setTodb($request, function($data, $adminid, $did){
			if(isset($data['data'])){
				$resuData 	= $data['data'];
				try {
					$remark 	= [];
					foreach($resuData as $item){
			            if(!isset($item['uid'])){
			                continue;
			            }
			            $uid    = $item['uid'];
			            $row    = Account::where('admin_id', $adminid)->where('uid', $uid)->first();
			            if(!$row){
			                $row                = new Account;
			                $row->admin_id      = $adminid;
			                $row->did           = $did;
			                $row->uid           = $uid;
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
			            $remark[] 				= $item['unique_id'];
			        }
			        Device::where('id', $did)->where('admin_id', $adminid)->update(['accounts' => Account::where('did', $did)->where('admin_id', $adminid)->count()]);
					return '账号信息: ' . implode(", ", $remark);
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
	// 养号回调
	public function raise(Request $request){
		//{"type":"raise","code":200,"msg":null,"data":{"status":1,"taskId":5},"noreback":true,"uid":2,"did":54}
		//{"type":"raise","code":200,"msg":"\u6210\u529f\uff01","data":{"data":[{"commentProNum":0,"dianzanNum":0,"realSeetimeNum":43,"result":true,"seetimeNum":43,"username":"zhutoushini666","videoNum":7}],"status":10,"taskId":5},"noreback":true,"uid":2,"did":54}
		$rs 	= TaskLog::setTodb($request, function($data, $adminid, $did){
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
		$rs 	= TaskLog::setTodb($request, function($data, $adminid, $did){
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

	// 关注回调
	public function follow(Request $request){
		// {"code":200,"msg":"成功！","data":[{"username":"domefish0","result":true,"msg":"操作成功！","dataCount":[{"type":"1","typeNum":1,"real":1,"realList":[{"userId":"SEXY","userName":"sexyladyb107","Following":"9802","Followers":"1741","Likes":"3904"}]},{"type":"2","typeNum":1,"real":1,"realList":[{"userId":"vanessamunley","userName":"vanessamunley0","Following":"1004","Followers":"538.2K","Likes":"3.8M"}]},{"type":"3","typeNum":1,"real":1,"realList":[{"userId":"dayami:)","userName":"dayami.lopez","Following":"269","Followers":"28.7K","Likes":"848.5K"}]},{"type":"4","typeNum":1,"real":1,"realList":[{"userId":"Jon Harris","userName":"cowphobia86","Following":"70","Followers":"6.3M","Likes":"113.5M"}]},{"type":"5","typeNum":3,"real":3,"realList":[{"userId":"William White","userName":"whiteyy18","Following":"793","Followers":"1.9M","Likes":"29.5M"},{"userId":"Fikir get","userName":"fifi_aklil","Following":"2021","Followers":"107.4K","Likes":"347.7K"},{"userId":"wilderluke","userName":"wilderluke_teamwilder","Following":"360","Followers":"43.9K","Likes":"182.1K"}]}]}]}
		// file_put_contents(__DIR__ . '/1.txt', json_encode($request->all()));
		
		$rs 	= TaskLog::setTodb($request, function($data, $adminid, $did){
			if(isset($data['data'])){
				try {
					$remark 	= [];
					$fmt 		= ': 预计关注量(%d), 实际关注数量(%d)';
					foreach($data['data'] as $item){
						if($item['result']){
							$dataCount = $item['dataCount'];
							$typeNum = 0;
							$real = 0;
							foreach ($dataCount as $key => $value) {
								$typeNum = bcadd($typeNum,$value['typeNum'],0);
								$real = bcadd($real,$value['real'],0);
							}
							$str 		= sprintf($fmt, $typeNum, $real);
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
}
