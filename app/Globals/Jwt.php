<?php
namespace App\Globals;

use Lcobucci\JWT\Configuration;
use Lcobucci\JWT\Signer\Hmac\Sha256;
use Lcobucci\JWT\Signer\Key\InMemory;

class Jwt{
    /**
     * 配置
     */
    private static function conf(){
        $configuration = Configuration::forSymmetricSigner(
            new Sha256(),
            // replace the value below with a key of your own!
            InMemory::base64Encoded('mBC5v1sOKVvbdEitdSBenu59nfNfhwkedkJVNabosTw=')
            // You may also override the JOSE encoder/decoder if needed by providing extra arguments here
        );
    }

    /**
     * 加密
     */
    public static function encrypt($id, $time){

    }

    /**
     * 解密
     */
    public static function decrypt($token){

    }
}
