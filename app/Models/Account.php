<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Account extends Model{
    use HasFactory;

	// 分组字段
	public function getGroupsAttribute($val){
		return explode(',', $val);
	}
	public function setGroupsAttribute($val){
		if(is_array($val)){
			$val 	= implode(',', $val);
		}
		$this->attributes['groups'] 	= $val;
	}
}
