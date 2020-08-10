<?php
use Yaf\Controller_Abstract;
use Yaf\Dispatcher;
use Yaf\Session;
class ActivityController extends Controller_Abstract {
    public $db;
    public $sessions;
    public $yac;
    public $username;
    public function init(){
        $this->db = new dbModel();
        $this->sessions= Session::getInstance();
        if(!$this->sessions->username){
            alertText("请登录","/index/login");exit;
        }else {
            $this->username = $this->sessions->username;
            $system = $this->db->field("*")
                ->table("bw_setting")
                ->find();
            $this->getView()->assign(["system" => $system]);
        }
    }

    public function voteAction(){
        $result = $this->db->field("*")
            ->table("bw_activity")
            //->where("status = 1")
            ->select();
        $u_id = $this->db->getByKey("user","id","username = '{$this->username}'");
        $user_log = $this->db->field("*")
            ->table("bw_vote")
            ->where("user_id = {$u_id}")
            ->select();
        $this->getView()->assign(["result"=>$result,"user_log"=>$user_log]);
    }

    public function isvoteAction(){
        Dispatcher::getInstance()->autoRender(false);
        $id = post("id");
        $result = $this->db->field("*")
            ->table("bw_activity ")
            ->where("id = {$id}")
            ->find();
        $result['currency_id'] = get_currency_name($result['currency_id']);
        $result['x_currency_id'] = get_currency_name($result['x_currency_id']);
        echo json_encode($result);
    }

    public function ajaxvoteAction(){
        Dispatcher::getInstance()->autoRender(false);
        $activity_id = post("id"); //活动id
        //获取活动表数据
        $result = $this->db->field("*")
            ->table("bw_activity ")
            ->where("id = {$activity_id}")
            ->find();
        $result['currency_id'] = get_currency_name($result['currency_id']);
        $result['x_currency_id'] = get_currency_name($result['x_currency_id']);
        //检查用户数据
        $user = $this->db->field("*")
            ->table("bw_user ")
            ->where("username = '{$this->username}'")
            ->find();
        //获取用户活动
        $user_id = $user['id']; //用户ID
        $status = post("is_status");
        $number = post("number");
        $paypass = post("paypass");
        //计算扣除币数
        $num = $number * $result['consume_number'];
        //扣除币种类型
        $coin_type = strtolower($result['x_currency_id']);
        //用户币种消耗类型
        $user_coin_num = $coin_type."_num";
        $user_coin_available_balance = $coin_type."_available_balance";
        include APP_PATH."/application/core/Aes.php";
        $aes = new \app\core\Aes();
        $pay = $aes->aes_encode($paypass);
        if($pay == $user['transaction_password']){
            if($user[$user_coin_available_balance] - $num >= 0){
                $this->db->beginTransaction();
                $data['activity_id'] = $activity_id;
                $data['user_id'] = $user_id;
                $data['currency_name'] = $result['currency_id'];
                $data['x_currency_name'] = $result['x_currency_id'];
                $data['number'] = $number;
                $data['expend_num'] = $num;
                $data['ctime'] = time();
                $data['status'] = $status;
                $bool1 = $this->db->action($this->db->insertSql("vote",$data));
                //用户未加币，只扣除了币
                $sql = "UPDATE bw_user SET {$user_coin_num} = {$user_coin_num} - {$num},{$user_coin_available_balance} = {$user_coin_available_balance} - {$num} WHERE id = {$user_id}";
                $bool2 = $this->db->action($sql);
                $status_num = ($status == 1)?"support":"oppose";
                $sql2 = "UPDATE bw_activity SET {$status_num} = {$status_num} + {$number} WHERE id = {$activity_id}";
                $bool3 = $this->db->action($sql2);
                if ($bool1 && $bool2 && $bool3) {
                    $this->db->commit();
                    echo json_encode(["code"=>1,"msg"=>"投票成功"]);
                } else {
                    $this->db->rollback();
                    echo json_encode(["code"=>0,"msg"=>"投票失败，稍后再试"]);
                }
            }else{
                echo json_encode(["code"=>2,"msg"=>"该币种余额不足"]);
            }
        }else{
            echo json_encode(["code"=>2,"msg"=>"交易密码错误"]);
        }
    }

