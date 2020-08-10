<?php
namespace alipay;
require_once 'aop/AopClient.php';
require_once 'aop/AopCertClient.php';
require_once 'aop/request/AlipayTradeAppPayRequest.php';
require_once 'aop/request/AlipayFundTransUniTransferRequest.php';
require_once 'aop/request/AlipayFundTransToaccountTransferRequest.php';
require_once 'pagepay/service/AlipayTradeService.php';
require_once 'pagepay/buildermodel/AlipayTradePagePayContentBuilder.php';

class Qbtspay
{
    const APP_ID = "2021001152698295";
    const PRI_KEY = "MIIEpAIBAAKCAQEAulxs+VxxmQQb0Yle+L2GAJxA9GJCTKH4cJkzNnSU6osOa3N0DuZlY0zmq3R08R13mPGp7Q/OCCpvG3SBUAETsxYw8JdgUp+lH8kxSBp4RrD011g8YPevyh4xMT5enReXvA1p8HinoLoW8VM5iOBFWAbSvDu0+839uQjWI7IgJ7PuOW8hTnO22KT41uECPV9NLFiiJXQV1kN6wmwulvTCEtipUxEUi8HvT0BNb/zULmkml8QnjJg9+KIqnpOJR+qC7v4UA2TMjQGxtqQ07jpLKmF9pxSKTPlyAO0B7ejWU0XPjMLH50EFvNAxmKYiVKGh4xAza0SNf79UGzm+BNC9rQIDAQABAoIBAQCT6mIwNdiQO/ucf20a/sqKV3sSvZ6j1ncrX92PHk9ILeDfFj8KyIG2pEX91iwvaFUR1tYpq767KnsPjpRInOI25akofO3eBop4RSdRdHj8mt1qwsUBrfYf9YDT9g4An8Y2Y2svi4R5BNrK5mSnKGLBsIC5GKbYqbH1mHbm1C3DdCV6LxhQtyzjYLZZFhGn5m2tcCZjnX8/FMD18kA4W+D7qANfP0tfb7r5Zdv7qg1Tj0UbWJMTUCfxNe6EvdFzGMoYI9MDUIkfjz4/oE89DhzM+VIWNMG45vMf4RujjID0EVjymFUoudfKAHuGW3+rPP91hjwYNDn4dh/fMltS0W9BAoGBAPyonzUvFB1L0ZsmwjtS5+0YlAKIk4pwVF2yvVEbESq+qMh8hRNp7szwVNMV2ojD3IHgWkKh6YUYIPCWC3FN/y1hR19ohk0m6ZJI8vLtFN4n//Z5i9mKJC4EGZTkAl4CE0YTBmJZ0iV5y5mBk+eSiuqO7cpFw6raZZdzeUPYwrw9AoGBALzTWkClEA0X9mIxLcJdGgWlWdGSYBH+GJJe7/XqgOJthdOfZghBO6jHxcSM7GACcVDvbm4Ce0liXP8FiGSW0wfygXlhG6taGo4PDgSw56R1hKMyt47WzRN8xKTrMIpgS4Sv7gQhuMs/dVjmNfRPAv4MLdwk75fINXWLHNsFUu4xAoGAHJEsPyUtjwptjq9ZMr/y/TnUMl0i4XpF77ov8aWv0TdxegmqOkG2AHIEBUHpTaFnoz+stO/9qVDLGKi+bnc1LPpcyYrV9I87xZB9972aqGu5YzLm/xfBc3p/Mfh91AdECp5IEIK7YgVdYePmxz4oetDiTgaJUx4ScodZ5LPzgLkCgYAagdD5ojJOpD6CKkUyM7+ja0LgmJvD6teoNIubCgBtyNIwkv/PyNiHKQQqQ14rXCxsIDBwYQjNlHFZm306IbIeO3zRfUBVHaD8sEBXiD38aELmZgg+lQjU4373Z8y4oCv5xHi1O8alQZNHl4mbcjwJTcxiSw0XUZOvnIfAd07dAQKBgQDz11YTgDDF7i/EHZvmcyG6mQCgH1WLaPCx81A7x9wedVTELOkWzKgqzOglyVtTt4PPUvvr+fFGW3T+R0o5V0YIg1Br2d/N32epvSI/eLRFoSFGpOlvohm14S9c2xLugGsph8UosCgBYxF+kBMRUEu5RBo3hQQy2xxoQY08mzWutA==";
    const PUB_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAulxs+VxxmQQb0Yle+L2GAJxA9GJCTKH4cJkzNnSU6osOa3N0DuZlY0zmq3R08R13mPGp7Q/OCCpvG3SBUAETsxYw8JdgUp+lH8kxSBp4RrD011g8YPevyh4xMT5enReXvA1p8HinoLoW8VM5iOBFWAbSvDu0+839uQjWI7IgJ7PuOW8hTnO22KT41uECPV9NLFiiJXQV1kN6wmwulvTCEtipUxEUi8HvT0BNb/zULmkml8QnjJg9+KIqnpOJR+qC7v4UA2TMjQGxtqQ07jpLKmF9pxSKTPlyAO0B7ejWU0XPjMLH50EFvNAxmKYiVKGh4xAza0SNf79UGzm+BNC9rQIDAQAB";
    //app支付
    public function sendpay($type,$u_id,$pay_amount,$order_on)
    {
        echo 7788;
        exit;
        $aop = new \AopClient;
        $aop->gatewayUrl = "https://openapi.alipay.com/gateway.do";
        $aop->appId = self::APP_ID;
        $aop->rsaPrivateKey = self::PRI_KEY;
        $aop->format = "json";
        $aop->charset = "UTF-8";
        $aop->signType = "RSA2";
        $aop->alipayrsaPublicKey= self::PUB_KEY;
        //实例化具体API对应的request类,类名称和接口名称对应,当前调用接口名称：alipay.trade.app.pay
        $request = new \AlipayTradeAppPayRequest();
        //SDK已经封装掉了公共参数，这里只需要传入业务参数
        $bizcontent = str_replace("\\/","/",json_encode([
            "body"=>"testbody",
            "subject"=>"test",
            "out_trade_no"=>$order_on,
            "timeout_express"=>"30m",
            "total_amount"=>"0.01", //$pay_amount
            "product_code"=>"QUICK_MSECURITY_PAY",
            "extend_params"=>[
                "u_id"=>$u_id,
                "pay_type"=>$type
            ]
        ],JSON_UNESCAPED_UNICODE));
        $path = "";
        switch ($type){
            case "balance": $path = "alipaynotify"; break;
            case "shop": $path = "alipaynotifyshop"; break;
            case "device": $path = "alipaynotifydevice"; break;
        }
        $url = "http://".$_SERVER['HTTP_HOST']."/api/pay/".$path;
        $request->setNotifyUrl($url);
        $request->setBizContent($bizcontent);
        //这里和普通的接口调用不同，使用的是sdkExecute
        $response = $aop->sdkExecute($request);
        //htmlspecialchars是为了输出到页面时防止被浏览器将关键参数html转义，实际打印到日志以及http传输不会有这个问题
        //return htmlspecialchars($response);//就是orderString 可以直接给客户端请求，无需再做处理。
        return $response;
    }
    //回调验签
    public function decodepay(){
        $aop = new \AopClient;
        $aop->alipayrsaPublicKey = self::PUB_KEY;
        $flag = $aop->rsaCheckV1($_POST, NULL, "RSA2");
        return $flag;
    }
    //提现
    public function transfer($pay_amount,$username,$aliaccount,$order_on){
        //证书模式
//        $aop = new \AopCertClient();
//        $aop->gatewayUrl ='https://openapi.alipay.com/gateway.do';
//        $aop->appId = '';
//        $aop->rsaPrivateKey = '私钥';
//        $appCertPath = "应用公钥证书绝对路径";
//        $alipayCertPath = "支付宝公钥证书绝对路径";
//        $rootCertPath = "支付宝根证书绝对路径";
//        $aop->apiVersion = '1.0';
//        $aop->signType = 'RSA2';
//        $aop->postCharset='utf-8';
//        $aop->format='json';
//        $aop->alipayrsaPublicKey = $aop->getPublicKey($alipayCertPath);//调用getPublicKey获取支付宝公钥序列号
//        //$aop->isCheckAlipayPublicCert = true;//是否校验自动下载的支付宝公钥证书，如果开启校验要保证支付宝根证书在有效期内
//        $aop->appCertSN = $aop->getCertSN($appCertPath);//调用getCertSN获取证书序列号
//        $aop->alipayRootCertSN = $aop->getRootCertSN($rootCertPath);//调用getRootCertSN获取支付宝根证书序列号

        //非证书模式
        $aop = new \AopClient();
        $aop->gatewayUrl = 'https://openapi.alipay.com/gateway.do';
        $aop->appId = self::APP_ID;
        $aop->rsaPrivateKey = self::PRI_KEY;
        $aop->apiVersion = '1.0';
        $aop->signType = 'RSA2';
        $aop->postCharset='UTF-8';
        $aop->format='json';
        $request = new \AlipayFundTransToaccountTransferRequest();
        $bizcontent = str_replace("\\/","/",json_encode([
            "out_biz_no"=>$order_on,
            "payee_type"=>"ALIPAY_LOGONID",
            "payee_account"=> $aliaccount,
            "payee_real_name"=> $username,
            "amount"=>"0.1",
            "remark"=>"单笔转账测试"
        ],JSON_UNESCAPED_UNICODE));
        $request->setBizContent($bizcontent);
        $result = $aop->execute($request);
        $responseNode = str_replace(".", "_", $request->getApiMethodName()) . "_response";
        $resultCode = $result->$responseNode->code;
        if(!empty($resultCode)&&$resultCode == 10000){
            return "转账成功！";
        } else {
            return "转账失败！";
        }
        //$aop->alipayrsaPublicKey= self::PUB_KEY;
    }
    //h5支付
    public function h5pay(){}
    //Native扫码支付
    public function nativepay($notify_url,$return_url,$order_sn,$name,$money,$body=null){
        echo 54545;
        exit;
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
        //输出表单
        var_dump($response);
    }
}


