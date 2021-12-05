<?php

namespace App\Admin\Controllers;

use App\Models\Device;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use App\Models\Account;
use Encore\Admin\Widgets\Table;
use Encore\Admin\Facades\Admin;
use App\Globals\WbApi;

class DevicesController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '接入手机';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid(){
        $states = [
            'on'  => ['value' => 1, 'text' => '锁定', 'color' => 'primary'],
            'off' => ['value' => 0, 'text' => '关闭', 'color' => 'default'],
        ];

        $uid        = Admin::user()->id;
        $rs         = WbApi::Send($uid, '', '', 'status');
        $rs         = json_decode($rs, true);
        $rs         = $rs['dids'] ?? null;
        $dids       = [];
        if($rs){
            $dids   = explode(',', $rs);
            Device::where('uid', $uid)->update(['status' => 0]);
            Device::where('uid', $uid)->whereIn('id', $dids)->update(['status' => 1]);
        }else{
            Device::where('uid', $uid)->update(['status' => 0]);
        }

        $grid = new Grid(new Device());
        $grid->disableCreateButton();
        $grid->disableExport();
        $grid->model()->where('uid', $uid)->orderByDesc('user_num')->orderByDesc('number');

        $grid->column('id', __('Id'))->hide();
        // $grid->column('uid', __('Uid'));
        // $grid->column('imei', __('Imei'));
        // $grid->column('info', __('Info'));
        // $grid->column('number', __('编号'));
        $grid->column('user_num', __('编号'))->display(function($nnm){
            return $nnm ? $nnm : $this->number;
        })->editable();

        $grid->column('accounts', __('账号数'))->modal('该设备下登录的账号', function ($model) {
            $comments = $model->account()->take(10)->get()->map(function ($comment) {
                return $comment->only(['id', 'nickname', 'uuid', 'follower_count', 'total_favorited', 'aweme_count']);
            });

            return new Table(['ID', '用户名', '账号', '粉丝数', '获赞数', '作品数'], $comments->toArray());
        })->sortable();
        $grid->column('remark', __('备注'))->editable()->filter();
        $grid->column('brand', __('品牌'))->display(function(){
            if($this->info){
                $info   = json_decode($this->info, true);
                return $info['brand'] ?? null;
            }
            return '';
        });
        $grid->column('model', __('型号'))->display(function(){
            if($this->info){
                $info   = json_decode($this->info, true);
                return $info['model'] ?? null;
            }
            return '';
        });
        $grid->column('system', __('系统版本'))->display(function(){
            if($this->info){
                $info   = json_decode($this->info, true);
                return $info['system'] ?? null;
            }
            return '';
        });
        $grid->column('jiaoben', __('脚本版本'))->display(function(){
            if($this->info){
                $info   = json_decode($this->info, true);
                if(isset($info['appversion']) && $info['appversion']){
                    return 'v' . $info['appversion'];
                }
                return 'v1.0.0';
            }
            return '';
        });
        $grid->column('lang', __('手机语言'))->display(function(){
            if($this->info){
                $info   = json_decode($this->info, true);
                return $info['language'] ?? null;
            }
            return '';
        });
        $grid->column('rado', __('屏幕'))->display(function(){
            if($this->info){
                $info   = json_decode($this->info, true);
                $w      = $info['screenWidth'] ?? 0;
                $h      = $info['screenHeight'] ?? 0;
                return $w . '* ' . $h;
            }
            return '';
        });
        // $grid->column('history_uid', __('History uid'));
        $grid->column('lock', __('是否锁定'))->switch($states)->sortable();
        $grid->column('created_at', __('首次连接'))->display(function($str){
            return date('Y-m-d H:i:s', strtotime($str));
        })->sortable();
        $grid->column('status', __('设备状态'))->display(function($status){
            if($status == 1){
                return '<span class="label label-success">在线</span>';
            }else{
                return '<span class="label label-default">离线</span>';
            }
        })->sortable();
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
