<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AccountVideo extends Model{
    use HasFactory;

    public function getSendTimeAttribute($val){
		return $val ? date('Y-m-d H:i:s', $val) : null;
	}
	public function setSendTimeAttribute($val){
		if(!is_numeric($val)){
			$val 	= strtotime($val);
		}
		$this->attributes['send_time'] 	= $val ? $val : 0;
	}
}
