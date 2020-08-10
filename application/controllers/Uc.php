<?php

use Yaf\Controller_Abstract;
use Yaf\Dispatcher;
use Yaf\Session;

class UcController extends Controller_Abstract
{
    const Login_Key = "MDc2OWJkYWI0ZGJiMmMxMzBjNzA3MGQ5NTU0MDVkODE=";
    public $db;
    public $sessions;
    public $yac;
    public $username;

    public function init()
    {
        $this->db = new dbModel();
        $this->sessions = Session::getInstance();
        $this->yac = new Yac(); //缓存
        if (!$this->sessions->username) {
            alertText("请登录", "/index/login");
            exit;
        } else {
            $this->username = $this->sessions->username;
            $u_id = $this->db->getByKey("user", "id", "username = '{$this->username}'");
            $coin = $this->db->field("*")
                ->table("bw_currency")
                ->where("status =  1")
                ->select();
            foreach ($coin as $k => $v) {
                $address = strtolower($v['type'])."_address";
                $num = strtolower($v['type'])."_num";
                $available_balance = strtolower($v['type'])."_available_balance";
                $freeze_balance = strtolower($v['type']) ."_freeze_balance";
                $str = $address.",".$num.",".$available_balance.",".$freeze_balance;
                $result = $this->db->field($str)->table("bw_user")->where("username = '{$this->username}'")->find();
                $withdraw_address = $this->db->getByKeys("withdraw_address", "address", "u_id = {$u_id} and currency ='{$v['type']}'");
                if ($result) {
                    $coin[$k]['address'] = $result[$address];
                    $coin[$k]['num'] = $result[$num];
                    $coin[$k]['available_balance'] = $result[$available_balance];
                    $coin[$k]['freeze_balance'] = $result[$freeze_balance];
                    $coin[$k]['withdraw_address'] = $withdraw_address;
                } else {
                    $coin[$k]['address'] = "";
                    $coin[$k]['num'] = 0;
                    $coin[$k]['available_balance'] = 0;
                    $coin[$k]['freeze_balance'] = 0;
                    $coin[$k]['withdraw_address'] = $withdraw_address;
                }
            }
            $system = $this->db->field("*")
                ->table("bw_setting")
                ->find();
            $this->getView()->assign(["system" => $system]);
            $this->getView()->assign(["coin" => $coin]);
        }
    }

    public function indexAction()
    {
        $this->getView()->assign("xxxx", "yyyy");
    }

    public function accountAction()
    {
        $this->username = $this->sessions->username;
        $user = $this->db->field("*")
            ->table("bw_user")
            ->where("username = '{$this->username}'")
            ->find();
        $this->getView()->assign("user", $user);
    }

    public function assetsAction()
    {
        $u_id = $this->db->getByKey("user", "id", "username = '{$this->username}'");
        $token_addr = $this->db->getByKey("user", "usdt_address", "id = {$u_id}");
        $qrcode = $this->qrcode($token_addr);
        $withdraw_address = $this->db->field("*")
            ->table("bw_withdraw_address")
            ->where("u_id = {$u_id}")
            ->select();

        $heyue = $this->db->field("*")->table("bw_heyue")->where("u_id = {$u_id}")->find();

        $ganggan = $this->db->field("*")->table("bw_account")->where("uid = " . $u_id)->find();

        $fabi = $this->db->field("reb_cash,my_cash")->table("bw_user")->where("id = " . $u_id)->find();

        $this->getView()->assign([
            "withdraw_address" => $withdraw_address,
            "qrcode" => $qrcode,
            "heyue" => $heyue,
            "ganggan" => $ganggan,
            "fabi" => $fabi
        ]);
    }

    public function heyueAction()
    {
        $u_id = $this->db->getByKey("user", "id", "username = '{$this->username}'");
        $heyue = $this->db->field("*")
            ->table("bw_heyue")
            ->where("u_id = {$u_id}")
            ->find();
        $this->getView()->assign(["heyue" => $heyue]);
    }

    public function legalcurrencyindexAction()
    {
        $this->getView()->assign("xxxx", "yyyy");
    }

    public function leverAction()
    {
        $u_id = $this->db->getByKey("user", "id", "username = '{$this->username}'");
        $data = $this->db->field("*")->table("bw_account")->where("uid = " . $u_id)->find();
        $this->getView()->assign(["data" => $data]);
    }

