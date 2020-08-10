<?php
class UserController extends Base_Base{
    public function init(){
        parent::init();
    }
    //我的
    public function myAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }else{
            //汇率
            $time = time() * 1000;
            $url = "https://webapi.huilv.cc/api/exchange?num=1&chiyouhuobi=USD&duihuanhuobi=CNY&type=0&callback=jisuanjieguo&_=".$time;
            $str = file_get_contents($url);
            $newstr = substr($str,13,-2);
            $arrjson = json_decode($newstr,true);
//            $ch = curl_init();
//            curl_setopt($ch, CURLOPT_HEADER, false);
//            curl_setopt($ch, CURLOPT_URL, $url);
//            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
//            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
//            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
//            $resurl = curl_exec($ch);
//            curl_close($ch);
            $id = $this->reqdata['u_id'];
            $user = $this->db->field("*")
                ->table("bw_user")
                ->where("id = {$id}")
                ->find();
            if($user){
                $user['exchange'] = $arrjson['dangqianhuilv'];
                $this->ajax_return(0,$user);
            }else{
                $this->ajax_return(500);
            }
        }
    }
    //资产
    public function assetsAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }else{
            $id = $this->reqdata['u_id'];
            $user = $this->db->field("*")
                ->table("bw_user")
                ->where("id = {$id}")
                ->find();
            //币币
            $data['bibi']['lbth_address'] = $user['lbth_address'];
            $data['bibi']['lbth_num'] = $user['lbth_num'];
            $data['bibi']['lbth_available_balance'] = $user['lbth_available_balance'];
            $data['bibi']['lbth_freeze_balance'] = $user['lbth_freeze_balance'];
            $data['bibi']['usdt_address'] = $user['usdt_address'];
            $data['bibi']['usdt_num'] = $user['usdt_num'];
            $data['bibi']['usdt_available_balance'] = $user['usdt_available_balance'];
            $data['bibi']['usdt_freeze_balance'] = $user['usdt_freeze_balance'];
            $data['bibi']['eth_address'] = $user['eth_address'];
            $data['bibi']['eth_num'] = $user['eth_num'];
            $data['bibi']['eth_available_balance'] = $user['eth_available_balance'];
            $data['bibi']['eth_freeze_balance'] = $user['eth_freeze_balance'];
            $data['bibi']['btc_address'] = $user['btc_address'];
            $data['bibi']['btc_num'] = $user['btc_num'];
            $data['bibi']['btc_available_balance'] = $user['btc_available_balance'];
            $data['bibi']['btc_freeze_balance'] = $user['btc_freeze_balance'];
            //法币
            $data['fiatcurrency']['reb_cash'] = $user['reb_cash'];
            $data['fiatcurrency']['my_cash'] = $user['my_cash'];
            //合约
            $data['heyue'] = $this->db->field("usdt,btc,eth,lbth")
                ->table("bw_heyue")
                ->where("u_id = {$id}")
                ->find();
            //杆杆
            $data['ganggan'] = $this->db->field("balance as usdt,BTC_balance as btc,ETH_balance as eth,LBTH_balance as lbth")
                ->table("bw_account")
                ->where("uid = {$id}")
                ->find();
            $this->ajax_return(0,$data);
        }
    }
    //修改头像
    public function avatarAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        if(!isset($this->reqdata['avatar'])){
            $this->ajax_return(201);
        }
        $bool = $this->db->action($this->db->updateSql("user",["avatar"=>$this->reqdata['avatar']],"id = {$this->reqdata['u_id']}"));
        if($bool){
            $this->ajax_return(0);
        }else{
            $this->ajax_return(500);
        }

    }
    //划转
    public function transferAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        if(!isset($this->reqdata['xtype'])){
            $this->ajax_return(301);
        }
        if(!isset($this->reqdata['cointype'])){
            $this->ajax_return(300);
        }
        if(!isset($this->reqdata['num'])){
            $this->ajax_return(302);
        }
        if(!isset($this->reqdata['start'])){
            $this->ajax_return(303);
        }
        if(!isset($this->reqdata['end'])){
            $this->ajax_return(304);
        }

        $u_id = $this->reqdata['u_id'];
        $xtype = $this->reqdata['xtype'];
        $coin = strtolower($this->reqdata['cointype']);
        $num = $this->reqdata['num'];
        $start = $this->reqdata['start'];
        $end = $this->reqdata['end'];

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
                $data=$this->db->field("*")->table("bw_interest")->where("status = 0 and uid = ".$u_id)->find();
                if($data){
                    $this->ajax_return(312);
                }
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
        if ($bool1 && $bool2 && $bool3) {
            $this->db->commit();
            $this->ajax_return(0);
        } else {
            $this->db->rollback();
            $this->ajax_return(502);
        }

    }
    //身份认证
    public function authenticatAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        if(!isset($this->reqdata['authenticate'])){
            $this->ajax_return(109);
        }
        if(!isset($this->reqdata['country'])){
            $this->ajax_return(110);
        }
        if(!isset($this->reqdata['name'])){
            $this->ajax_return(111);
        }
        if(!isset($this->reqdata['ctype'])){
            $this->ajax_return(112);
        }
        if(!isset($this->reqdata['cid'])){
            $this->ajax_return(113);
        }
        if(!isset($this->reqdata['front_photo'])){
            $this->ajax_return(114);
        }
        if(!isset($this->reqdata['reverse_photo'])){
            $this->ajax_return(115);
        }
        if(!isset($this->reqdata['handheld_photo'])){
            $this->ajax_return(116);
        }
        $id = $this->reqdata['u_id'];
        $authenticate = $this->reqdata['authenticate'];
        $is_authentication = $this->db->field("*")
            ->table("bw_user_authentication")
            ->where("u_id = {$id}")
            ->find();
        if($is_authentication){
            $bool1 = $this->db->action($this->db->updateSql("user", ["authenticate" => $authenticate], "id = {$id}"));
            if ($authenticate == 1) {
                $data['country'] = $this->reqdata['country'];
                $data['name'] = $this->reqdata['name'];
                $data['ctype'] = $this->reqdata['ctype'];
                $data['cid'] = $this->reqdata['cid'];
                $bool2 = $this->db->action($this->db->updateSql("user_authentication", $data, "u_id = {$id}"));
            } else {
                $data['front_photo'] = $this->reqdata['front_photo'];
                $data['reverse_photo'] = $this->reqdata['reverse_photo'];
                $data['handheld_photo'] = $this->reqdata['handheld_photo'];
                $bool2 = $this->db->action($this->db->updateSql("user_authentication", $data, "u_id = {$id}"));
            }
            $this->ajax_return(0);
        }else{
            $this->db->beginTransaction();
            $bool1 = $this->db->action($this->db->updateSql("user", ["authenticate" => $authenticate], "id = {$id}"));
            if ($authenticate == 1) {
                $data['u_id'] = $id;
                $data['country'] = $this->reqdata['country'];
                $data['name'] = $this->reqdata['name'];
                $data['ctype'] = $this->reqdata['ctype'];
                $data['cid'] = $this->reqdata['cid'];
                $bool2 = $this->db->action($this->db->insertSql("user_authentication", $data));
            } else {
                $data['front_photo'] = $this->reqdata['front_photo'];
                $data['reverse_photo'] = $this->reqdata['reverse_photo'];
                $data['handheld_photo'] = $this->reqdata['handheld_photo'];
                $bool2 = $this->db->action($this->db->updateSql("user_authentication", $data, "u_id = {$id}"));
            }
            if ($bool1 && $bool2) {
                $this->db->commit();
                $this->ajax_return(0);
            } else {
                $this->db->rollback();
                $this->ajax_return(500);
            }
        }

    }
    //设置/修改交易密码
    public function paypasswordAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        if(!isset($this->reqdata['paypass'])){
            $this->ajax_return(202);
        }
        if(!isset($this->reqdata['locapass'])){
            $this->ajax_return(203);
        }
        $id = $this->reqdata['u_id'];
        $userinfo = $this->db->field("*")
            ->table("bw_user")
            ->where("id = {$id}")
            ->find();
        include APP_PATH . "/application/core/Aes.php";
        $aes = new \app\core\Aes();
        if (empty($userinfo['transaction_password'])) {
            $paypass = $this->reqdata['paypass'];
            $encode_password = $aes->aes_encode($paypass);
            $bool = $this->db->action($this->db->updateSql("user", ["transaction_password" => $encode_password], "id = {$id}"));
            if($bool){
                $this->ajax_return(0);
            }else{
                $this->ajax_return(500);
            }
        } else {
            $locapass = $this->reqdata['locapass'];
            $sqlpass = $aes->aes_decode($userinfo['transaction_password']);
            if ($sqlpass == $locapass) {
                $paypass = $this->reqdata['paypass'];
                $encode_password = $aes->aes_encode($paypass);
                $bool = $this->db->action($this->db->updateSql("user", ["transaction_password" => $encode_password], "id = {$id}"));
                if($bool){
                    $this->ajax_return(0);
                }else{
                    $this->ajax_return(500);
                }
            } else {
                $this->ajax_return(204);
            }
        }

    }
    //用户反馈
    public function feedbackAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        if(!isset($this->reqdata['leve'])){
            $this->ajax_return(205);
        }
        if(!isset($this->reqdata['content'])){
            $this->ajax_return(206);
        }
        $data['u_id'] = $this->reqdata['u_id'];
        $data['leve'] = $this->reqdata['leve'];
        $data['content'] = $this->reqdata['content'];
        $data['create_time'] = time();
        $bool = $this->db->action($this->db->insertSql("user_feedback",$data));
        if($bool){
            $this->ajax_return(0);
        }else{
            $this->ajax_return(500);
        }
    }
    //新增提现地址
    public function addwithdrawAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        if(!isset($this->reqdata['coin'])){
            $this->ajax_return(300);
        }
        if(!isset($this->reqdata['address'])){
            $this->ajax_return(305);
        }
        $data['u_id'] = $this->reqdata['u_id'];
        $data['currency'] = $this->reqdata['coin'];
        $data['address'] = $this->reqdata['address'];
        $data['remarks'] = $this->reqdata['remarks'];
        $bool = $this->db->action($this->db->insertSql("withdraw_address",$data));
        if($bool){
            $this->ajax_return(0);
        }else{
            $this->ajax_return(500);
        }
    }
    //提现地址列表
    public function withdrawlistAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        $id = $this->reqdata['u_id'];
        $address = $this->db->field("*")
            ->table("bw_withdraw_address")
            ->where("u_id = {$id}")
            ->order("id desc")
            ->select();
        if($address){
            $this->ajax_return(0,$address);
        }else{
            $this->ajax_return(0,[]);
        }
    }
    //币种列表
    public function coinAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        $coin = $this->db->field("*")
            ->table("bw_currency")
            ->select();
        if($coin){
            $this->ajax_return(0,$coin);
        }else{
            $this->ajax_return(0,[]);
        }
    }
    //账单
    public function billAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        if(!isset($this->reqdata['page'])){
            $this->ajax_return(3);
        }
        if(!isset($this->reqdata['showpage'])){
            $this->ajax_return(3);
        }
        if(!isset($this->reqdata['type'])){
            $this->ajax_return(117);
        }
        $u_id = $this->reqdata['u_id'];
        $type = $this->reqdata['type'];
        $showpage = $this->reqdata['showpage'];
        $page = $this->reqdata['page'];
        $start =  ($page-1)*$showpage;
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
        $result = $this->db->field("*")
            ->table("bw_user_num_log")
            ->where($where." AND user_id = {$u_id}")
            ->limit($start,$showpage)
            ->select();
        if($result){
            $this->ajax_return(0,$result);
        } else {
            $this->ajax_return(0,[]);
        }
    }
    //提现地址删除
    public function delwithdrawAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        if(!isset($this->reqdata['address_id'])){
            $this->ajax_return(313);
        }
        $u_id = $this->reqdata['u_id'];
        $address_id = $this->reqdata['address_id'];
        $where = "u_id = {$u_id} AND id = {$address_id}";
        $bool = $this->db->action($this->db->deleteSql("withdraw_address",$where));
        if($bool){
            $this->ajax_return(0);
        }else{
            $this->ajax_return(500);
        }
    }
    //提现申请
    public function withdrawAction()
    {
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        if(!isset($this->reqdata['number'])){
            $this->ajax_return(302);
        }
        if(!isset($this->reqdata['paypass'])){
            $this->ajax_return(202);
        }
        if(!isset($this->reqdata['symbol'])){
            $this->ajax_return(300);
        }
        if(!isset($this->reqdata['address'])){
            $this->ajax_return(305);
        }
        $userinfo = $this->db->field("*")
            ->table("bw_user")
            ->where("id = {$this->reqdata['u_id']}")
            ->find();
        include APP_PATH . "/application/core/Aes.php";
        $aes = new \app\core\Aes();
        $pass = $this->reqdata['paypass'];
        $num = $this->reqdata['number'] - 0.003;
        $sqlpass = $aes->aes_decode($userinfo['transaction_password']);
        if ($userinfo['transaction_password'] == null) {
            $this->ajax_return(207);
        } else if ($sqlpass == $pass) {
            $this->db->beginTransaction();
            $tx['u_id'] = $userinfo['id'];
            $tx['currency'] = $this->reqdata['symbol'];
            $tx['token_num'] = $this->reqdata['number'];
            $tx['create_time'] = time();
            $tx['order_no'] = "tx" . build_order_no();
            $tx['status'] = 0;
            $tx['build_status'] = 1;
            $tx['address'] = $this->reqdata['address'];
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
                    $this->ajax_return(0);
                } else {
                    $this->db->rollback();
                    $this->ajax_return(501);
                }
            } else if ($tx['status'] == 0 && $tx['build_status'] == 1 && $tx['auto_address'] == 1) {
                $sql = "UPDATE bw_user SET {$bit_available_balance} = {$bit_available_balance} - {$tx['token_num']},{$bit_freeze_balance} = {$bit_freeze_balance} + {$tx['token_num']} WHERE id = {$userinfo['id']}";
                $bool3 = $this->db->action($sql);
                if ($bool1 && $bool2 && $bool3) {
                    $this->db->commit();
                    $this->ajax_return(0);
                } else {
                    $this->db->rollback();
                    $this->ajax_return(501);
                }
            } else {
                $this->db->rollback();
                $this->ajax_return(501);
            }
        } else {
            $this->ajax_return(207);
        }
    }
    //币币充值钱包地址查询
    public function qrcoderechargeAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        $u_id = $this->reqdata['u_id'];
        $user = $this->db->field("usdt_address")
            ->table("bw_user")
            ->where("id = {$u_id}")
            ->find();
        $eth_addr = $user['usdt_address'];
        $data['wallet_address'] = $eth_addr;
        $data['qrcod'] = "/public/eth_addr/".$eth_addr.".png";
        if($user){
            $this->ajax_return(0,$data);
        }else{
            $this->ajax_return(0,(object)[]);
        }
    }

    public function build_merc_code(){
        $str = uniqid();
        return "B".strtoupper($str)."W";
    }
}