    public function currencyinterestAction(){
        $result = $this->db->field("c.*,t.type,t.icon")
            ->table("bw_cbsx as c")
            ->join("bw_currency as t","t.id = c.currency_id")
            ->where("c.status = 1")
            ->select();
        $u_id = $this->db->getByKey("user","id","username = '{$this->username}'");
        $user_log = $this->db->field("*")
            ->table("bw_currencyinterest")
            ->where("user_id = {$u_id}")
            ->select();
        $this->getView()->assign(["result"=>$result,"user_log"=>$user_log]);
    }

    public function iscbsxAction(){
        Dispatcher::getInstance()->autoRender(false);
        $id = post("id");
        $result = $this->db->field("currency_id,ac_method")
            ->table("bw_cbsx")
            ->where("id = {$id}")
            ->find();
        $result['currency_id'] = get_currency_name($result['currency_id']);
        $coin_type = strtolower($result['currency_id']);
        $user_coin_available_balance = $coin_type."_available_balance";
        $u_id = $this->db->getByKey("user","id","username = '{$this->username}'");
        $user = $this->db->field($user_coin_available_balance)
            ->table("bw_user")
            ->where("id = {$u_id}")
            ->find();
        $result['available_balance'] = $user[$user_coin_available_balance];
        echo json_encode($result);
    }

    public function ajaxcbsxAction(){
        Dispatcher::getInstance()->autoRender(false);
        $cbsx_id = post("id");
        //活动数据
        $result = $this->db->field("c.*,t.type,t.icon")
            ->table("bw_cbsx as c")
            ->join("bw_currency as t","t.id = c.currency_id")
            ->where("c.status = 1 AND c.id = {$cbsx_id}")
            ->find();
        $result['currency_id'] = get_currency_name($result['currency_id']);
        $result['x_currency_id'] = get_currency_name($result['x_currency_id']);
        $num = post("num");  //金额
        $paypass = post("paypass"); //支付密码
        //检查用户数据
        $user = $this->db->field("*")
            ->table("bw_user ")
            ->where("username = '{$this->username}'")
            ->find();
        $user_id = $user['id']; //用户ID
        $coin_type = strtolower($result['currency_id']);  //扣除币种类型
        //用户币种消耗类型
        $user_coin_available_balance = $coin_type."_available_balance";
        $user_coin_freeze_balance = $coin_type."_freeze_balance";
        include APP_PATH."/application/core/Aes.php";
        $aes = new \app\core\Aes();
        $pay = $aes->aes_encode($paypass);
        if($pay == $user['transaction_password']){
            if($user[$user_coin_available_balance] - $num >= 0){
                $this->db->beginTransaction();
                $data['period'] = $result['period'];
                $data['cbsx_id'] = $cbsx_id;
                $data['user_id'] = $user_id;
                $data['currency_name'] = $result['currency_id'];
                $data['x_currency_name'] = $result['x_currency_id'];
                $data['num'] = $num;
                $data['ctime'] = time();
                $data['ac_method'] = $result['ac_method'];
                $data['cycle_fee'] = $result['cycle_fee'];
                $data['financial_cycle'] = $result['financial_cycle'];
                $data['time_type'] = $result['time_type'];
                $data['order_status'] = 1;
                $bool1 = $this->db->action($this->db->insertSql("currencyinterest",$data));
                //用户后续未处理，只扣冻结了币
                $sql = "UPDATE bw_user SET {$user_coin_freeze_balance} = {$user_coin_freeze_balance} + {$num},{$user_coin_available_balance} = {$user_coin_available_balance} - {$num} WHERE id = {$user_id}";
                $bool2 = $this->db->action($sql);
                $sql2 = "UPDATE bw_cbsx SET start_mun = start_mun + {$num} WHERE id = {$cbsx_id}";
                $bool3 = $this->db->action($sql2);
                if ($bool1 && $bool2 && $bool3) {
                    $this->db->commit();
                    echo json_encode(["code"=>1,"msg"=>"存币成功"]);
                } else {
                    $this->db->rollback();
                    echo json_encode(["code"=>0,"msg"=>"存币失败，稍后再试"]);
                }
            }else{
                echo json_encode(["code"=>2,"msg"=>"该币种余额不足"]);
            }
        }else{
            echo json_encode(["code"=>2,"msg"=>"交易密码错误"]);
        }
    }

