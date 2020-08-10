<?php
use Yaf\Controller_Abstract;
use Yaf\Dispatcher;
use Yaf\Session;
//require_once 'alipay/pagepay/service/AlipayTradeService.php';
class IndexController extends Controller_Abstract {
    const Login_Key = "MDc2OWJkYWI0ZGJiMmMxMzBjNzA3MGQ5NTU0MDVkODE=";
    public $db;
    public $sessions;
    public $yac;
    const APP_ID = "2021001152698295";
    const PRI_KEY = "MIIEpAIBAAKCAQEAulxs+VxxmQQb0Yle+L2GAJxA9GJCTKH4cJkzNnSU6osOa3N0DuZlY0zmq3R08R13mPGp7Q/OCCpvG3SBUAETsxYw8JdgUp+lH8kxSBp4RrD011g8YPevyh4xMT5enReXvA1p8HinoLoW8VM5iOBFWAbSvDu0+839uQjWI7IgJ7PuOW8hTnO22KT41uECPV9NLFiiJXQV1kN6wmwulvTCEtipUxEUi8HvT0BNb/zULmkml8QnjJg9+KIqnpOJR+qC7v4UA2TMjQGxtqQ07jpLKmF9pxSKTPlyAO0B7ejWU0XPjMLH50EFvNAxmKYiVKGh4xAza0SNf79UGzm+BNC9rQIDAQABAoIBAQCT6mIwNdiQO/ucf20a/sqKV3sSvZ6j1ncrX92PHk9ILeDfFj8KyIG2pEX91iwvaFUR1tYpq767KnsPjpRInOI25akofO3eBop4RSdRdHj8mt1qwsUBrfYf9YDT9g4An8Y2Y2svi4R5BNrK5mSnKGLBsIC5GKbYqbH1mHbm1C3DdCV6LxhQtyzjYLZZFhGn5m2tcCZjnX8/FMD18kA4W+D7qANfP0tfb7r5Zdv7qg1Tj0UbWJMTUCfxNe6EvdFzGMoYI9MDUIkfjz4/oE89DhzM+VIWNMG45vMf4RujjID0EVjymFUoudfKAHuGW3+rPP91hjwYNDn4dh/fMltS0W9BAoGBAPyonzUvFB1L0ZsmwjtS5+0YlAKIk4pwVF2yvVEbESq+qMh8hRNp7szwVNMV2ojD3IHgWkKh6YUYIPCWC3FN/y1hR19ohk0m6ZJI8vLtFN4n//Z5i9mKJC4EGZTkAl4CE0YTBmJZ0iV5y5mBk+eSiuqO7cpFw6raZZdzeUPYwrw9AoGBALzTWkClEA0X9mIxLcJdGgWlWdGSYBH+GJJe7/XqgOJthdOfZghBO6jHxcSM7GACcVDvbm4Ce0liXP8FiGSW0wfygXlhG6taGo4PDgSw56R1hKMyt47WzRN8xKTrMIpgS4Sv7gQhuMs/dVjmNfRPAv4MLdwk75fINXWLHNsFUu4xAoGAHJEsPyUtjwptjq9ZMr/y/TnUMl0i4XpF77ov8aWv0TdxegmqOkG2AHIEBUHpTaFnoz+stO/9qVDLGKi+bnc1LPpcyYrV9I87xZB9972aqGu5YzLm/xfBc3p/Mfh91AdECp5IEIK7YgVdYePmxz4oetDiTgaJUx4ScodZ5LPzgLkCgYAagdD5ojJOpD6CKkUyM7+ja0LgmJvD6teoNIubCgBtyNIwkv/PyNiHKQQqQ14rXCxsIDBwYQjNlHFZm306IbIeO3zRfUBVHaD8sEBXiD38aELmZgg+lQjU4373Z8y4oCv5xHi1O8alQZNHl4mbcjwJTcxiSw0XUZOvnIfAd07dAQKBgQDz11YTgDDF7i/EHZvmcyG6mQCgH1WLaPCx81A7x9wedVTELOkWzKgqzOglyVtTt4PPUvvr+fFGW3T+R0o5V0YIg1Br2d/N32epvSI/eLRFoSFGpOlvohm14S9c2xLugGsph8UosCgBYxF+kBMRUEu5RBo3hQQy2xxoQY08mzWutA==";
    const PUB_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAulxs+VxxmQQb0Yle+L2GAJxA9GJCTKH4cJkzNnSU6osOa3N0DuZlY0zmq3R08R13mPGp7Q/OCCpvG3SBUAETsxYw8JdgUp+lH8kxSBp4RrD011g8YPevyh4xMT5enReXvA1p8HinoLoW8VM5iOBFWAbSvDu0+839uQjWI7IgJ7PuOW8hTnO22KT41uECPV9NLFiiJXQV1kN6wmwulvTCEtipUxEUi8HvT0BNb/zULmkml8QnjJg9+KIqnpOJR+qC7v4UA2TMjQGxtqQ07jpLKmF9pxSKTPlyAO0B7ejWU0XPjMLH50EFvNAxmKYiVKGh4xAza0SNf79UGzm+BNC9rQIDAQAB";

