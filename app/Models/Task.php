<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Task extends Model{
    use HasFactory;
    public static $zhouqi = [
    	1 	=> '小时',
    	2	=> '天',
    ];
    public static $status     = [
		-2  => '未完成',
		-1  => '失败',
		0   => '待执行',
		1   => '执行中',
		2   => '挂起待执行',
		3   => '已发送',
		10  => '成功',
	];
	protected $casts = [
        'configs' 	=> 'json',
        'frequency'	=> 'json',
    ];

	// 设备字段
	public function getDeviceIdAttribute($val){
		return explode(',', $val);
	}
	public function setDeviceIdAttribute($val){
		if(is_array($val)){
			$val 	= implode(',', $val);
		}
		$this->attributes['device_id'] 	= $val;
	}

	// 账号字段
	public function getAccountIdAttribute($val){
		return explode(',', $val);
	}
	public function setAccountIdAttribute($val){
		if(is_array($val)){
			$val 	= implode(',', $val);
		}
		$this->attributes['account_id'] 	= $val;
	}

	// 设备组字段
	public function getDgAttribute($val){
		return explode(',', $val);
	}
	public function setDgAttribute($val){
		if(is_array($val)){
			$val 	= implode(',', $val);
		}
		$this->attributes['dg'] 	= $val;
	}

	// 账号组字段
	public function getAgAttribute($val){
		return explode(',', $val);
	}
	public function setAgAttribute($val){
		if(is_array($val)){
			$val 	= implode(',', $val);
		}
		$this->attributes['ag'] 	= $val;
	}

	// 开始时间格式化
	public function getStarttimeAttribute($val){
		return $val ? date('Y-m-d', $val) : null;
	}
	public function setStarttimeAttribute($val){
		if($val){
			$this->attributes['starttime'] 	= strtotime($val);
		}
	}

	// 结束时间格式化
	public function getEndtimeAttribute($val){
		return $val ? date('Y-m-d', $val) : null;
	}
	public function setEndtimeAttribute($val){
		if($val){
			$this->attributes['endtime'] 	= strtotime($val);
		}
	}

	// 配置参数格式化
	public function getConfigsAttribute($val){
		$arr 	=  $val ? json_decode($val, true) : null;
		if(isset($arr) && isset($arr[0]['url'])){
			foreach($arr as &$item){
				$item['media']	= $item['url'];
			}
		}
		return $arr;
	}
	public function setConfigsAttribute($val){
		$this->attributes['configs'] 	= json_encode($val);
	}

	// 视频
	public function getMediasAttribute($val){
		// $arr 	=  $val ? json_decode($val, true) : null;
		// if(isset($arr) && isset($arr[0]['url'])){
		// 	foreach($arr as &$item){
		// 		$item['media']	= $item['url'];
		// 	}
		// }
		// return $arr;
		return json_decode($val, true);
	}
	public function setMediasAttribute($val){
		if (is_array($val)) {
			$this->attributes['medias'] = json_encode($val);
		}
	}

	public function getTimeFrameAttribute($value)
    {
        return array_values(json_decode($value, true) ?: []);
    }

    public function setTimeFrameAttribute($value)
    {
        $this->attributes['time_frame'] = json_encode(array_values($value));
    }
}
