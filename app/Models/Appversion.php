<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Appversion extends Model
{
    use HasFactory;
    public $timestamps = false;
    public static $bool 	= [0 => '否', 1 => '是'];
}