    public function init(){
        $this->db = new dbModel();
        $this->sessions= Session::getInstance();
        $this->yac = new Yac(); //缓存
        $system = $this->db->field("*")
            ->table("bw_setting")
            ->find();
        $this->getView()->assign(["system" => $system]);
    }

    public function indexAction(){
        if(isMobile()){
//            $url = "http://".$_SERVER['HTTP_HOST']."/dist";
            header("location:/dist");
            exit;
        }else{
            $result['hyzx'] = $this->db->field("*")
                ->table("bw_news")
                ->where("type = '行业资讯'")
                ->order("id desc")
                ->limit(0,8)
                ->select();
            $result['cjzx'] = $this->db->field("*")
                ->table("bw_news")
                ->where("type = '财经资讯'")
                ->order("id desc")
                ->limit(0,8)
                ->select();
            $result['gjzx'] = $this->db->field("*")
                ->table("bw_news")
                ->where("type = '国际资讯'")
                ->order("id desc")
                ->limit(0,8)
                ->select();
            $result['xtzx'] = $this->db->field("*")
                ->table("bw_news")
                ->where("type = '系统资讯'")
                ->order("id desc")
                ->limit(0,8)
                ->select();
//        $result['set'] = $this->db->field("*")
//            ->table("bw_setting")
//            ->order("id desc")
//            ->find();
            $banner = $this->db->field("banner_img")
                ->table("bw_setting")
                ->find();
            $result["banner"]=explode(",",$banner["banner_img"]);
            $this->getView()->assign("result",$result);
        }
    }

    public function ajaxdataAction(){
        Dispatcher::getInstance()->autoRender(false);
        $url = "https://dncapi.bqiapp.com/api/coin/web-coinrank?page=1&type=-1&pagesize=26&webp=1";
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $resul = curl_exec($ch);
        curl_close($ch);
        $huobi_usdt=json_decode($resul,true);
        foreach ($huobi_usdt["data"] as $k1=>$v1){
            if($v1["name"]=="XRP"){
                $huobi_usdt["data"][$k1]["name"]="LBTH";
            }
        }
        echo json_encode($huobi_usdt);
    }

    public function legalcurrencyAction(){
        $this->getView()->assign("xxx","yyy");
    }

