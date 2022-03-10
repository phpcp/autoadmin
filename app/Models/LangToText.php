<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LangToText extends Model
{
	public $timestamps = false;
    use HasFactory;
    public static $types    = [0 => '脚本', 1 => '弹窗'];
}
