<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use App\Models\AdminUser;

class Device extends Model{
	use HasFactory;

	public function account(){
		return $this->hasMany(Account::class, 'did');
	}

	// 获取当前用户下的设备,并格式化
	public static function myDevices($admin_id){
		$devicesObj     = Device::where('admin_id', $admin_id)->get();
        $device         = [];
        foreach($devicesObj as $item){
            $info       = json_decode($item->info, true);
            $device[$item->id]  = '编号:' . $item->user_num . '(' . $item->accounts . ')';
        }
        return $device;
	}

	// 获取设备
	public static function bind(string $imei, AdminUser $user, $info = null){
		$device 	= self::where('imei', $imei)->first();

		if($device){
			if($user->id != $device->admin_id){
				return '请先后台解绑!';
			}
			if(is_array($info)){
				$info 		= json_encode($info);
			}
			$device->info 	= $info;
			$device->save();
			return $device;
		}else{
			$binded 	= self::where('admin_id', $user->id)->count();
			if($binded >= $user->max_device){
				return '设备绑定已达上限!';
			}
			$device 		= new self;
			$device->admin_id 	= $user->id;
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

	// 分组字段
	public function getGroupsAttribute($val){
		return explode(',', $val);
	}
	public function setGroupsAttribute($val){
		if(is_array($val)){
			$val 	= implode(',', $val);
		}
		$this->attributes['groups'] 	= $val ? $val : null;
	}
}
