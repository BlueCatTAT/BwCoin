<?php
class ActivityController extends Base_Base{
    public function init(){
        parent::init();
    }
    //新币预售活动列表
    public function newcoinAction(){
        if(!isset($this->reqdata['activity'])){
            $this->ajax_return(3);
        }
        if($this->reqdata['activity'] != "newcoin"){
            $this->ajax_return(3);
        }
        $result = $this->db->field("*")
            ->table("bw_xbys")
            ->where("status = 1")
            ->select();
        if($result){
            $arr = [];
            foreach($result as $k=>$v){
                $arr[$k]['activity_id'] = $v['id'];
                $arr[$k]['pic'] = $v['pic'];
                $arr[$k]['currency_id'] = get_currency_name($v['currency_id']);
                $arr[$k]['x_currency_id'] = get_currency_name($v['x_currency_id']);
                $arr[$k]['title'] = $v['title'];
                $arr[$k]['start_time'] = $v['start_time'];
                $arr[$k]['end_time'] = $v['end_time'];
                $arr[$k]['deal'] = $v['deal'];
                $arr[$k]['total_num'] = $v['total_num'];
            }
            $this->ajax_return(0,$arr);
        }else{
            $this->ajax_return(0,[]);
        }
    }
    //新币预售活动详情
    public function newcoindetailsAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        if(!isset($this->reqdata['activity'])){
            $this->ajax_return(3);
        }
        if($this->reqdata['activity'] != "newcoin"){
            $this->ajax_return(3);
        }
        if(!isset($this->reqdata['activity_id'])){
            $this->ajax_return(400);
        }
        $id = $this->reqdata['activity_id'];
        $u_id = $this->reqdata['u_id'];
        $result = $this->db->field("*")
            ->table("bw_xbys")
            ->where("id = {$id}")
            ->find();
        $user = $this->db->field("*")
            ->table("bw_user")
            ->where("id = {$u_id}")
            ->find();