    public function capitalindexAction()
    {
        $u_id = $this->db->getByKey("user","id","username = '{$this->username}'");
        $heyue = $this->db->field("*")
            ->table("bw_heyue")
            ->where("u_id = {$u_id}")
            ->find();
        $ganggan = $this->db->field("*")
            ->table("bw_account")
            ->where("uid = {$u_id}")
            ->find();
        $user = $this->db->field("*")
            ->table("bw_user")
            ->where("id = {$u_id}")
            ->find();
        $this->getView()->assign(["heyue"=>$heyue,"ganggan"=>$ganggan,"user"=>$user]);
    }

    public function authenticationAction()
    {
        $this->username = $this->sessions->username;
        $user = $this->db->field("*")
            ->table("bw_user")
            ->where("username = '{$this->username}'")
            ->find();
        $authentication = $this->db->field("*")
            ->table("bw_user_authentication")
            ->where("u_id = {$user['id']}")
            ->find();
        $this->getView()->assign(["user" => $user, "authentication" => $authentication]);
    }

    public function editaddressAction()
    {
        Dispatcher::getInstance()->autoRender(false);
        $data['u_id'] = $this->db->getByKey("user", "id", "username = '{$this->username}'");
        $data['currency'] = post("currency");
        $data['address'] = post("address");
        $data['remarks'] = post("remarks");
        $bool = $this->db->action($this->db->insertSql("withdraw_address", $data));
        echo $bool ? 1 : 0;
    }

    public function deladdressAction()
    {
        Dispatcher::getInstance()->autoRender(false);
        $u_id = $this->db->getByKey("user", "id", "username = '{$this->username}'");
        $id = post("id");
        $bool = $this->db->action($this->db->deleteSql("withdraw_address", "id = {$id} and u_id = {$u_id}"));
        echo $bool ? 1 : 0;
    }

    public function withdrawAction()
    {
        Dispatcher::getInstance()->autoRender(false);
        $userinfo = $this->db->field("*")
            ->table("bw_user")
            ->where("username = '{$this->username}'")
            ->find();
        include APP_PATH . "/application/core/Aes.php";
        $aes = new \app\core\Aes();
        $pass = post("pass");
        $num = post("numNode");
        $sqlpass = $aes->aes_decode($userinfo['transaction_password']);
        if ($userinfo['transaction_password'] == null) {
            echo 2;
        } else if ($sqlpass == $pass) {
            $this->db->beginTransaction();
            $tx['u_id'] = $userinfo['id'];
            $tx['currency'] = post("type");
            $tx['token_num'] = post("input_num");
            $tx['create_time'] = time();
            $tx['order_no'] = "tx" . build_order_no();
            $tx['status'] = 0;
            $tx['build_status'] = 1;
            $tx['address'] = post("address");
            $tx['auto_address'] = 1;
            $bool1 = $this->db->action($this->db->insertSql("withdraw", $tx));
            $log['type'] = "申请提现";
            $log['create_time'] = time();
            $log['info'] = "成功获得{$num}个{$tx['currency']}";
            $log['user_id'] = $userinfo['id'];
            $log['num'] = $num;
            $log['currency_name'] = $tx['currency'];
            $bool2 = $this->db->action($this->db->insertSql("user_num_log", $log));
            $bit_num = strtolower($tx['currency']) . "_num";
            $bit_available_balance = strtolower($tx['currency']) . "_available_balance";
            $bit_freeze_balance = strtolower($tx['currency']) . "_freeze_balance";
            if ($tx['status'] == 1 && $tx['build_status'] == 1 && $tx['auto_address'] == 0) {//自动处理
                $sql = "UPDATE bw_user SET {$bit_num} = {$bit_num} - {$tx['token_num']},{$bit_available_balance} = {$bit_available_balance} - {$tx['token_num']} WHERE id = {$userinfo['id']}";
                $bool3 = $this->db->action($sql);
                if ($bool1 && $bool2 && $bool3) {
                    $this->db->commit();
                    echo 1;
                } else {
                    $this->db->rollback();
                    echo 3;
                }
            } else if ($tx['status'] == 0 && $tx['build_status'] == 1 && $tx['auto_address'] == 1) {
                $sql = "UPDATE bw_user SET {$bit_available_balance} = {$bit_available_balance} - {$tx['token_num']},{$bit_freeze_balance} = {$bit_freeze_balance} + {$tx['token_num']} WHERE id = {$userinfo['id']}";
                $bool3 = $this->db->action($sql);
                if ($bool1 && $bool2 && $bool3) {
                    $this->db->commit();
                    echo 1;
                } else {
                    $this->db->rollback();
                    echo 3;
                }
            } else {
                $this->db->rollback();
                echo 3;
            }
        } else {
            echo 0;
        }
    }