    public function newcoinAction(){
        $result = $this->db->field("*")
            ->table("bw_xbys")
            ->where("status = 1")
            ->select();
        $u_id = $this->db->getByKey("user","id","username = '{$this->username}'");
        $user_log = $this->db->field("*")
            ->table("bw_newscoin")
            ->where("user_id = {$u_id}")
            ->select();
        $this->getView()->assign(["result"=>$result,"user_log"=>$user_log]);
    }

    public function newcoindetailsAction(){
        $id = get("id");
        $result = $this->db->field("*")
            ->table("bw_xbys")
            ->where("id = {$id}")
            ->find();
        $user = $this->db->field("*")
            ->table("bw_user")
            ->where("username = '{$this->username}'")
            ->find();
        $this->getView()->assign(["result"=>$result,"user"=>$user]);
    }

    public function ajaxxbysAction(){
        Dispatcher::getInstance()->autoRender(false);
        $activity_id = post("id"); //活动id
        //获取活动表数据
        $result = $this->db->field("*")
            ->table("bw_xbys ")
            ->where("id = {$activity_id}")
            ->find();
        $result['currency_id'] = get_currency_name($result['currency_id']);
        $result['x_currency_id'] = get_currency_name($result['x_currency_id']);
        //检查用户数据
        $user = $this->db->field("*")
            ->table("bw_user")
            ->where("username = '{$this->username}'")
            ->find();
        //获取用户活动
        $user_id = $user['id']; //用户ID
        $number = post("licai_jine");
        $paypass = post("paypassword");
        //计算扣除币数
        $num = $number * $result['price'];
        //扣除币种类型
        $coin_type = strtolower($result['x_currency_id']);
        //用户币种消耗类型
        $user_coin_num = $coin_type."_num";
        $user_coin_available_balance = $coin_type."_available_balance";
        include APP_PATH."/application/core/Aes.php";
        $aes = new \app\core\Aes();
        $pay = $aes->aes_encode($paypass);
        if($pay == $user['transaction_password']){
            if($user[$user_coin_available_balance] - $num >= 0){
                $this->db->beginTransaction();
                $data['xbys_id'] = $activity_id;
                $data['user_id'] = $user_id;
                $data['title'] =  $result['title'];
                $data['currency_name'] = $result['currency_id'];
                $data['x_currency_name'] = $result['x_currency_id'];
                $data['price'] = $result['price'];
                $data['num'] = $number;
                $data['create_time'] = time();
                $data['unfreeze'] = $result['unfreeze'];
                $data['financial_cycle'] = $result['financial_cycle'];
                $data['time_type'] = $result['time_type'];
                $data['freeze_status'] = 0;
                $bool1 = $this->db->action($this->db->insertSql("newscoin",$data));
                //用户未加币，只扣除了币
                $sql = "UPDATE bw_user SET {$user_coin_num} = {$user_coin_num} - {$num},{$user_coin_available_balance} = {$user_coin_available_balance} - {$num} WHERE id = {$user_id}";
                $bool2 = $this->db->action($sql);
                $sql2 = "UPDATE bw_xbys SET deal = deal + {$number} WHERE id = {$activity_id}";
                $bool3 = $this->db->action($sql2);
                if ($bool1 && $bool2 && $bool3) {
                    $this->db->commit();
                    echo json_encode(["code"=>1,"msg"=>"预售成功"]);
                } else {
                    $this->db->rollback();
                    echo json_encode(["code"=>0,"msg"=>"预售失败，稍后再试"]);
                }
            }else{
                echo json_encode(["code"=>2,"msg"=>"该币种余额不足"]);
            }
        }else{
            echo json_encode(["code"=>2,"msg"=>"交易密码错误"]);
        }
    }

