<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tkbtns extends Model
{
	public $timestamps = false;
    use HasFactory;
    public static $types    = ['1' => 'ID', '2' => 'VIEM', 3 => '弹窗关闭按钮'];
}
