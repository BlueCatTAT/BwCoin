<?php
class LoginController extends Base_Base{
    public function init(){
        parent::init();
    }
    //调取手机验证码
    public function telcodeAction(){
        if(!isset($this->reqdata['tel'])){
            $this->ajax_return(101);
        }
        $tel = $this->reqdata['tel'];
        if(!preg_match('/1\d{10}/',$tel,$arr)){
            $this->ajax_return(102);
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
                $this->ajax_return(0);
            }else{
                $this->ajax_return(500);
            }
        }
    }
    //短信验证码登录+验证
    public function loginsmsAction(){
        $phone = $this->reqdata['tel'];
        $code = $this->reqdata['lockcode'];
        $locktime = time();
        $telsvcode = $this->db->field("*")
            ->table("bw_short_message")
            ->where(" phone = '{$phone}' and code = '{$code}' ")
            ->find();
        if($telsvcode){
            $datatime = $telsvcode['create_time'];
            if( ($locktime - $datatime) < 600){
                $datacode = $telsvcode['code'];
                if($datacode == $code){
                    $islogin = $this->db->field("id,tel")
                        ->table("bw_user")
                        ->where("tel = {$phone}")
                        ->find();
                    if(empty($islogin['u_tel'])){//注册
                        $this->register($phone);
                    }else{//登录
                        $x['login_time'] = time();
                        $x['is_login'] = 1;
                        $this->db->action($this->db->updateSql("user",$x,"tel = {$phone}"));
                        $this->ajax_return(0,["id"=>$islogin['id']]);
                    }
                }else{
                    $this->ajax_return(103);
                }
            }else{
                $this->ajax_return(104);
            }
        }else{
            $this->ajax_return(103);
        }
    }
    //短信验证码
    public function ajaxsmsAction(){
        $phone = $this->reqdata['tel'];
        $code = $this->reqdata['lockcode'];
        $locktime = time();
        $telsvcode = $this->db->field("*")
            ->table("bw_short_message")
            ->where(" phone = '{$phone}' and code = '{$code}' ")
            ->find();
        if($telsvcode){
            $datatime = $telsvcode['create_time'];
            if( ($locktime - $datatime) < 120){
                $datacode = $telsvcode['code'];
                if($datacode == $code){
                    $this->sessions->code = 1;
                    $this->ajax_return(0);
                }else{
                    $this->ajax_return(103);
                }
            }else{
                $this->ajax_return(104);
            }
        }else{
            $this->ajax_return(103);
        }
    }
    //邀请码注册
    public function anvitationcodeAction(){
        $phone = $this->reqdata['tel'];
        $password = $this->reqdata['password'];
        $code = $this->reqdata['code'];
        $result_tel = $this->db->field("id")
            ->table("bw_user")
            ->where("tel = $phone")
            ->find();
        if(!empty($result_tel["id"])){
            $this->ajax_return(106);
        }else{
            $result = $this->db->field("id,code")
                ->table("bw_user")
                ->where("code = '{$code}'")
                ->find();
            $pass = $this->hashkey($password,self::APP_KEY);
            if(!empty($result['id'])){
                $group_id = $result['group_id'].",".$result['id'];
                $this->register($phone,$pass,$result['id'],$group_id);
            }else{
                $this->register($phone,$pass,0,0);
            }
        }
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
        $heyue['u_id'] = $user_id;
        $bool2 = $this->db->action($this->db->updateSql("user",$user,"id = {$user_id}"));
        $bool4 = $this->db->action($this->db->insertSql("account",$list));
        $bool5 = $this->db->action($this->db->insertSql("heyue",$heyue));
        $bool3 = $this->db->action($this->db->updateSql("token",$token,"token_id = {$token_result['token_id']}"));
        if ($bool1 && $bool2 && $bool3 && $bool4 && $bool5) {
            $this->db->commit();
            $this->ajax_return(0);
        } else {
            $this->db->rollback();
            $this->ajax_return(500);
        }
    }
    //7日免登陆接口
    public function loginfreeAction(){
        if(!isset($this->reqdata['tel'])){
            $this->ajax_return(101);
        }
        $tel = $this->reqdata['tel'];
        $user = $this->db->field("*")
            ->table("bw_user")
            ->where("tel = {$tel}")
            ->find();
        $time = time();
        if( ($user['is_login'] == 1) && ($time - $user['login_time'] < 604800) ){
            $this->ajax_return(0, ["u_id"=>$user['id'], "usdt_available_balance"=>$user['usdt_available_balance'], "transaction_password"=>$user['transaction_password']]);
        }else{
            $this->ajax_return(500);
        }
    }
    //账号密码登录
    public function loginAction(){
        if(!isset($this->reqdata['tel'])){
            $this->ajax_return(101);
        }
        if(!isset($this->reqdata['pass'])){
            $this->ajax_return(108);
        }
        $user = $this->reqdata['tel'];
        $pass = $this->hashkey($this->reqdata['pass'],self::APP_KEY);
        $islogin = $this->db->field("*")
            ->table("bw_user")
            ->where("username = '{$user}' and userpass = '{$pass}'")
            ->find();
        if($islogin){
            $x['login_time'] = time();
            $x['is_login'] = 1;
            $this->db->action($this->db->updateSql("user",$x,"tel = {$user}"));
            $this->ajax_return(0,["u_id"=>$islogin['id'],"usdt_available_balance"=>$islogin['usdt_available_balance'],"transaction_password"=>$islogin['transaction_password']]);
        }else{
            $this->ajax_return(107);
        }
    }
    //找回密码
    public function forgetpasswordAction(){
        if(!isset($this->reqdata['tel'])){
            $this->ajax_return(101);
        }
        if(!isset($this->reqdata['lockcode'])){
            $this->ajax_return(103);
        }
        if(!isset($this->reqdata['pass'])){
            $this->ajax_return(108);
        }
        $tel = $this->reqdata['tel'];
        $pass = $this->reqdata['pass'];
        $dynamic_code = $this->reqdata['lockcode'];
        $resultdb = $this->db->field("*")->table("bw_user")->where("tel = {$this->reqdata['tel']}")->find();
        if(empty($resultdb)){
            $this->ajax_return(102);
        }else{
            $phonecode = $this->db->field("*")
                ->table("bw_short_message")
                ->where("phone = {$tel} and code = '{$dynamic_code}'")
                ->find();
            if(!empty($phonecode)){
                $data['userpass'] = $this->hashkey($pass,self::APP_KEY);
                $bool = $this->db->action($this->db->updateSql("user",$data,"tel = {$tel}"));
                if($bool){
                    $this->ajax_return(0);
                }else{
                    $this->ajax_return(500);
                }
            }else{
                $this->ajax_return(103);
            }
        }
    }

    public function build_merc_code(){
        $str = uniqid();
        return "B".strtoupper($str)."W";
    }
}