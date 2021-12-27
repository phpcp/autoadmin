<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class GroupDevice extends Model{
	public $timestamps = false;
    use HasFactory;

    // 重新统计设备组下的设备数
    public static function countDevice($adminId){
    	self::where('admin_id', $adminId)->update(['devices' => 0]);
    	$sql 	= 'update group_devices a INNER JOIN (SELECT count(0) as sums, gid FROM device_to_groups GROUP BY gid) as b on a.id = b.gid SET a.devices = b.sums where a.admin_id = ?';
    	DB::update($sql, [$adminId]);
    }
}
