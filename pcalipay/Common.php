<?php
namespace alipay;
require_once 'pagepay/service/AlipayTradeService.php';

class Common
{
    public function notify1($config){
        $alipaySevice = new \AlipayTradeService($config);
        return $alipaySevice;
    }

    public function return1($config){
        $alipaySevice = new \AlipayTradeService($config);
        return $alipaySevice;
    }
}