        if($result){
            $count = $this->db->zscount("newscoin","*",'total',"xbys_id = {$result['id']}");
            $coin_type = strtolower(get_currency_name($result['x_currency_id']));
            $available_balance = $coin_type."_available_balance";
            $balance = $user[$available_balance];
            $result['activity_id'] = $result['id'];
            $result['currency_id'] = get_currency_name($result['currency_id']);
            $result['x_currency_id'] = get_currency_name($result['x_currency_id']);
            $result['in_coin'] = get_currency_name($result['in_coin']);
            unset($result['id']);
            $result['supporters'] = $count;
            $result['balance'] = $balance;
            $this->ajax_return(0,$result);
        }else{
            $this->ajax_return(0,(object)[]);
        }
    }
    //新币预售用户记录
    public function newcoinlogAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        if(!isset($this->reqdata['activity'])){
            $this->ajax_return(3);
        }
        if($this->reqdata['activity'] != "newcoin"){
            $this->ajax_return(3);
        }
        $user_log = $this->db->field("*")
            ->table("bw_newscoin")
            ->where("user_id = {$this->reqdata['u_id']}")
            ->order("id desc")
            ->select();
        if($user_log){
            foreach($user_log as $k=>$v){
                $user_log[$k]['activity_id'] = $v['xbys_id'];
                unset($user_log[$k]['xbys_id']);
            }
            $this->ajax_return(0,$user_log);
        }else{
            $this->ajax_return(0,[]);
        }
    }
    //新币预售用户参与
    public function addnewcoinAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        if(!isset($this->reqdata['activity'])){
            $this->ajax_return(3);
        }
        if(!isset($this->reqdata['num'])){
            $this->ajax_return(302);
        }
        if(!isset($this->reqdata['paypass'])){
            $this->ajax_return(202);
        }
        if($this->reqdata['activity'] != "newcoin"){
            $this->ajax_return(3);
        }
        if(!isset($this->reqdata['activity_id'])){
            $this->ajax_return(400);
        }
        $activity_id = $this->reqdata['activity_id']; //活动id
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
            ->where("id = {$this->reqdata['u_id']}")
            ->find();
        //获取用户活动
        $user_id = $user['id']; //用户ID
        $number = $this->reqdata['num'];
        $paypass = $this->reqdata['paypass'];
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
                    $this->ajax_return(0);
                } else {
                    $this->db->rollback();
                    $this->ajax_return(501);
                }
            }else{
                $this->ajax_return(502);
            }
        }else{
            $this->ajax_return(207);
        }
    }
    //投票上币活动列表
    public function tuopiaoAction(){
        if(!isset($this->reqdata['activity'])){
            $this->ajax_return(3);
        }
        if($this->reqdata['activity'] != "vote"){
            $this->ajax_return(3);
        }
        $result = $this->db->field("*")
            ->table("bw_activity")
            ->select();
        if($result){
            foreach($result as $k=>$v){
                $result[$k]['activity_id'] = $v['id'];
                $result[$k]['currency_id'] = get_currency_name($v['currency_id']);
                $result[$k]['x_currency_id'] = get_currency_name($v['x_currency_id']);
                unset($result[$k]['id']);
                unset($result[$k]['rule']);
            }
            $this->ajax_return(0,$result);
        }else{
            $this->ajax_return(0,[]);
        }
    }
    public function voteAction(){
        if(!isset($this->reqdata['activity'])){
            $this->ajax_return(3);
        }
        if($this->reqdata['activity'] != "vote"){
            $this->ajax_return(3);
        }
        $result = $this->db->field("*")
            ->table("bw_activity")
            ->select();
        if($result){
            foreach($result as $k=>$v){
                $result[$k]['activity_id'] = $v['id'];
                $result[$k]['currency_id'] = get_currency_name($v['currency_id']);
                $result[$k]['x_currency_id'] = get_currency_name($v['x_currency_id']);
                unset($result[$k]['id']);
                unset($result[$k]['rule']);
            }
            $this->ajax_return(0,$result);
        }else{
            $this->ajax_return(0,[]);
        }
    }
    //投票上币用户记录
    public function votelogAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        if(!isset($this->reqdata['activity'])){
            $this->ajax_return(3);
        }
        if($this->reqdata['activity'] != "vote"){
            $this->ajax_return(3);
        }
        $user_log = $this->db->field("*")
            ->table("bw_vote")
            ->where("user_id = {$this->reqdata['u_id']}")
            ->order("id desc")
            ->select();
        if($user_log){
            $this->ajax_return(0,$user_log);
        }else{
            $this->ajax_return(0,[]);
        }
    }
    //投票上币用户参与
    public function addvoteAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        if(!isset($this->reqdata['activity'])){
            $this->ajax_return(3);
        }
        if(!isset($this->reqdata['number'])){
            $this->ajax_return(302);
        }
        if(!isset($this->reqdata['paypass'])){
            $this->ajax_return(202);
        }
        if($this->reqdata['activity'] != "vote"){
            $this->ajax_return(3);
        }
        if(!isset($this->reqdata['activity_id'])){
            $this->ajax_return(400);
        }
        if(!isset($this->reqdata['is_status'])){
            $this->ajax_return(306);
        }
        $activity_id = $this->reqdata['activity_id']; //活动id
        //获取活动表数据
        $result = $this->db->field("*")
            ->table("bw_activity")
            ->where("id = {$activity_id}")
            ->find();
        $result['currency_id'] = get_currency_name($result['currency_id']);
        $result['x_currency_id'] = get_currency_name($result['x_currency_id']);
        //检查用户数据
        $user = $this->db->field("*")
            ->table("bw_user ")
            ->where("id = {$this->reqdata['u_id']}")
            ->find();
        //获取用户活动
        $user_id = $user['id']; //用户ID
        $status = $this->reqdata['is_status'];
        $number = $this->reqdata['number'];
        $paypass = $this->reqdata['paypass'];
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
                    $this->ajax_return(0);
                } else {
                    $this->db->rollback();
                    $this->ajax_return(501);
                }
            }else{
                $this->ajax_return(502);
            }
        }else{
            $this->ajax_return(207);
        }

    }
    //pos矿池活动列表
    public function minepoolAction(){
        if(!isset($this->reqdata['activity'])){
            $this->ajax_return(3);
        }
        if($this->reqdata['activity'] != "pos"){
            $this->ajax_return(3);
        }
        $result = $this->db->field("c.*,t.type,t.icon")
            ->table("bw_cbsx as c")
            ->join("bw_currency as t","t.id = c.currency_id")
            ->where("c.status = 1")
            ->select();
        if($result){
            foreach($result as $k=>$v){
                $result[$k]['activity_id'] = $v['id'];
                $result[$k]['currency_id'] = get_currency_name($v['currency_id']);
                $result[$k]['x_currency_id'] = get_currency_name($v['x_currency_id']);
                unset($result[$k]['id']);
            }
            $this->ajax_return(0,$result);
        }else{
            $this->ajax_return(0,[]);
        }
    }
    //Pos矿池用户记录
    public function minepoollogAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        if(!isset($this->reqdata['activity'])){
            $this->ajax_return(3);
        }
        if($this->reqdata['activity'] != "pos"){
            $this->ajax_return(3);
        }
        $u_id = $this->reqdata['u_id'];
        $user_log = $this->db->field("*")
            ->table("bw_currencyinterest")
            ->where("user_id = {$u_id}")
            ->order("id desc")
            ->select();
        if($user_log){
            foreach($user_log as $k=>$v){
                $user_log[$k]['activity_id'] = $v['cbsx_id'];
                unset($user_log[$k]['cbsx_id']);
            }
            $this->ajax_return(0,$user_log);
        }else{
            $this->ajax_return(0,[]);
        }
    }
    //Pos矿池用户参与
    public function addminepoolAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        if(!isset($this->reqdata['activity'])){
            $this->ajax_return(3);
        }
        if(!isset($this->reqdata['number'])){
            $this->ajax_return(302);
        }
        if(!isset($this->reqdata['paypass'])){
            $this->ajax_return(202);
        }
        if($this->reqdata['activity'] != "pos"){
            $this->ajax_return(3);
        }
        if(!isset($this->reqdata['activity_id'])){
            $this->ajax_return(400);
        }
        $activity_id = $this->reqdata['activity_id']; //活动id
        //活动数据
        $result = $this->db->field("c.*,t.type,t.icon")
            ->table("bw_cbsx as c")
            ->join("bw_currency as t","t.id = c.currency_id")
            ->where("c.status = 1 AND c.id = {$activity_id}")
            ->find();
        $result['currency_id'] = get_currency_name($result['currency_id']);
        $result['x_currency_id'] = get_currency_name($result['x_currency_id']);
        $num = $this->reqdata['number'];  //金额
        $paypass = $this->reqdata['paypass']; //支付密码
        //检查用户数据
        $user = $this->db->field("*")
            ->table("bw_user ")
            ->where("id = {$this->reqdata['u_id']}")
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
                $data['cbsx_id'] = $activity_id;
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
                $sql2 = "UPDATE bw_cbsx SET start_mun = start_mun + {$num} WHERE id = {$activity_id}";
                $bool3 = $this->db->action($sql2);
                if ($bool1 && $bool2 && $bool3) {
                    $this->db->commit();
                    $this->ajax_return(0);
                } else {
                    $this->db->rollback();
                    $this->ajax_return(501);
                }
            }else{
                $this->ajax_return(502);
            }
        }else{
            $this->ajax_return(207);
        }
    }
    //代币拍卖活动
    public function fomoAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        if(!isset($this->reqdata['activity'])){
            $this->ajax_return(3);
        }
        if($this->reqdata['activity'] != "fomo"){
            $this->ajax_return(3);
        }
        $u_id = $this->reqdata['u_id'];
        $fomo = new fomoModel();
        $userdata = $fomo->get_user_info_id($u_id);
        $fomodata = $fomo->fomo;
        $data = [];
        if($fomodata){
            $fomodata['award'] = $fomodata['award_btc']."BTC + ".$fomodata['award_usdt']."USDT";
            $userext = $fomo->get_user_fomo_find($userdata['id']);
            $userfomo = $fomo->get_user_fomo();
            $data['userdata'] = $userdata;
            $data['fomodata'] = $fomodata;
            $data['userfomo'] = $userfomo;
            $data['userext'] = $userext;
        }else{
            $data['userdata'] = $userdata;
            $data['fomodata'] = [];
            $data['userfomo'] = [];
            $data['userext'] = [];
        }
        $this->ajax_return(0,$data);
    }
    //代币拍卖参与
    public function addfomoAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        if(!isset($this->reqdata['activity'])){
            $this->ajax_return(3);
        }
        if($this->reqdata['activity'] != "fomo"){
            $this->ajax_return(3);
        }
        if(!isset($this->reqdata['f_id'])){
            $this->ajax_return(400);
        }
        if(!isset($this->reqdata['number'])){
            $this->ajax_return(302);
        }
        if(!isset($this->reqdata['paypass'])){
            $this->ajax_return(202);
        }
        $price = $this->reqdata['number'];
        $f_id = $this->reqdata['f_id'];
        $paypass = $this->reqdata['paypass']; //支付密码
        $time = time();
        $userinfo = $this->db->field("*")
            ->table("bw_user")
            ->where("id = {$this->reqdata['u_id']}")
            ->find();
        include APP_PATH."/application/core/Aes.php";
        $aes = new \app\core\Aes();
        $pay = $aes->aes_encode($paypass);
        if($pay == $userinfo['transaction_password']){
            if($userinfo['lbth_available_balance'] - $price >= 0){
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
                    $this->ajax_return(0);
                }else{
                    $this->db->rollback();
                    $this->ajax_return(501);
                }
            }else{
                $this->ajax_return(502);
            }
        }else{
            $this->ajax_return(207);
        }
    }
}