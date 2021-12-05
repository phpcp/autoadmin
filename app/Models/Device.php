<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use App\Models\User;

class Device extends Model{
	use HasFactory;

	public function account(){
		return $this->hasMany(Account::class, 'did');
	}

	// 获取设备
	public static function bind(string $imei, User $user, $info = null){
		$device 	= self::where('imei', $imei)->first();

		if($device){
			if($user->id != $device->uid){
				return '请先后台解绑!';
			}
			if(is_array($info)){
				$info 		= json_encode($info);
			}
			$device->info 	= $info;
			$device->save();
			return $device;
		}else{
			$binded 	= self::where('uid', $user->id)->count();
			if($binded >= $user->max_device){
				return '设备绑定已达上限!';
			}
			$device 		= new self;
			$device->uid 	= $user->id;
			$device->imei 	= $imei;
			$device->number = $binded + 1;
			$device->user_num = $device->number;
			if(is_array($info)){
				$info 		= json_encode($info);
			}
			$device->info 	= $info;
			if(!$device->save()){
				return '设备绑定失败!';
			}
		}
		return $device;
	}
}