    public function paypasswordAction()
    {
        Dispatcher::getInstance()->autoRender(false);
        $userinfo = $this->db->field("*")
            ->table("bw_user")
            ->where("username = '{$this->username}'")
            ->find();
        include APP_PATH . "/application/core/Aes.php";
        $aes = new \app\core\Aes();
        $type = post("type");
        if ($type == 'add') {
            $paypass = post("pass");
            $encode_password = $aes->aes_encode($paypass);
            $bool = $this->db->action($this->db->updateSql("user", ["transaction_password" => $encode_password], "id = {$userinfo['id']}"));
            echo $bool ? 1 : 0;
        } else {
            $locapass = post("locapass");
            $sqlpass = $aes->aes_decode($userinfo['transaction_password']);
            if ($sqlpass == $locapass) {
                $paypass = post("pass");
                $encode_password = $aes->aes_encode($paypass);
                $bool = $this->db->action($this->db->updateSql("user", ["transaction_password" => $encode_password], "id = {$userinfo['id']}"));
                echo $bool ? 1 : 0;
            } else {
                echo 2;
            }
        }
    }

    public function editpassAction()
    {
        Dispatcher::getInstance()->autoRender(false);
        $userinfo = $this->db->field("*")
            ->table("bw_user")
            ->where("username = '{$this->username}'")
            ->find();
        $pass = $this->hashkey(post("pass"), self::Login_Key);
        $locapass = $this->hashkey(post("locapass"), self::Login_Key);
        if ($locapass == $userinfo['userpass']) {
            $bool = $this->db->action($this->db->updateSql("user", ["userpass" => $pass], "id = {$userinfo['id']}"));
            echo $bool ? 1 : 0;
        } else {
            echo 2;
        }
    }

    public function userauthenticatAction()
    {
        Dispatcher::getInstance()->autoRender(false);
        $u_id = $this->db->getByKey("user", "id", "username = '{$this->username}'");
        $authenticate = post("authenticate");
        $is_authentication = $this->db->field("*")
            ->table("bw_user_authentication")
            ->where("u_id = {$u_id}")
            ->find();
        if ($is_authentication) {
            $bool1 = $this->db->action($this->db->updateSql("user", ["authenticate" => $authenticate], "id = {$u_id}"));
            if ($authenticate == 1) {
                $data['country'] = post("country");
                $data['name'] = post("name");
                $data['ctype'] = post("ctype");
                $data['cid'] = post("cid");
                $bool2 = $this->db->action($this->db->updateSql("user_authentication", $data, "u_id = {$u_id}"));
            } else {
                $data['front_photo'] = post("front_photo");
                $data['reverse_photo'] = post("reverse_photo");
                $data['handheld_photo'] = post("handheld_photo");
                $bool2 = $this->db->action($this->db->updateSql("user_authentication", $data, "u_id = {$u_id}"));
            }
            echo 1;
        } else {
            $this->db->beginTransaction();
            $bool1 = $this->db->action($this->db->updateSql("user", ["authenticate" => $authenticate], "id = {$u_id}"));
            if ($authenticate == 1) {
                $data['u_id'] = $u_id;
                $data['country'] = post("country");
                $data['name'] = post("name");
                $data['ctype'] = post("ctype");
                $data['cid'] = post("cid");
                $bool2 = $this->db->action($this->db->insertSql("user_authentication", $data));
            } else {
                $data['front_photo'] = post("front_photo");
                $data['reverse_photo'] = post("reverse_photo");
                $data['handheld_photo'] = post("handheld_photo");
                $bool2 = $this->db->action($this->db->updateSql("user_authentication", $data, "u_id = {$u_id}"));
            }
            if ($bool1 && $bool2) {
                $this->db->commit();
                echo 1;
            } else {
                $this->db->rollback();
                echo 0;
            }
        }
    }