    public function btbiAction(){
        $con=post("coin") ? get("coin") : 'BTC';
        $condition="status = 0 and type = 1 and designation = '$con'";
        $data=$this->db->field("*")
            ->table("bw_merchant")
            ->where($condition)
            ->order("id desc")
            ->limit(0,8)
            ->select();
        foreach ($data as $k=>$v){
            $str=strlen($v["name"]);
            if($str>6){
                $data[$k]["name1"]=substr_replace($v["name"],"**",3);
            }else{
                $data[$k]["name1"]=substr_replace($v["name"],"*",3);
            }
            $data[$k]["rate"]=(bc("/",$v["degree"],$v["transactions"],2)*100)."%";
        }
        $result=$this->db->field("*")->table("bw_currency")->order("id")->select();
        if(!empty($this->sessions->username)){
            $username = $_SESSION['username'];
            $is_otc = $this->db->field("authenticate,usdt_num,is_otc")->table("bw_user")->where(" username = '{$username}'")->find();
            $status = "";
            switch ($is_otc['authenticate']){
                case 0: $status = "未认证"; break;
                case 1: $status = "初级认证审核"; break;
                case 2: $status = "初级认证通过"; break;
                case 3: $status = "高级认证审核"; break;
                case 4: $status = "高级认证通过"; break;
                case 5: $status = "初级审核失败"; break;
                case 6: $status = "高级审核失败"; break;
                default : $status = "未认证"; break;
            }
            $this->getView()->assign([
                "result"=>$result,
                "data"=>$data,
                "con"=>$con,
                "is_otc"=>$is_otc['is_otc'],
                "authenticate"=>$status,
                "usdt_num"=>$is_otc['usdt_num']
            ]);
        }else{
            $this->getView()->assign([
                "result"=>$result,
                "data"=>$data,
                "con"=>$con,
                "is_otc"=>2,
                "authenticate"=>"未认证",
                "usdt_num"=>0
            ]);
        }
    }

    public function btbi1Action(){
        $con=post("coin") ? get("coin") : 'BTC';
        $condition1="status = 0 and type = 0 and designation = '$con'";
        $data1=$this->db->field("*")
            ->table("bw_merchant")
            ->where($condition1)
            ->order("id desc")
            ->limit(0,8)
            ->select();
        foreach ($data1 as $k=>$v){
            $str=strlen($v["name"]);
            if($str>6){
                $data1[$k]["name1"]=substr_replace($v["name"],"**",3);
            }else{
                $data1[$k]["name1"]=substr_replace($v["name"],"*",3);
            }
            $data1[$k]["rate"]=(bc("/",$v["degree"],$v["transactions"],2)*100)."%";
        }
        $result=$this->db->field("*")->table("bw_currency")->order("id")->select();
        if(!empty($this->sessions->username)){
            $username = $_SESSION['username'];
            $is_otc = $this->db->field("authenticate,usdt_num,is_otc")->table("bw_user")->where(" username = '{$username}'")->find();
            $status = "";
            switch ($is_otc['authenticate']){
                case 0: $status = "未认证"; break;
                case 1: $status = "初级认证审核"; break;
                case 2: $status = "初级认证通过"; break;
                case 3: $status = "高级认证审核"; break;
                case 4: $status = "高级认证通过"; break;
                case 5: $status = "初级审核失败"; break;
                case 6: $status = "高级审核失败"; break;
                default : $status = "未认证"; break;
            }
            $this->getView()->assign([
                "result"=>$result,
                "data"=>$data1,
                "con"=>$con,
                "is_otc"=>$is_otc['is_otc'],
                "authenticate"=>$status,
                "usdt_num"=>$is_otc['usdt_num']
            ]);
        }else{
            $this->getView()->assign([
                "result"=>$result,
                "data"=>$data1,
                "con"=>$con,
                "is_otc"=>2,
                "authenticate"=>"未认证",
                "usdt_num"=>0
            ]);
        }
    }

    public function btbitransactionAction(){
        $id=get("id");
        $condition="id = ".$id;
        $data=$this->db->field("*")->table("bw_merchant")->where($condition)->find();
        $str=strlen($data["name"]);
        if($str>6){
            $data["name1"]=substr_replace($data["name"],"**",3);
        }else{
            $data["name1"]=substr_replace($data["name"],"*",3);
        }
        $data["rate"]=(bc("/",$data["degree"],$data["transactions"],2)*100)."%";
//        echo "<pre>";
//        print_r($data);
//        exit;
        $this->getView()->assign(["data"=>$data]);
    }

    public function btbitransaction1Action(){
        $id=get("id");
        $condition="id = ".$id;
        $data=$this->db->field("*")->table("bw_merchant")->where($condition)->find();
        $str=strlen($data["name"]);
        if($str>6){
            $data["name1"]=substr_replace($data["name"],"**",3);
        }else{
            $data["name1"]=substr_replace($data["name"],"*",3);
        }
        $data["rate"]=(bc("/",$data["degree"],$data["transactions"],2)*100)."%";
//        echo "<pre>";
//        print_r($data);
//        exit;
        $this->getView()->assign(["data"=>$data]);
    }

