<?php
namespace app\core;
class Aes
{
    public $key = 'I8jOFVZSzEediYzQ';

    public $iv = 'uycLyKE2hsLfB8Fg';

    //加密
    public function aes_encode($data)
    {
        return base64_encode(openssl_encrypt($data, "AES-128-CBC", $this->key, 1, $this->iv));
    }

    //解密
    public function aes_decode($data)
    {
        return openssl_decrypt(base64_decode($data), "AES-128-CBC", $this->key, 1, $this->iv);
    }
}

