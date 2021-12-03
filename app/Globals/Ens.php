<?php

namespace App\Globals;

class Ens{
    public static $versionKeys = [
        100   => [
            'key'   => '654mca0l38b489d9f306a5b8e105334b',
            'iv'    => 'c5defg0045222c52',
        ],
    ];
    private static $method      = 'AES-128-CBC';
    private static $padding     = OPENSSL_RAW_DATA;
    public static $timeout     = 300;// 5分钟有效

    /**
     * aes 加密
     */
    public static function encrypt($word, $tp = false, $versioncode = 100){
        if(!isset(self::$versionKeys[$versioncode])){
            return false;
        }
        if(!is_string($word)){
            $word   = json_encode($word);
        }
        $key        = self::$versionKeys[$versioncode]['key'];
        $iv         = self::$versionKeys[$versioncode]['iv'];

        $res        = openssl_encrypt($word, self::$method, $key, self::$padding, $iv);
        if(!$tp){
            $res        = bin2hex($res);
        }else{
            $res        = base64_encode($res);
        }
        return $res;
    }

    /**
     * aes 解密
     */
    public static function decrypt($token, $tp = false, $versioncode = 100){
        if(!isset(self::$versionKeys[$versioncode])){
            return false;
        }

        if(!$tp){
            $token      = hex2bin($token);
        }else{
            $token      = base64_decode($token);
        }

        $key        = self::$versionKeys[$versioncode]['key'];
        $iv         = self::$versionKeys[$versioncode]['iv'];
        return openssl_decrypt($token, self::$method, $key, self::$padding, $iv);
    }
}
