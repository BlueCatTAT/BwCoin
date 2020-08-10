<?php
namespace pcalipay;
require_once 'pagepay/service/AlipayTradeService.php';
require_once 'pagepay/buildermodel/AlipayTradePagePayContentBuilder.php';

class Qbtspay
{
    const APP_ID = "2021001152698295";
    const PRI_KEY = "MIIEpAIBAAKCAQEAulxs+VxxmQQb0Yle+L2GAJxA9GJCTKH4cJkzNnSU6osOa3N0DuZlY0zmq3R08R13mPGp7Q/OCCpvG3SBUAETsxYw8JdgUp+lH8kxSBp4RrD011g8YPevyh4xMT5enReXvA1p8HinoLoW8VM5iOBFWAbSvDu0+839uQjWI7IgJ7PuOW8hTnO22KT41uECPV9NLFiiJXQV1kN6wmwulvTCEtipUxEUi8HvT0BNb/zULmkml8QnjJg9+KIqnpOJR+qC7v4UA2TMjQGxtqQ07jpLKmF9pxSKTPlyAO0B7ejWU0XPjMLH50EFvNAxmKYiVKGh4xAza0SNf79UGzm+BNC9rQIDAQABAoIBAQCT6mIwNdiQO/ucf20a/sqKV3sSvZ6j1ncrX92PHk9ILeDfFj8KyIG2pEX91iwvaFUR1tYpq767KnsPjpRInOI25akofO3eBop4RSdRdHj8mt1qwsUBrfYf9YDT9g4An8Y2Y2svi4R5BNrK5mSnKGLBsIC5GKbYqbH1mHbm1C3DdCV6LxhQtyzjYLZZFhGn5m2tcCZjnX8/FMD18kA4W+D7qANfP0tfb7r5Zdv7qg1Tj0UbWJMTUCfxNe6EvdFzGMoYI9MDUIkfjz4/oE89DhzM+VIWNMG45vMf4RujjID0EVjymFUoudfKAHuGW3+rPP91hjwYNDn4dh/fMltS0W9BAoGBAPyonzUvFB1L0ZsmwjtS5+0YlAKIk4pwVF2yvVEbESq+qMh8hRNp7szwVNMV2ojD3IHgWkKh6YUYIPCWC3FN/y1hR19ohk0m6ZJI8vLtFN4n//Z5i9mKJC4EGZTkAl4CE0YTBmJZ0iV5y5mBk+eSiuqO7cpFw6raZZdzeUPYwrw9AoGBALzTWkClEA0X9mIxLcJdGgWlWdGSYBH+GJJe7/XqgOJthdOfZghBO6jHxcSM7GACcVDvbm4Ce0liXP8FiGSW0wfygXlhG6taGo4PDgSw56R1hKMyt47WzRN8xKTrMIpgS4Sv7gQhuMs/dVjmNfRPAv4MLdwk75fINXWLHNsFUu4xAoGAHJEsPyUtjwptjq9ZMr/y/TnUMl0i4XpF77ov8aWv0TdxegmqOkG2AHIEBUHpTaFnoz+stO/9qVDLGKi+bnc1LPpcyYrV9I87xZB9972aqGu5YzLm/xfBc3p/Mfh91AdECp5IEIK7YgVdYePmxz4oetDiTgaJUx4ScodZ5LPzgLkCgYAagdD5ojJOpD6CKkUyM7+ja0LgmJvD6teoNIubCgBtyNIwkv/PyNiHKQQqQ14rXCxsIDBwYQjNlHFZm306IbIeO3zRfUBVHaD8sEBXiD38aELmZgg+lQjU4373Z8y4oCv5xHi1O8alQZNHl4mbcjwJTcxiSw0XUZOvnIfAd07dAQKBgQDz11YTgDDF7i/EHZvmcyG6mQCgH1WLaPCx81A7x9wedVTELOkWzKgqzOglyVtTt4PPUvvr+fFGW3T+R0o5V0YIg1Br2d/N32epvSI/eLRFoSFGpOlvohm14S9c2xLugGsph8UosCgBYxF+kBMRUEu5RBo3hQQy2xxoQY08mzWutA==";
    const PUB_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAulxs+VxxmQQb0Yle+L2GAJxA9GJCTKH4cJkzNnSU6osOa3N0DuZlY0zmq3R08R13mPGp7Q/OCCpvG3SBUAETsxYw8JdgUp+lH8kxSBp4RrD011g8YPevyh4xMT5enReXvA1p8HinoLoW8VM5iOBFWAbSvDu0+839uQjWI7IgJ7PuOW8hTnO22KT41uECPV9NLFiiJXQV1kN6wmwulvTCEtipUxEUi8HvT0BNb/zULmkml8QnjJg9+KIqnpOJR+qC7v4UA2TMjQGxtqQ07jpLKmF9pxSKTPlyAO0B7ejWU0XPjMLH50EFvNAxmKYiVKGh4xAza0SNf79UGzm+BNC9rQIDAQAB";
    //Native扫码支付
    public function nativepay($notify_url,$return_url,$order_sn,$name,$money,$body=null){
        $config["gatewayUrl"]="https://openapi.alipay.com/gateway.do";
        $config["app_id"]=self::APP_ID;
        $config["merchant_private_key"]=self::PRI_KEY;
        $config["alipay_public_key"]=self::PUB_KEY;
        $config["charset"]="UTF-8";
        $config["sign_type"]="RSA2";
        $config["return_url"]=$return_url;
        $config["notify_url"]=$notify_url;
        $payRequestBuilder=new \AlipayTradePagePayContentBuilder();
        $payRequestBuilder->setBody($body);
        $payRequestBuilder->setSubject($name);
        $payRequestBuilder->setTotalAmount($money);
        $payRequestBuilder->setOutTradeNo($order_sn);
        $aop=new \AlipayTradeService($config);
        $response = $aop->pagePay($payRequestBuilder,$config['return_url'],$config['notify_url']);
        $list["html"]=$response;
        return $response;
        //输出表单
//        var_dump($response);
    }
}


