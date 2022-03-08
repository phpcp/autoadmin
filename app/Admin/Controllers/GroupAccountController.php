<?php

namespace App\Admin\Controllers;

use App\Models\Gpac as GroupAccount;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Facades\Admin;
use Illuminate\Support\Facades\DB;

class GroupAccountController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '账号分组管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new GroupAccount());
        $grid->model()->where('admin_id', Admin::user()->id);

        $grid->column('id', __('Id'))->hide();
        // $grid->column('admin_id', __('Admin id'));
        $grid->column('name', __('组名'))->editable()->filter();
        $grid->column('accounts', __('账号数'))->sortable();
        $grid->column('orderby', __('排序'))->editable()->sortable();

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
        $show = new Show(GroupAccount::findOrFail($id));

        $show->field('id', __('Id'));
        // $show->field('admin_id', __('Admin id'));
        $show->field('name', __('Name'));
        $show->field('accounts', __('Accounts'));
        $show->field('orderby', __('Orderby'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new GroupAccount());

        // $form->number('admin_id', __('Admin id'));
        $form->text('name', __('Name'));
        // $form->number('accounts', __('Accounts'))->hide();
        $form->number('orderby', __('Orderby'));
        $form->saving(function (Form $form) {
            $form->model()->admin_id    = Admin::user()->id;
        });

        return $form;
    }
}