    public function transactionsAction()
    {
        $u_id = $this->db->getByKey("user", "id", "username = '{$this->username}'");
        if($this->getRequest()->isPost()){
            Dispatcher::getInstance()->autoRender(false);
            $type = post("type");
            $where = "";
            switch($type){
                case "充值": $where = "type = '余额充值'";break;
                case "提现": $where = "type = '申请提现'";break;
                case "划转": $where = "type = '账户划转'";break;
                case "分红": $where = "type = '返利分红'";break;
                case "投币": $where = "type = '投票上币'";break;
                case "矿池": $where = "type = 'Pos矿池'";break;
                case "拍卖": $where = "type = '代币拍卖'";break;
                case "新币": $where = "type = '新币预售'";break;
                case "还币": $where = "type = '还币付息'";break;
                case "法币": $where = "type = '法币交易'";break;
                case "币币": $where = "type = '币币交易'";break;
                case "合约": $where = "type = '合约交易'";break;
            }
            $result = $this->db->field("*")->table("bw_user_num_log")->where($where." AND user_id = {$u_id}")->select();
            if($result){
                $use_log = $result;
            } else {
                $use_log = [];
            }
            echo json_encode($use_log,320);exit;
        }else {
            $result = $this->db->field("*")
                ->table("bw_user_num_log")
                ->where("user_id = {$u_id} AND type = '余额充值'")
                ->select();
            if ($result) {
                $use_log = $result;
            } else {
                $use_log = [];
            }
            $this->getView()->assign("user_log", $use_log);
        }
    }

    public function rechargeAction()
    {
        if ($this->getRequest()->isPost()) {
            Dispatcher::getInstance()->autoRender(false);
            $u_id = $this->db->getByKey("user", "id", "username = '{$this->username}'");
            $data['u_id'] = $u_id;
            $data['currency'] = post("coin");
            $data['token_num'] = post("amount");
            $data['create_time'] = time();
            $data['address'] = "";
            $data['status'] = 2;
            $data['black'] = post("block_height");
            $bool = $this->db->action($this->db->insertSql("deposit", $data));
            echo $bool ? 1 : 0;
        } else {
            $user = $this->db->field("*")
                ->table("bw_user")
                ->where("username = '{$this->username}'")
                ->find();
            $this->getView()->assign("user", $user);
        }
    }

    public function invitationAction()
    {
        $user = $this->db->field("*")
            ->table("bw_user")
            ->where("username = '{$this->username}'")
            ->find();
        $code = $user['code'];
        $url = $_SERVER['REQUEST_SCHEME'] . "://" . $_SERVER['SERVER_NAME'] . "/index/register?code=" . $code;
        $qrcode = $this->code($url, $user['username'], $code);
        $activity = new activityModel();
        $onedata = $activity->get_youinvutation($user['id'], 1);
        $twodata = $activity->get_youinvutation($user['id'], 2);
        $threedata = $activity->get_youinvutation($user['id'], 3);
        $userlist = $activity->get_group_user($user['id']);
        $this->getView()->assign([
            "code" => $code,
            "url" => $url,
            "pic" => $qrcode,
            "onedata" => $onedata,
            "twodata" => $twodata,
            "threedata" => $threedata,
            "userlist" => $userlist
        ]);
    }

    public function ajaxAction(){
        Dispatcher::getInstance()->autoRender(false);
        $u_id = $this->db->getByKey("user","id","username = '{$this->username}'");
        $xtype = post("xtype");
        $coin = strtolower(post("cointype"));
        $num = post("num");
        $start = post("start");
        $end = post("end");

        $sql1 = "";
        $sql2 = "";
        //获取用户币币账户
        $usercon_num = $coin."_num";
        $usercon_balance = $coin."_available_balance";

        switch($xtype){
            case 1 :
                $sql1 = "UPDATE bw_user SET {$usercon_balance} = {$usercon_balance} - {$num},{$usercon_num} = {$usercon_num} - {$num} WHERE id = {$u_id}";
                $sql2 = "UPDATE bw_heyue SET {$coin} = {$coin} + {$num} WHERE u_id = {$u_id}";
                break; //币币转合约
            case 2 :
                $sql1 = "UPDATE bw_user SET {$usercon_balance} = {$usercon_balance} + {$num},{$usercon_num} = {$usercon_num} + {$num} WHERE id = {$u_id}";
                $sql2 = "UPDATE bw_heyue SET {$coin} = {$coin} - {$num} WHERE u_id = {$u_id}";
                break; //合约转币币
            case 3 :
                $sql1 = "UPDATE bw_user SET {$usercon_balance} = {$usercon_balance} - {$num},{$usercon_num} = {$usercon_num} - {$num} WHERE id = {$u_id}";
                $strcoin = ($coin == 'usdt')?"balance": strtoupper($coin)."_balance";
                $sql2 = "UPDATE bw_account SET {$strcoin} = {$strcoin} + {$num} WHERE uid = {$u_id}";
                break; //币币转杠杆
            case 4 :
                $sql1 = "UPDATE bw_user SET {$usercon_balance} = {$usercon_balance} + {$num},{$usercon_num} = {$usercon_num} + {$num} WHERE id = {$u_id}";
                $strcoin = ($coin == 'usdt')?"balance": strtoupper($coin)."_balance";
                $sql2 = "UPDATE bw_account SET {$strcoin} = {$strcoin} - {$num} WHERE uid = {$u_id}";
                break; //杠杆转币币
        }
        $this->db->beginTransaction();
        $bool1 = $this->db->action($sql1);
        $bool2 = $this->db->action($sql2);
        $data['u_id'] = $u_id;
        $data['start'] = $start;
        $data['end'] = $end;
        $data['num'] = $num;
        $data['coin'] = $coin;
        $data['create_time'] = time();
        $bool3 = $this->db->action($this->db->insertSql("fund_transfer",$data));
        $log['type'] = "账户划转";
        $log['create_time'] = time();
        $log['info'] = "从{$start}划转到{$end},成功获得{$num}个{$coin}";
        $log['user_id'] = $u_id;
        $log['num'] = $num;
        $log['currency_name'] = $coin;
        $bool4 = $this->db->action($this->db->insertSql("user_num_log", $log));
        if ($bool1 && $bool2 && $bool3 && $bool4) {
            $this->db->commit();
            echo json_encode(["code"=>1,"message"=>"划转成功"]);
        } else {
            $this->db->rollback();
            echo json_encode(["code"=>0,"message"=>"划转失败"]);
        }
    }

