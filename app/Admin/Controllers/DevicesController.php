<?php

namespace App\Admin\Controllers;

use App\Models\Device;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class DevicesController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Device';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $states = [
            'on'  => ['value' => 1, 'text' => '锁定', 'color' => 'primary'],
            'off' => ['value' => 0, 'text' => '关闭', 'color' => 'default'],
        ];
        $grid = new Grid(new Device());

        $grid->column('id', __('Id'));
        // $grid->column('uid', __('Uid'));
        $grid->column('imei', __('Imei'));
        // $grid->column('info', __('Info'));
        $grid->column('remark', __('备注'))->editable();
        // $grid->column('number', __('编号'));
        $grid->column('user_num', __('编号'))->display(function($nnm){
            return $nnm ? $nnm : $this->number;
        })->editable();
        // $grid->column('history_uid', __('History uid'));
        $grid->column('lock', __('是否锁定'))->switch($states);
        $grid->column('created_at', __('首次连接'))->display(function($str){
            return date('Y-m-d H:i:s', strtotime($str));
        });
        // $grid->column('updated_at', __('Updated at'));

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
        $show = new Show(Device::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('uid', __('Uid'));
        $show->field('imei', __('Imei'));
        $show->field('info', __('Info'));
        $show->field('remark', __('Remark'));
        $show->field('number', __('Number'));
        $show->field('user_num', __('User num'));
        $show->field('history_uid', __('History uid'));
        $show->field('lock', __('Lock'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Device());

        $form->number('uid', __('Uid'));
        $form->text('imei', __('Imei'));
        $form->textarea('info', __('Info'));
        $form->text('remark', __('Remark'));
        $form->number('number', __('Number'));
        $form->number('user_num', __('User num'));
        $form->textarea('history_uid', __('History uid'));
        $form->switch('lock', __('Lock'));

        return $form;
    }
}
