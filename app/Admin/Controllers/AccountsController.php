<?php

namespace App\Admin\Controllers;

use App\Models\Account;
use App\Models\Device;
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
        $statusLabel = [
            0 => 'default',
            1 => 'success',
        ];
        $status     = [
            0 => '退出',
            1 => '正常',
        ];
        $uid  = Admin::user()->id;
        $grid = new Grid(new Account());
        $grid->disableCreateButton();
        $grid->disableExport();
        $grid->model()->where('aid', $uid);

        $devicesObj     = Device::where('uid', $uid)->get();
        $devices        = [];
        $deviceFilers   = [];
        foreach($devicesObj as $item){
            $devices[$item->id]                 = json_decode($item->info, true);
            $devices[$item->id]['user_num']     = $item->user_num;
            $deviceFilers[$item->id]            = '编号:' . $item->user_num . '('.($devices[$item->id]['brand'] ?? null).')';
        }
        // dd($devices);

        $grid->column('id', __('Id'))->hide();
        $grid->column('did', __('登录手机'))->display(function($id) use($devices){
            // $row    = Device::find($id);
            if(!isset($devices[$id])){
                return '账号不存在...';
            }
            return '编号: ' . ($devices[$id]['user_num']) . '<br>' . ($devices[$id]['brand'] ?? null);
        })->filter($deviceFilers);
        $grid->column('avatar', __('头像'))->image(40,40);
        $grid->column('uuid', __('账号ID'))->filter()->hide();
        $grid->column('nickname', __('账号昵称'))->filter();
        $grid->column('follower_count', __('粉丝数'))->label()->sortable();
        $grid->column('aweme_count', __('作品数'))->label()->sortable();
        $grid->column('total_favorited', __('获赞数'))->label()->sortable();
        $grid->column('favoriting_count', __('点赞数'))->label()->sortable();
        $grid->column('following_count', __('关注数'))->label()->sortable();
        $grid->column('region', __('地区'));
        $grid->column('status', __('状态'))->display(function($status){
            return $status == 1 ? '正常' : '退出';
        })->label($statusLabel)->filter($status);
        $grid->column('shareUrl', __('分享链接'))->hide();
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

        // $form->number('did', __('Did'));
        // $form->text('uuid', __('Uuid'));
        // $form->image('avatar', __('Avatar'));
        // $form->text('username', __('Username'));
        // $form->number('fensi', __('Fensi'));
        // $form->number('zuopin', __('Zuopin'));
        // $form->number('dianzan', __('Dianzan'));
        // $form->number('guanzhu', __('Guanzhu'));

        return $form;
    }
}