    public function buyAction(){
        if($this->sessions->username){
            Dispatcher::getInstance()->autoRender(false);
            $this->username = $this->sessions->username;
            $u_id = $this->db->getByKey("user","id","username = '{$this->username}'");
            $id=get("id");
            $num=get("num");
            $yuan=get("yuan");
            $condition="id = ".$id;
            $data=$this->db->field("*")->table("bw_merchant")->where($condition)->find();
            $list["in_uid"]=$u_id;
            $list["out_id"]=$data["id"];
            $list["order_sn"]=date('Ymd').substr(implode(NULL, array_map('ord', str_split(substr(uniqid(), 7, 13), 1))), 0, 8);
            $list["designation"]=$data["designation"];
            $list["num"]=$num;
            $list["price"]=$data["price"];
            $list["amount"]=$yuan;
            $list["type"]=0;
            $list["ctime"]=time();
            $data=$_SERVER;
            $url=$_SERVER["REQUEST_SCHEME"]."://".$_SERVER["SERVER_NAME"];
            $ids=$this->db->action($this->db->insertSql("merchant_order",$list));
            if($ids){
                $notify_url=$url."/index/notify";
                $return_url=$url."/index/return";
                require APP_PATH."/pcalipay/Qbtspay.php";
                $pay=new \pcalipay\Qbtspay();
//                $return=$pay->sendpay("shop","5",300,121212151212);
                $result=$pay->nativepay($notify_url,$return_url,$list["order_sn"],"币种交易",$list["num"]);
                return $result;
            }else{
                echo "购买失败";exit;
            }

        }else{
            alertText("请登录","/index/login");exit;
        }
    }

    public function buy2Action(){
        if($this->sessions->username){
            Dispatcher::getInstance()->autoRender(false);
            $this->username = $this->sessions->username;
            $u_id = $this->db->getByKey("user","id","username = '{$this->username}'");
            $id=post("id");
            $num=post("num");
            $yuan=post("yuan");
//        $u_id=7;
//        $num=7.89340;
//        $yuan=550044;
//        $id=4230;
            $condition="id = ".$id;
            $data=$this->db->field("*")->table("bw_merchant")->where($condition)->find();
            $user=$this->db->field("*")->table("bw_user")->where("id = $u_id")->find();
            if($yuan<$data["min_price"] || $yuan>$data["max_price"]){
                echo json_encode(["code"=>400,"msg"=>"交易金额必须在交易限额范围内"]);exit;
            }
            $this->db->beginTransaction();
            $list["in_uid"]=$u_id;
            $list["out_id"]=$data["id"];
            $list["order_sn"]=date('Ymd').substr(implode(NULL, array_map('ord', str_split(substr(uniqid(), 7, 13), 1))), 0, 8);
            $list["designation"]=$data["designation"];
            $list["num"]=$num;
            $list["price"]=$data["price"];
            $list["amount"]=$yuan;
            $list["type"]=0;
            $list["status"]=1;//支付回调
            $list["ctime"]=time();
            $resu["type"]="法币交易";
            $resu["info"]="成功出售".$num."个".$data["designation"];
            $resu["create_time"]=time();
            $resu["user_id"]=$u_id;
            $resu["num"]=$yuan;
            $resu["currency_name"]="USDT";
            switch ($data["designation"]){
                case "BTC":
                    $whe["btc_num"]=bc("+",$user["btc_num"],$num);
                    if($whe["btc_num"]<0){
                        echo json_encode(["code"=>400,"msg"=>"账户余额不足"]);exit;
                    }
                    break;
                case "ETH":
                    $whe["eth_available_balance"]=bc("+",$user["eth_available_balance"],$num);
                    $whe["eth_num"]=bc("+",$user["eth_num"],$num);
                    if($whe["eth_num"]<0){
                        echo json_encode(["code"=>400,"msg"=>"账户余额不足"]);exit;
                    }
                    break;
                case "USDT":
                    $whe["usdt_available_balance"]=bc("+",$user["usdt_available_balance"],$num);
                    $whe["usdt_num"]=bc("+",$user["usdt_num"],$num);
                    if($whe["usdt_num"]<0){
                        echo json_encode(["code"=>400,"msg"=>"账户余额不足"]);exit;
                    }
                    break;
                case "LBTH":
                    $whe["lbth_available_balance"]=bc("+",$user["lbth_available_balance"],$num);
                    $whe["lbth_num"]=bc("+",$user["lbth_num"],$num);
                    if($whe["lbth_num"]<0){
                        echo json_encode(["code"=>400,"msg"=>"账户余额不足"]);exit;
                    }
                    break;
                default;
            }
            $ids=$this->db->action($this->db->insertSql("merchant_order",$list));
//        $ids=$this->db->insertSql("merchant_order",$list);
            $idds=$this->db->action($this->db->updateSql("user",$whe,"id = ".$u_id));
            $ids2=$this->db->action($this->db->insertSql("user_num_log",$resu));
            if($ids && $idds && $ids2){
                $this->db->commit();
                echo json_encode(["code"=>200,"msg"=>"买入成功"]);exit;
            }else{
                $this->db->rollback();
                echo json_encode(["code"=>400,"msg"=>"系统错误"]);exit;
            }

        }else{
            alertText("请登录","/index/login");exit;
        }
    }

