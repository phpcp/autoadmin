<?php

namespace App\Admin\Actions\Task;

use Encore\Admin\Actions\RowAction;
use Illuminate\Database\Eloquent\Model;

class Period extends RowAction
{
    public $name = '周期设置';

    public function handle(Model $model){
        return $this->response()->success('周期性设置还在开发中')->refresh();
    }

    public function form(){
	    $type = [
	        1 => '广告',
	        2 => '违法',
	        3 => '钓鱼',
	    ];

	    $this->checkbox('type', '类型')->options($type);
	    $this->textarea('reason', '原因')->rules('required');
	}

}