    public function auktionAction(){
        $fomo = new fomoModel();
        $userdata = $fomo->get_user_info($this->username);
        $fomodata = $fomo->fomo;
        if($fomodata){
            $fomodata['award'] = $fomodata['award_btc']."BTC + ".$fomodata['award_usdt']."USDT";
            $userext = $fomo->get_user_fomo_find($userdata['id']);
            $userfomo = $fomo->get_user_fomo();
            $this->getView()->assign([
                "user" =>$this->username,
                "userdata"=>$userdata,
                "fomodata"=>$fomodata,
                "userfomo"=>$userfomo,
                "userext"=>$userext
            ]);
        }else{
            $this->getView()->assign([
                "user" =>$this->username,
                "userdata"=>$userdata,
                "fomodata"=>[],
                "userfomo"=>[],
                "userext"=>[]
            ]);
        }

//        $result = $this->db->field("*")
//            ->table("bw_auktion")
//            ->where("status = 0")
//            ->find();
//        $user = $this->db->field("*")
//            ->table("bw_user")
//            ->where("username = '{$this->username}'")
//            ->find();
//        $log = $this->db->field("*")
//            ->table("bw_auktion_user")
//            ->where("u_id = {$user['id']} AND f_id = {$result['f_id']}")
//            ->find();
//        //本次排名记录
//        $fomo = $this->db->field("*")
//            ->table("bw_auktion_user")
//            ->where("f_id = {$result['f_id']}")
//            ->select();
//        $fomolog = $log ? $log : [];
//        $this->getView()->assign(["result"=>$result,"user"=>$user,"fomo"=>$fomo]);
    }

    public function fomoAction(){
        Dispatcher::getInstance()->autoRender(false);
        $user = $this->username;
        $price = post('p');
        $f_id = post('f');
        $time = time();
        $userinfo = $this->db->field("*")
            ->table("bw_user")
            ->where("username = '{$user}'")
            ->find();
        $result = $this->db->field("*")
            ->table("bw_auktion_user")
            ->where("f_id = {$f_id} AND u_id = {$userinfo['id']}")
            ->find();
        $fomoresult = $this->db->field("*")
            ->table("bw_auktion")
            ->where("f_id = {$f_id}")
            ->find();
        $end_time =  $fomoresult['end_time'];
        $create_time =  $end_time - $time;
        $this->db->beginTransaction();
        if($create_time > 600){
            $sql = "UPDATE bw_auktion SET fomo_price = {$price} WHERE f_id = {$f_id}";
        }else{
            $sql = "UPDATE bw_auktion SET fomo_price = {$price},end_time = end_time + 600 WHERE f_id = {$f_id}";
        }
        $bool1 = $this->db->action($sql);
        $data['price'] = $price;
        $data['create_time'] = $time;
        if(!empty($result['id'])){
            $bool2 = $this->db->action($this->db->updateSql('auktion_user',$data,"f_id = {$f_id} AND u_id = {$userinfo['id']}"));
        }else{
            $data['f_id'] = $f_id;
            $data['u_id'] = $userinfo['id'];
            $data['address'] = $userinfo['lbth_address'];
            $bool2 = $this->db->action($this->db->insertSql('auktion_user',$data));
        }
        $usersql = "UPDATE bw_user SET lbth_available_balance = lbth_available_balance - {$price},lbth_freeze_balance = lbth_freeze_balance + {$price} WHERE id = {$userinfo['id']}";
        $bool3 = $this->db->action($usersql);
        if($bool1 && $bool2 && $bool3){
            $this->db->commit();
            echo json_encode(["code"=>1,"msg"=>"出价成功"]);
        }else{
            $this->db->rollback();
            echo json_encode(["code"=>2,"msg"=>"竞品失败,系统繁忙"]);
        }
    }

    public function emptyAction()
    {
        // TODO: Implement __call() method.
    }

}