    public function htmlsAction(){
        $msg=$_REQUEST["msg"];
        $data=substr($_SERVER["QUERY_STRING"],4);
//        var_dump($data);
////        echo "<pre>";
////        print_r($data);
//        exit;
        $this->getView()->assign(["data"=>$data]);
    }

    public function notifyAction(){
        $arr=$_POST;
        $config["gatewayUrl"]="https://openapi.alipay.com/gateway.do";
        $config["app_id"]=self::APP_ID;
        $config["merchant_private_key"]=self::PRI_KEY;
        $config["alipay_public_key"]=self::PUB_KEY;
        $config["charset"]="UTF-8";
        $config["sign_type"]="RSA2";
        require APP_PATH."/pcalipay/Common.php";
        $alipay = new \pcalipay\Common();
        $alipaySevice=$alipay->notify1($config);
        $alipaySevice->writeLog(var_export($_POST,true));
        $result = $alipaySevice->check($arr);
        if($result) {//验证成功
            $out_trade_no = $_POST['out_trade_no'];
            $trade_no = $_POST['trade_no'];
            $trade_status = $_POST['trade_status'];
            if($_POST['trade_status'] == 'TRADE_FINISHED') {
                file_put_contents("test.txt","重复提交");
            }
            else if ($_POST['trade_status'] == 'TRADE_SUCCESS') {
                file_put_contents("test.txt","支付成功");
            }
            echo "success";	//请不要修改或删除
        }else {
            file_put_contents("test.txt","支付失败");
            //验证失败
            echo "fail";

        }

    }

