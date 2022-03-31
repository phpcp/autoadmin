<?php

namespace App\Admin\Controllers;

use App\Models\TaskLog;
use App\Models\TaskType;
use App\Models\Device;
use App\Models\Task;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Facades\Admin;

class TasklogController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'TaskLog';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $labels = [
            -2 => 'danger',
            -1 => 'danger',
            0 => 'default',
            1 => 'info',
            2 => 'primary',
            3 => 'warning',
            10 => 'success',
        ];
        $uid  = Admin::user()->id;
        $grid = new Grid(new Tasklog());
        $grid->model()->where('admin_id', $uid)->orderByDesc('id');
        $taskTypes  = TaskType::pluck('title', 'id')->toArray();
        $devices    = Device::where('admin_id', $uid)->pluck('user_num', 'id')->toArray();

        $grid->column('id', __('Id'))->hide();
        $grid->column('task_id', __('Task id'))->hide();
        $grid->column('task_type', __('任务类型'))->display(function($val) use($taskTypes){
            return $taskTypes[$val] ?? '未知任务';
        })->filter($taskTypes);
        $grid->column('task_title', __('任务名称'))->filter();
        $grid->column('task_qty', __('权重'))->sortable();
        $grid->column('did', __('手机'))->display(function($val) use($devices){
            return $devices[$val] ?? '未知';
        })->filter($devices);
        $grid->column('remark', __('结果/上报数据'))->modal('上报数据', function ($model) {
            $input = $model->origin;
            $input = json_decode($input, true);
            if (empty($input)) {
                return '<code>{}</code>';
            } 
            return '<pre>'.json_encode($input, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT | JSON_HEX_TAG).'</pre>';
        });
        $grid->column('status', __('状态'))->using(Task::$status)->label($labels)->filter(Task::$status);
        $grid->column('addtime', __('时间'))->display(function($val){
            return $val ? date('Y-m-d H:i:s', $val) : '';
        })->sortable();

        $grid->disableActions();
        $grid->disableColumnSelector();
        $grid->disableFilter();
        $grid->disableRowSelector();
        $grid->disableCreateButton();
        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        // $show = new Show(Tasklog::findOrFail($id));

        // $show->field('id', __('Id'));
        // $show->field('task_id', __('Task id'));
        // $show->field('task_type', __('Task type'));
        // $show->field('task_title', __('Task title'));
        // $show->field('task_qty', __('Task qty'));
        // $show->field('admin_id', __('Admin id'));
        // $show->field('did', __('Did'));
        // $show->field('status', __('Status'));
        // $show->field('remark', __('Remark'));
        // $show->field('addtime', __('Addtime'));

        // return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        // $form = new Form(new Tasklog());

        // $form->number('task_id', __('Task id'));
        // $form->number('task_type', __('Task type'));
        // $form->text('task_title', __('Task title'));
        // $form->number('task_qty', __('Task qty'));
        // $form->number('admin_id', __('Admin id'));
        // $form->number('did', __('Did'));
        // $form->number('status', __('Status'))->default(1);
        // $form->textarea('remark', __('Remark'));
        // $form->number('addtime', __('Addtime'));

        // return $form;
    }
}
