<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Gpac extends Model{
	public $timestamps = false;
	public $table 	= 'group_accounts';
    use HasFactory;

	// 重新统计设备组下的设备数
    public static function countAccount($adminId){
    	self::where('admin_id', $adminId)->update(['accounts' => 0]);
    	$sql 	= 'update group_accounts a INNER JOIN (SELECT count(0) as sums, gid FROM account_to_groups GROUP BY gid) as b on a.id = b.gid SET a.accounts = b.sums where a.admin_id = ?';
    	DB::update($sql, [$adminId]);
    }
}
