<?php

namespace App\Admin\Controllers;

use App\Models\Tasklog;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

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
        $grid = new Grid(new Tasklog());

        $grid->column('id', __('Id'));
        $grid->column('task_id', __('Task id'));
        $grid->column('task_type', __('Task type'));
        $grid->column('task_title', __('Task title'));
        $grid->column('task_qty', __('Task qty'));
        $grid->column('admin_id', __('Admin id'));
        $grid->column('did', __('Did'));
        $grid->column('status', __('Status'));
        $grid->column('remark', __('Remark'));
        $grid->column('addtime', __('Addtime'));

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
        $show = new Show(Tasklog::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('task_id', __('Task id'));
        $show->field('task_type', __('Task type'));
        $show->field('task_title', __('Task title'));
        $show->field('task_qty', __('Task qty'));
        $show->field('admin_id', __('Admin id'));
        $show->field('did', __('Did'));
        $show->field('status', __('Status'));
        $show->field('remark', __('Remark'));
        $show->field('addtime', __('Addtime'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Tasklog());

        $form->number('task_id', __('Task id'));
        $form->number('task_type', __('Task type'));
        $form->text('task_title', __('Task title'));
        $form->number('task_qty', __('Task qty'));
        $form->number('admin_id', __('Admin id'));
        $form->number('did', __('Did'));
        $form->number('status', __('Status'))->default(1);
        $form->textarea('remark', __('Remark'));
        $form->number('addtime', __('Addtime'));

        return $form;
    }
}
