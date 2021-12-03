<?php

namespace App\Admin\Controllers;

use App\Models\Account;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Facades\Admin;

class AccountsController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Account';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $uid  = Admin::user()->id;
        $grid = new Grid(new Account());
        $grid->disableCreateButton();
        $grid->disableExport();
        $grid->model()->where('uid', $uid);

        $grid->column('id', __('Id'))->hide();
        $grid->column('did', __('登录手机'));
        $grid->column('uuid', __('账号ID'));
        $grid->column('avatar', __('头像'))->image();
        $grid->column('username', __('账号昵称'));
        $grid->column('fensi', __('粉丝数'));
        $grid->column('zuopin', __('发布作品'));
        $grid->column('dianzan', __('点赞数'));
        $grid->column('guanzhu', __('关注数'));
        // $grid->column('updated_at', __('Updated at'));
        // $grid->column('created_at', __('Created at'));

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
        $show = new Show(Account::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('did', __('Did'));
        $show->field('uuid', __('Uuid'));
        $show->field('avatar', __('Avatar'));
        $show->field('username', __('Username'));
        $show->field('fensi', __('Fensi'));
        $show->field('zuopin', __('Zuopin'));
        $show->field('dianzan', __('Dianzan'));
        $show->field('guanzhu', __('Guanzhu'));
        $show->field('updated_at', __('Updated at'));
        $show->field('created_at', __('Created at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Account());

        $form->number('did', __('Did'));
        $form->text('uuid', __('Uuid'));
        $form->image('avatar', __('Avatar'));
        $form->text('username', __('Username'));
        $form->number('fensi', __('Fensi'));
        $form->number('zuopin', __('Zuopin'));
        $form->number('dianzan', __('Dianzan'));
        $form->number('guanzhu', __('Guanzhu'));

        return $form;
    }
}