    public function buy1Action(){
        if($this->sessions->username){
            Dispatcher::getInstance()->autoRender(false);
            $this->username = $this->sessions->username;
            $u_id = $this->db->getByKey("user","id","username = '{$this->username}'");
            $phone=post("phone");
            $num=post("num");
            $yuan=post("yuan");
            $id=post("id");
            $pname=post("pname");
            $data=$this->db->field("*")->table("bw_merchant")->where("id = $id")->find();
            $user=$this->db->field("*")->table("bw_user")->where("id = $u_id")->find();
            $this->db->beginTransaction();
            $list=[
                "in_uid"=>$u_id,
                "out_id"=>$id,
                "order_sn"=>date('Ymd').substr(implode(NULL, array_map('ord', str_split(substr(uniqid(), 7, 13), 1))), 0, 8),
                "designation"=>$data["designation"],
                "num"=>$num,
                "price"=>$data["price"],
                "amount"=>$yuan,
                "type"=>1,
                "ctime"=>time(),
                "status"=>0,
                "paytime"=>time(),
                "phone"=>$phone,
                "name"=>$pname,
            ];
            switch ($data["designation"]){
                case "BTC":
                    $whe["btc_num"]=bc("-",$user["btc_num"],$num);
                    if($whe["btc_num"]<0){
                        echo json_encode(["code"=>2,"msg"=>"账户BTC余额不足"]);exit;
                    }
                    break;
                case "ETH":
                    $whe["eth_available_balance"]=bc("-",$user["eth_available_balance"],$num);
                    $whe["eth_num"]=bc("-",$user["eth_num"],$num);
                    if($whe["eth_num"]<0){
                        echo json_encode(["code"=>2,"msg"=>"账户ETH余额不足"]);exit;
                    }
                    break;
                case "USDT":
                    $whe["usdt_available_balance"]=bc("-",$user["usdt_available_balance"],$num);
                    $whe["usdt_num"]=bc("-",$user["usdt_num"],$num);
                    if($whe["usdt_num"]<0){
                        echo json_encode(["code"=>2,"msg"=>"账户USDT余额不足"]);exit;
                    }
                    break;
                case "LBTH":
                    $whe["lbth_available_balance"]=bc("-",$user["lbth_available_balance"],$num);
                    $whe["lbth_num"]=bc("-",$user["lbth_num"],$num);
                    if($whe["lbth_num"]<0){
                        echo json_encode(["code"=>2,"msg"=>"账户代币余额不足"]);exit;
                    }
                    break;
                    default;
            }
            $ids=$this->db->action($this->db->insertSql("merchant_order",$list));
            $idds=$this->db->action($this->db->updateSql("user",$whe,"id = ".$u_id));
            if($ids && $idds){
                $this->db->commit();
                echo json_encode(["code"=>1,"msg"=>"出售成功"]);exit;
            }else{
                $this->db->rollback();
                echo json_encode(["code"=>2,"msg"=>"出售失败"]);exit;
            }
        }else{
            alertText("请登录","/index/login");exit;
        }
    }

    public function returnAction(){
        $arr=$_GET;
        $config["gatewayUrl"]="https://openapi.alipay.com/gateway.do";
        $config["app_id"]=self::APP_ID;
        $config["merchant_private_key"]=self::PRI_KEY;
        $config["alipay_public_key"]=self::PUB_KEY;
        $config["charset"]="UTF-8";
        $config["sign_type"]="RSA2";
        require APP_PATH."/pcalipay/Common.php";
        $alipay = new \pcalipay\Common();
        $alipaySevice=$alipay->return1($config);
        $result = $alipaySevice->check($arr);
        if($result) {//验证成功
//            $out_trade_no = htmlspecialchars($_GET['out_trade_no']);
//
//            $trade_no = htmlspecialchars($_GET['trade_no']);
//
//            echo "验证成功<br />支付宝交易号：".$trade_no;
            $this->getView();
         } else {
            //验证失败
            echo "验证失败";
        }
    }

    public function loginAction(){//默认Action
         if($this->getRequest()->isPost()){
             Dispatcher::getInstance()->autoRender(false);
             $data['user'] = post("tel");
             $data['pass'] = $this->hashkey(post("password"),self::Login_Key);
             $sql = $this->db->field("username,userpass")
                 ->table("bw_user")
                 ->where("username = ? and userpass = ?")
                 ->getSql();
             $result = $this->db->stmtFetch($sql,[$data['user'],$data['pass']]);
             if($result){
                 $datax['login_time'] = time();
                 $datax['ip'] = server("REMOTE_ADDR");
                 $this->db->action($this->db->updateSql("user",$datax,"username = '{$data['user']}' and userpass = '{$data['pass']}'"));
                 $this->sessions->username = $data['user'];
                 echo "登录成功";exit;
             }else{
                 echo "登录失败";exit;
             }
         }else{
             $this->getView()->assign("xxxx", "yyyy");
         }
    }

    public function registerAction(){
        if($this->getRequest()->isPost()){
            Dispatcher::getInstance()->autoRender(false);
            $phone = $_POST['tel'];
            $password = $_POST['password'];
            $code = $_POST['code'];
            $result_tel = $this->db->field("id")
                ->table("bw_user")
                ->where("tel = $phone")
                ->find();
            if(!empty($result_tel["id"])){
                echo "手机号已经存在，请直接登录";exit;
            }else{
                $result = $this->db->field("id,code")
                    ->table("bw_user")
                    ->where("code = '{$code}'")
                    ->find();
                $pass = $this->hashkey($password,self::Login_Key);
                if(!empty($result['id'])){
                    $group_id = $result['group_id'].",".$result['id'];
                    $this->register($phone,$pass,$result['id'],$group_id);
                }else{
                    $this->register($phone,$pass,0,0);
                }
            }
        }else{
            $this->getView()->assign("xxx","yyy");
        }
    }