    public function otcAction(){
        $u_id = $this->db->getByKey("user", "id", "username = '{$this->username}'");
        if($this->getRequest()->isPost()) {
            Dispatcher::getInstance()->autoRender(false);
            $data = post();
            $result = $this->db->field("*")
                ->table("bw_otc")
                ->where("name = '{$data['name']}' and u_id = {$u_id} and type = {$data['type']}")
                ->find();
            if($result){
                echo 2;
            }else{
                $data['u_id'] = $u_id;
                $data['ctime'] = time();
                $bool = $this->db->action($this->db->insertSql("otc",$data));
                echo $bool ? 1 : 0;
            }
        }else{
            $result = $this->db->field("*")
                ->table("bw_otc")
                ->where("u_id = {$u_id}")
                ->select();
            $this->getView()->assign(["result"=>$result]);
        }
    }

    public function delotcAction(){
        Dispatcher::getInstance()->autoRender(false);
        $id = post("id");
        $bool = $this->db->action($this->db->deleteSql("otc","id = {$id}"));
        echo $bool ? 1 : 0;
    }

    public function paymentAction(){
        $u_id = $this->db->getByKey("user", "id", "username = '{$this->username}'");
        if($this->getRequest()->isPost()){
            Dispatcher::getInstance()->autoRender(false);
            $data = post();
            $result = $this->db->field("*")
                ->table("bw_user_payment")
                ->where("u_id = {$u_id} and cid = '{$data['cid']}' and type = '{$data['type']}'")
                ->find();
            if($result){
                echo 2;
            }else{
                $data['u_id'] = $u_id;
                $bool = $this->db->action($this->db->insertSql("user_payment",$data));
                echo $bool ? 1 : 0;
            }
        }else{
            $result = $this->db->field("*")
                ->table("bw_user_payment")
                ->where("u_id = {$u_id}")
                ->select();
            $this->getView()->assign(["result"=>$result]);
        }
    }

    public function delpaymentAction(){
        Dispatcher::getInstance()->autoRender(false);
        $id = post("id");
        $bool = $this->db->action($this->db->deleteSql("user_payment","id = {$id}"));
        echo $bool ? 1 : 0;
    }

    public function emptyAction()
    {
        // TODO: Implement __call() method.
    }

    public function qrcode($eth_addr)
    {
        include APP_PATH . "/vendor/phpqrcode/phpqrcode.php";
        $url = "/public/eth_addr/" . $eth_addr . ".png";
        $path = APP_PATH . $url;
        @chmod($path, 0777);
        QRcode::png($eth_addr, $path, "L", 6, 1);
        return $url;
    }

    public function code($address, $user, $code)
    {
        include APP_PATH . "/vendor/phpqrcode/phpqrcode.php";
        $url = "/public/user/{$user}_{$code}.png";
        $path = APP_PATH . $url;
        @chmod($path, 0777);
        QRcode::png($address, $path, "L", 6, 1);
        return $url;
    }

    public function hashkey($data, $key)
    {
        return hash_hmac("sha256", $data, $key);
    }
}