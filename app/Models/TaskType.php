<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TaskType extends Model{
    use HasFactory;

    public static function getLists(){
    	return self::orderByDesc('orderby')->pluck('title', 'id');
    }
}