    public function forgetrasswordAction(){
        if($this->getRequest()->isPost()){
            Dispatcher::getInstance()->autoRender(false);
            $tel = post("tel");
            $password = $this->hashkey(post("password"),self::Login_Key) ;
            $bool = $this->db->action($this->db->updateSql("user",["userpass"=>$password],"tel = {$tel}"));
            echo $bool ? "修改成功":"修改成功";
        }else{
            $this->getView()->assign("xxx","yyy");
        }
    }

    public function loginoutAction(){
        Dispatcher::getInstance()->autoRender(false);
        $this->sessions->del('username');
        echo "<script>sessionStorage.removeItem('status');</script>";
        success("退出成功","/index/index");
    }

    public function telcodeAction(){
        Dispatcher::getInstance()->autoRender(false);
        $tel = $_POST['tel'];
        if(isset($result['tel'])){
            echo "缺少手机号";exit;
        }
        if(!preg_match('/1\d{10}/',$tel,$arr)){
            echo "手机号格式错误";exit;
        }else{
            include APP_PATH."/application/core/Sms.php";
            $sms = new \app\core\Sms();
            $rand = rand(1000,9999);
            $code = $sms->smscode($tel,$rand);
            if($code['Message']=='OK'){
                $data['phone'] = $tel;
                $data['send_time'] = time();
                $data['code'] = $rand;
                $data['create_time'] = time();
                $data['status'] = ($code['Code'] == "OK ")?1:0;
                $this->db->action($this->db->insertSql('short_message',$data));
                echo "短信验证码已经发送";exit;
            }else{
                echo "短信验证码已经发送";exit;
            }
        }
    }

    public function ajaxsmsAction(){
        Dispatcher::getInstance()->autoRender(false);
        $phone = $_POST['tel'];
        $code = $_POST['lockcode'];
        $locktime = time();
        $telsvcode = $this->db->field("*")
            ->table("bw_short_message")
            ->where(" phone = '{$phone}' and code = '{$code}' ")
            ->find();
        if($telsvcode){
            $datatime = $telsvcode['create_time'];
            if( ($locktime - $datatime) < 1200){
                $datacode = $telsvcode['code'];
                if($datacode == $code){
                    $this->sessions->code = 1;
                    echo "验证通过";exit;
                }else{
                    echo "验证码错误";exit;
                }
            }else{
                echo "验证码过期";exit;
            }
        }else{
            echo "验证码错误";exit;
        }
    }

    public function newsAction(){
        $id = get("id");
        $result = $this->db->field("*")
            ->table("bw_news")
            ->where("id = {$id}")
            ->find();
        $result['content'] = htmlspecialchars_decode($result['content']);
        $this->getView()->assign(["result"=>$result]);
    }

    public function noticeAction(){
        $result = $this->db->field("*")
            ->table("bw_notice")
            ->select();
        if($result){
            foreach ($result as $k=>$v){
                $result[$k]['content'] = htmlspecialchars_decode($v['content']);
            }
        }else{
            $result = [];
        }
        $this->getView()->assign(["result"=>$result]);
    }

    public function ajaxnoticeAction(){
        Dispatcher::getInstance()->autoRender(false);
        $id = post("id");
        $result = $this->db->field("*")
            ->table("bw_notice")
            ->where("id = {$id}")
            ->find();
        if($result){
            $result['content'] = htmlspecialchars_decode($result['content']);
            echo json_encode($result);
        }else{
            echo json_encode([]);
        }
    }

