<?php

namespace App\Admin\Controllers;

use App\Models\Task;
use App\Models\Device;
use App\Models\Account;
use App\Models\TaskType;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Facades\Admin;
use App\Models\GroupDevice;
use App\Models\DeviceToGroup;
use App\Models\GroupAccount;
use App\Models\AccountToGroup;
use Illuminate\Support\Facades\Redis;
use Illuminate\Support\MessageBag;

class TaskListsController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '任务清单';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $states = [
            'on'  => ['value' => 1, 'text' => '监听', 'color' => 'primary'],
            'off' => ['value' => 0, 'text' => '失效', 'color' => 'default'],
        ];
        $labels = [
            -2 => 'danger',
            -1 => 'danger',
            0 => 'default',
            1 => 'info',
            2 => 'primary',
            3 => 'warning',
            10 => 'success',
        ];
        
        $grid = new Grid(new Task());
        $adminId    = Admin::user()->id;
        $grid->model()->where('admin_id', $adminId);
        $devices    = Device::myDevices($adminId);
        $accounts   = Account::where('admin_id', $adminId)->pluck('nickname', 'id')->toArray();

        $task_types     = TaskType::getLists()->toArray();

        $grid->column('id', __('Id'))->hide();
        // $grid->column('admin_id', __('Admin id'));
        $grid->column('task_id', __('任务类型'))->using($task_types)->filter($task_types);
        $grid->column('name', __('任务名称'))->filter()->editable()->copyable();
        $grid->column('device_id', __('设备号'))->checkbox($devices)->filter($devices);
        $grid->column('account_id', __('账号'))->checkbox($accounts)->filter($accounts);
        $grid->column('quality', __('权重'))->sortable()->editable();
        $grid->column('starttime', __('开始时间'))->sortable();
        $grid->column('endtime', __('结束时间'))->sortable();
        $grid->column('configs', __('配置'))->hide();
        $grid->column('errmsg', __('错误信息'))->hide();
        $grid->column('status', __('任务状态'))->using(Task::$status)->label($labels);
        $grid->column('active', __('是否有效'))->switch($states);
        $grid->column('created_at', __('创建时间'))->display(function($val){
            return date('Y-m-d H:i:s', strtotime($val));
        });
        $grid->column('updated_at', __('更新时间'))->display(function($val){
            return date('Y-m-d H:i:s', strtotime($val));
        })->hide();

        $grid->disableExport();
        // $grid->disableActions();
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
        $show = new Show(Task::findOrFail($id));

        $show->field('id', __('Id'));
        // $show->field('admin_id', __('Admin id'));
        $show->field('name', __('Name'));
        $show->field('device_id', __('Device id'));
        $show->field('account_id', __('Account id'));
        $show->field('quality', __('Quality'));
        $show->field('starttime', __('Starttime'));
        $show->field('endtime', __('Endtime'));
        $show->field('configs', __('Configs'));
        $show->field('errmsg', __('Errmsg'));
        $show->field('status', __('Status'));
        $show->field('active', __('Active'));
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
        $form = new Form(new Task());
        $adminId    = Admin::user()->id;
        $form->model()->where('admin_id', $adminId);

        $devices            = Device::myDevices($adminId);
        $deviceGroupsObj    = GroupDevice::where('admin_id', $adminId)->orderByDesc('orderby')->get();
        $deviceGroups       = [];
        foreach ($deviceGroupsObj as $value) {
            $deviceGroups[$value->id]   = $value->name . '(' . $value->devices . ')';
        }

        $accounts           = Account::where('admin_id', $adminId)->pluck('nickname', 'id');
        $accountGroupsObj   = GroupAccount::where('admin_id', $adminId)->orderByDesc('orderby')->get();
        $accountGroups      = [];
        foreach ($accountGroupsObj as $value) {
            $accountGroups[$value->id]   = $value->name . '(' . $value->accounts . ')';
        }
        $taskTypes          = TaskType::getLists()->toArray();//TaskType::pluck('title', 'id');

        $form->column(1/3, function ($form) use($deviceGroups, $devices, $accountGroups, $accounts) {
            $form->divider('任务基本配置');
            $states = [
                'on'  => ['value' => 1, 'text' => '监听', 'color' => 'primary'],
                'off' => ['value' => 0, 'text' => '失效', 'color' => 'default'],
            ];
            $form->text('name', __('任务名称'))->required()->rules('max:30');
            $form->number('quality', __('任务权重'))->default(0)->help('数值越大,优先级越高!');
            
            $form->hidden('status', __('任务进度'));
            $form->switch('active', __('任务状态'))->states($states)->default(1);
            $form->divider('发布目标选择,系统将自动去重');
            $form->multipleSelect('dg', __('设备组'))->options($deviceGroups);
            $form->multipleSelect('device_id', __('手机设备'))->options($devices);
            $form->multipleSelect('ag', __('账号组'))->options($accountGroups);
            $form->multipleSelect('account_id', __('账号列表'))->options($accounts);
        });
        $form->column(1/3, function ($form) use($taskTypes) {
            $form->divider('任务类型和参数配置');
            $form->select('task_id', __('任务类型'))->options($taskTypes)
                ->required()
                ->when(1, function(Form $form){
                    $form->embeds('configs', '', function ($form) {
                        $form->html('');
                        $form->html('');
                        $form->html('<b style="color:red;">获取账号信息,执行时间和频率将失效</span>');
                        $form->html('');
                        $form->html('');
                        $form->html('');
                        $form->html('');
                        $form->html('⬅⬅⬅⬅请在左侧选择设备, 账号无需选择, 选了无效!');
                    });
                })
                ->when(2, function(Form $form){
                    $form->embeds('configs', '', function ($form) {
                        $form->number('videos', '观看数量')->default(10)->help('视频数量会在设置值和设置值-10之间做随机!');
                        $form->number('seetime', '观看时长')->default(10)->help('根据设置做随机,逻辑同观看数量,单位为 秒!');
                        $form->rate('dianzan', '点赞概率')->default(10);
                        $form->rate('comment_pro', '评论概率')->default(10);
                    });
                })->when(3, function(Form $form){
                    $form->embeds('configs', '', function ($form) {
                        $states = [
                            'on'  => ['value' => 1, 'text' => '日常', 'color' => 'success'],
                            'off' => ['value' => 0, 'text' => '正常', 'color' => 'info'],
                        ];
                        $form->textarea('content', '发布内容')->help('一行一条');
                        $form->text('address', '发布位置')->help('抖音的发布位置');
                        $form->switch('richang', '发布日常')->states($states);
                        $form->multipleFile('medias', __('视频文件'))->removable()->downloadable();
                    });
                })->when(4, function(Form $form){ //关注用户
                    $form->embeds('configs', '', function ($form) {
                        $keyType    = [
                            1   => '用户',
                            2   => '视频',
                            3   => '音乐',
                            4   => 'Tag',
                        ];
                        $form->number('max', __('关注数量'));
                        $form->text('key', __('关键词'))->help('搜索关键词,留空则关注自己粉丝!');
                        $form->select('type', '搜索类型')->options($keyType)
                        ->when(1, function(Form $form){
                            $form->embeds('configs', '', function ($form) {
                                $form->number('fans', '粉丝量');
                                $form->number('videos', '视频数');
                            });
                        })->when(2, function(Form $form){
                            $form->embeds('configs', '', function ($form) {
                                $form->number('zan', '点赞量');
                            });
                        });
                    });
                });
        });
        $form->column(1/3, function ($form) use($taskTypes) {
            $form->divider('执行时间和频率选择');
            $form->dateRange('starttime', 'endtime', __('任务时间'))->required()->help('未选开始时间任务立刻开始,未选结束时间长期有效!');
            $form->select('units', __('执行频率'))->options(Task::$zhouqi)
                ->when(1, function(Form $form){
                    $form->embeds('frequency', '', function ($form) {
                        $form->number('hours', '频率')->help('多少小时执行一次!');
                    });
                })->when(2, function(Form $form){
                    $form->embeds('frequency', '', function ($form) {
                        $form->number('daily', '频率')->help('多少天执行一次!')->default(1);
                        $form->timeRange('start', 'end', '执行时间')->help('执行时间段!');
                    });
                })->help('注意:频率太低有可能导致任务执行失败!');
        });

        $form->saving(function(Form $form){
            if(!$form->task_id){
                $error = new MessageBag([
                    'title'   => '错误',
                    'message' => '请选择任务类型!',
                ]);
                return back()->with($error);
            }
            if(!$form->name){
                $error = new MessageBag([
                    'title'   => '错误',
                    'message' => '请填写任务名称!',
                ]);
                return back()->with($error);
            }

            $form->model()->admin_id    = Admin::user()->id;
            $accounts        = [];
            if(isset($form->dg)){
                $dg             = array_filter($form->dg);
                $devices        = [];
                if(!empty($dg)){
                    $devices    = DeviceToGroup::whereIn('gid', $dg)->pluck('id')->toArray();
                }
                $devices            = array_merge($devices, array_filter($form->device_id));
                $devices            = array_unique($devices);
                $form->device_id    = $devices;
                if($form->task_id != 1){
                    $accounts       = Account::whereIn('did', $devices)->where('status', 1)->pluck('id')->toArray();
                }
            }

            if(isset($form->ag)){
                if($form->task_id == 1){
                    $form->account_id   = [];
                }else{
                    $ag             = array_filter($form->ag);
                    if(!empty($ag)){
                        $accounts   = array_merge($accounts, AccountToGroup::whereIn('gid', $ag)->pluck('id')->toArray());
                        // dd($accounts);
                        // $account    = AccountToGroup::whereIn('gid', $ag)->pluck('id')->toArray();
                    }
                    $accounts           = array_filter(array_merge($accounts, $form->account_id));
                    $accounts           = array_unique($accounts);
                    $form->account_id   = $accounts;
                }
            }
        });
        // redis 以任务id为记录
        $form->saved(function (Form $form) {
            $id             = (int)$form->model()->id;
            $startTime      = $form->starttime;//2021-12-17
            $endTime        = $form->endtime;
            $task_id        = (int)$form->task_id;
            $quality        = (int)$form->quality;
            $name           = $form->name;
            $configs        = $form->configs;
            $frequency      = $form->frequency;
            $units          = $form->units;
            $timeout        = -1;

            $tskType        = TaskType::find($task_id);
            
            if($endTime){
                $endTime    = strtotime($endTime)+86399;
                $tmp        = $endTime - time();
                if($tmp <= 0){
                    return false;
                }else{
                    $timeout    = $tmp;
                }
            }
            if($startTime){
                $startTime  = strtotime($startTime);
                if($endTime && $startTime >= $endTime){
                    // dd('2222');
                    return false;
                }
            }
            if(!$units){
                $frequency  = null;
            }

            $devices        = $form->model()->device_id;
            $devices        = array_filter(array_map('intval', $devices));
            $accounts       = [];
            if($tskType->isdevice != 1){
                if($form->model()->account_id){
                    $tmp        = Account::whereIn('id', $form->model()->account_id)->get();
                    foreach($tmp as $item){
                        if(!isset($accounts[$item->did])){
                            $accounts[$item->did]   = [];
                        }
                        $accounts[$item->did][]     = $item->nickname;
                    }
                    // $accounts   = Account::whereIn('id', $form->model()->account_id)->pluck('nickname', 'did')->toArray();
                }
            }

            $arr            = [
                'id'            => $id,
                'admin'         => (int)Admin::user()->id,
                'devices'       => $devices ? $devices : [],
                'accounts'      => $accounts ? $accounts : null,
                'starttime'     => (int)$startTime,
                'endtime'       => (int)$endTime,
                'file'          => $tskType->file,
                'only_device'   => $tskType->isdevice ? true : false,
                'quality'       => $quality,
                'name'          => $name,
                'configs'       => $configs,
                'units'         => (int)$units,
                'frequency'     => $frequency,
                'last'          => null,
            ];
            $key            = '-task_' . $id . '_' . Admin::user()->id;

            Redis::setex($key, $timeout, json_encode($arr));
            dd($arr);
        });
        // $form->confirm('提交后无法修改,确定吗?');
        return $form;
    }
}


