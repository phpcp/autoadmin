<?php

namespace App\Admin\Controllers;

use App\Models\AccountVideo;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class AccountVideoController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '账号发布视频';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid(){
        $grid = new Grid(new AccountVideo());
        $account_id         = request()->get('account_id');
        if($account_id > 0){
            $grid->model()->where('account_id', $account_id);
        }

        $grid->column('id', __('ID'));
        $grid->column('account_id', __('账号'))->hide();
        $grid->column('url', __('视频'));
        $grid->column('content', __('内容'));
        $grid->column('created_at', __('添加时间'));
        $grid->column('updated_at', __('更新时间'))->hide();
        $grid->column('send_time', __('发布时间'));
        $grid->column('status', __('状态'));

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
        $show = new Show(AccountVideo::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('account_id', __('Account id'));
        $show->field('url', __('Url'));
        $show->field('content', __('Content'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('send_time', __('Send time'));
        $show->field('status', __('Status'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new AccountVideo());

        $form->number('account_id', __('Account id'));
        $form->url('url', __('Url'));
        $form->text('content', __('Content'));
        $form->number('send_time', __('Send time'));
        $form->switch('status', __('Status'));

        return $form;
    }
}