    public function otcAction(){
        Dispatcher::getInstance()->autoRender(false);
        $user = $this->db->field("*")
            ->table("bw_user")
            ->where("username = '{$this->sessions->username}'")
            ->find();
        if($user['usdt_num'] < 100){
            echo json_encode(['code'=>501,'msg'=>'请先充值usdt']);
        }
        if($user['authenticate'] != 4){
            echo json_encode(['code'=>501,'msg'=>'请先提高认证等级']);
        }
        $mercname = post("mercname");
        $otcinfo = $this->db->field("*")
            ->table("bw_otc")
            ->where("name = '{$mercname}'")
            ->find();
        if($otcinfo){
            echo json_encode(['code'=>501,'msg'=>'商家名称已存在']);
        }else{
            $bool = $this->db->action($this->db->updateSql("user",['is_otc'=>1],"id = {$user['id']}"));
            if($bool){
                echo json_encode(['code'=>1,'msg'=>'申请成功']);
            }else{
                echo json_encode(['code'=>1,'msg'=>'申请失败']);
            }
        }
    }

    public function otclistAction(){
        Dispatcher::getInstance()->autoRender(false);
        $tag = post("tag");
        $type = 0;
        if($tag == '购买'){
            $type = 0;
        }else{
            $type = 1;
        }
        $result = $this->db->field("*")
            ->table("bw_otc")
            ->where("type = {$type}")
            ->select();
        if($result){
            echo json_encode($result);
        }else{
            echo json_encode([]);
        }
    }

    public function otctransactionAction(){
        $id = get('id');
        $result = $this->db->field("*")
            ->table("bw_otc")
            ->where("id = {$id}")
            ->find();
        $this->getView()->assign("result",$result);
    }

    public function hashkey($data,$key){
        return hash_hmac("sha256",$data,$key);
    }
    //短信验证码注册
    public function register($phone,$pass,$floor_id,$group_id)
    {
        $userData['username'] = $phone;
        $userData['userpass'] = $pass;
        $userData['tel'] = $phone;
        $userData['lbth_address'] = "";
        $userData['lbth_num'] = 0;
        $userData['lbth_available_balance'] = 0;
        $userData['lbth_freeze_balance'] = 0;
        $userData['usdt_address'] = "";
        $userData['usdt_num'] = 0;
        $userData['usdt_available_balance'] = 0;
        $userData['usdt_freeze_balance'] = 0;
        $userData['eth_address'] = "";
        $userData['eth_num'] = 0;
        $userData['eth_available_balance'] = 0;
        $userData['eth_freeze_balance'] = 0;
        $userData['btc_address'] = "";
        $userData['btc_num'] = 0;
        $userData['btc_available_balance'] = 0;
        $userData['btc_freeze_balance'] = 0;
        $userData['create_time'] = time();
        $userData['login_time'] = time();
        $userData['floor_id'] = $floor_id;
        $userData['group_id'] = $group_id;
        $userData['code'] = $this->build_merc_code();
        $userData['ip'] = server("REMOTE_ADDR");
        $userData['avatar'] = "";
        $userData['is_login'] = 0;
        //开启事物
        $this->db->beginTransaction();
        $bool1 = $this->db->action($this->db->insertSql("user", $userData));
        $user_id = $this->db->getInsertId();
        $token_result = $this->db->field("*")
            ->table("bw_token")
            ->where("u_id = 0")
            ->find();
        $user['lbth_address'] = $token_result['token_addr'];
        $user['usdt_address'] = $token_result['usdt_addr'];
        $user['eth_address'] = $token_result['eth_addr'];
        $user['btc_address'] = $token_result['btc_addr'];
        $list["uid"]=$user_id;
        $token['u_id'] = $user_id;
        $bool2 = $this->db->action($this->db->updateSql("user",$user,"id = {$user_id}"));
        $bool4 = $this->db->action($this->db->insertSql("account",$list));
        $heyue['u_id'] = $user_id;
        $bool5 = $this->db->action($this->db->insertSql("heyue",$heyue));
        $bool3 = $this->db->action($this->db->updateSql("token",$token,"token_id = {$token_result['token_id']}"));
        if ($bool1 && $bool2 && $bool3 && $bool4 && $bool5) {
            $this->db->commit();
            echo "注册成功";exit;
        } else {
            $this->db->rollback();
            echo "系统繁忙请稍后再试";exit;
        }
    }

    public function build_merc_code(){
        $str = uniqid();
        return "B".strtoupper($str)."W";
    }

    public function emptyAction()
    {
        // TODO: Implement __call() method.
    }

}