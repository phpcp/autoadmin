<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\Dashboard;
use Encore\Admin\Layout\Column;
use Encore\Admin\Layout\Content;
use Encore\Admin\Layout\Row;

use Endroid\QrCode\Builder\Builder;
use Endroid\QrCode\Encoding\Encoding;
use Endroid\QrCode\ErrorCorrectionLevel\ErrorCorrectionLevelHigh;
use Endroid\QrCode\Label\Alignment\LabelAlignmentCenter;
use Endroid\QrCode\Label\Font\NotoSans;
use Endroid\QrCode\RoundBlockSizeMode\RoundBlockSizeModeMargin;
use Endroid\QrCode\Writer\PngWriter;

use App\Globals\Ens;
use Encore\Admin\Facades\Admin;

class HomeController extends Controller
{
    public function index(Content $content)
    {
        return $content
            ->title('Dashboard')
            ->description('Description...')
            ->row(Dashboard::title())
            ->row(function (Row $row) {

                $row->column(4, function (Column $column) {
                    $column->append(Dashboard::environment());
                });

                $row->column(4, function (Column $column) {
                    $column->append(Dashboard::extensions());
                });

                $row->column(4, function (Column $column) {
                    $column->append(Dashboard::dependencies());
                });
            });
    }

    public function qrcode(){
        $arr    = [
            // 'ws'    => 'ws://192.168.31.172:11223/client',
            'api'   => 'http://192.168.31.172:998/api/auth',//url('api/auth'),//
            'token' => Ens::encrypt(json_encode(['id' => Admin::user()->id, 'time' => time()])),
        ];
        print_r($arr);
        $str    = json_encode($arr);
        $data   = Ens::encrypt($str);

        $timeout    = date('H:i:s', strtotime('+'.env('QRCODE_TIMEOUT', 180).' seconds'));
        $result = Builder::create()
                    ->writer(new PngWriter())
                    ->writerOptions([])
                    ->data($data)
                    ->encoding(new Encoding('UTF-8'))
                    ->errorCorrectionLevel(new ErrorCorrectionLevelHigh())
                    ->size(300)
                    ->margin(10)
                    ->roundBlockSizeMode(new RoundBlockSizeModeMargin())
                    // ->logoPath(__DIR__.'/assets/symfony.png')
                    ->labelText('过期时间: ' . $timeout)
                    ->labelFont(new NotoSans(20))
                    ->labelAlignment(new LabelAlignmentCenter())
                    ->build();
        return '<img src="' . $result->getDataUri() . '">';
    }
}
