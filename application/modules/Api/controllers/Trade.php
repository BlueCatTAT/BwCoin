<?php
class TradeController extends Base_Base{
    public function init(){
        parent::init();
    }
    //杠杆页面
    public function pryAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        if(!isset($this->reqdata['market'])){
            $this->ajax_return(3);
        }
        $con=strtolower($this->reqdata['market']);
        $uid=$this->reqdata['u_id'];
//        $uid=7;
//        $con="btc_usdt";
        if(!empty($con)){
            $sz=explode("_",$con);
            if($sz[0]=="usdt"){
                $sz[0]="btc";
            }
        }
        $user = $this->db->field("*")
            ->table("bw_user ")
            ->where("id = $uid")
            ->find();
        $amounum=0;
        if(!empty($user["id"])){
            $arrdata=$this->db->field("*")->table("bw_account")->where("uid = ".$user['id'])->find();
            $data=$this->db->field("*")->table("bw_interest")->where("status = 0 and uid = ".$user['id'])->find();
            $cons=strtoupper($sz[0]);
            $lvlist=$this->db->field("*")->table("bw_pry_order")->where("cls = '$cons' and uid = ".$user['id'])->order("id desc")->select();
            if(!empty($data["amount"])){
                //php 两个时间戳相隔的时间
                $timediff = time() - $data["ctime"];
                $days = intval($timediff / 86400)+1;
                $lv=bc("*",$data["amount"],$data["rate"]);
                $result["interest"]=bc("*",$days,$lv,"5");//利息：总额*利率*天数
                $amout=bc("*",$data["amount"],$data["charge"]);//手续费
                $result["z_amount"]=$amout+$data["amount"]+$data["interest"];//应还数量
                $sx=bc("*",$data["charge"],100);
                $result["sx"]=$sx."%";
            }else{
                $result["z_amount"]=0;
            }
            switch ($sz[0]){
                case "btc":
                    $amounum=$arrdata["BTC_balance"];
                    break;
                case "eth":
                    $amounum=$arrdata["ETH_balance"];
                    break;
                case "lbth":
                    $amounum=$arrdata["LBTH_balance"];
                    break;
                default;
            }
        }else{
            $result["z_amount"]=0;
        }
        $url = "https://dncapi.bqiapp.com/api/coin/web-coinrank?page=1&type=-1&pagesize=8&webp=1";
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $resul = curl_exec($ch);
        curl_close($ch);
        $resul=json_decode($resul,true);
        $coin=$this->db->field("*")->table("bw_currency")->find();
        foreach ($resul["data"] as $k1=>$v1){
            if($v1["name"]=="XRP"){
                $resul["data"][$k1]["name"]="LBTH";
            }
            if(strtoupper($sz[0])==$v1["name"]){
                $amounumcj=bc("*",$amounum,$v1["current_price_usd"]);
                $num_coin=bc("/",$result["z_amount"],$v1["current_price_usd"]);
                $price=$v1["current_price_usd"];
            }
            if($sz[0]=="lbth" && $v1["name"]=="XRP"){
                $amounumcj=bc("*",$amounum,$v1["current_price_usd"]);
                $num_coin=bc("/",$result["z_amount"],$v1["current_price_usd"]);
                $price=$v1["current_price_usd"];
            }
        }
        $list["amounum"]=$amounum ? $amounum : 0;//总资产多少币种
        $list["amounumcj"]=$amounumcj ? $amounumcj : 0;//总资产多少USDT
//        $list["num_coin"]=$num_coin ? $num_coin : 0;//总负债多少币种
//        $list["z_amount"]=$result["z_amount"] ? $result["z_amount"] : 0;//总负债多少USDT
//        $list["balance"]=$data["amount"] ? $data["amount"] : 0;//我的借币
        $list["usdt"]=$arrdata["balance"] ? $arrdata["balance"] : 0;//可用币种余额
        $list["price"]=$price;//当前行情价格
//        $result['service']="0.098%";//手续费
        $result['balance']=0;
//        $result['BTC_balance']=$arrdata["BTC_balance"];//默认BTC币种
        $resultle["result"]=$result;
//        $resultle["arrlist"]=$resul["data"];
        $resultle["list"]=$list;
        $resultle["coin_trading"]=$lvlist;
        $this->ajax_return(0,$resultle);
//        $this->getView()->assign(["result"=>$result,"arrlist"=>$resul["data"],"list"=>$list,"coin_trading"=>$lvlist]);
    }

    public function coAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        $uid=$this->reqdata['u_id'];
//        $uid=7;
        $arr=$this->db->field("*")->table("bw_account")->where("uid = ".$uid)->find();
        $arrdata=$this->db->field("*")->table("bw_interest")->where("status = 0 and uid = ".$uid)->find();
        $resule["rate"]=0.00098;
        $resule["number"]=bc("*",$arr["balance"],20);
        $resule["currency"]=$arrdata["amount"];
        $resule["balance"]=bc("*",$arr["balance"],20);
        $this->ajax_return(0,$resule);
    }
    //杠杆交易买卖
    public function inAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        if(!isset($this->reqdata['number'])){
            $this->ajax_return(3);
        }
        if(!isset($this->reqdata['cls'])){
            $this->ajax_return(3);
        }
        if(!isset($this->reqdata['type'])){
            $this->ajax_return(3);
        }
        if(!isset($this->reqdata['price'])){
            $this->ajax_return(3);
        }
        $u_id=$this->reqdata['u_id'];
        $number=$this->reqdata['number'];
        $cls=$this->reqdata['cls'];
        $type=$this->reqdata['type'];
        $price=$this->reqdata['price'];
//        $u_id=7;
//        $price="9423.31";
//        $number="2";
//        $buy_cls=post("buy_cls");//USDT币种
//        $cls="BTC";//买入、卖出币种类型
//        $type="2";//1买入，2卖出

        $result=$this->db->field("*")->table("bw_account")->where("uid = ".$u_id)->find();
        $amount=bc("*",$number,$price,5);
        $this->db->beginTransaction();
        $data["uid"]=$u_id;
        $data["price"]=$price;
        $data["number"]=$number;
        $data["amount"]=$amount;
        $data["ctime"]=time();
        $data["cls"]=$cls;
        $data["buy_cls"]="USDT";
        $data["order_sn"]=$osn = date('Ymd').substr(implode(NULL, array_map('ord', str_split(substr(uniqid(), 7, 13), 1))), 0, 8);
        if($type==1){//买入
            if($result["balance"]<$amount){
                $this->ajax_return(502);
            }
            $data["type"]="买入";
            $resu["balance"]=$result["balance"]-$amount;
            $ty="+";
        }else{
            $data["type"]="卖出";
            $resu["balance"]=$result["balance"]+$amount;
            $ty="-";
        }
        switch ($cls){
            case "BTC":
                $resu["BTC_balance"]=bc($ty,$result["BTC_balance"],$number);
                if($resu["BTC_balance"]<0){
                    $this->ajax_return(502);
                }
                break;
            case "ETH":
                $resu["ETH_balance"]=bc($ty,$result["ETH_balance"],$number);
                if($resu["ETH_balance"]<0){
                    $this->ajax_return(502);
                }
                break;
            case "LBTH":
                $resu["LBTH_balance"]=bc($ty,$result["LBTH_balance"],$number);
                if($resu["LBTH_balance"]<0){
                    $this->ajax_return(502);
                }
                break;
            default;
        }
        $ids=$this->db->action($this->db->insertSql("pry_order",$data));
        $ids1=$this->db->action($this->db->updateSql("account",$resu,"uid = ".$u_id));
        if($ids && $ids1){
            $this->db->commit();
            $this->ajax_return(0);
        }else{
            $this->db->rollback();
            $this->ajax_return(500);
        }
    }
    //借币
    public function currencyAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        if(!isset($this->reqdata['number'])){
            $this->ajax_return(3);
        }
        if(!isset($this->reqdata['rate'])){
            $this->ajax_return(3);
        }
        $number=$this->reqdata['number'];//数量
        $rate=$this->reqdata['rate'];//日息率
        $u_id=$this->reqdata['u_id'];
//        $number=50000000;//数量
//        $rate=0.00098;//日息率
//        $u_id = 7;
        $result=$this->db->field("*")->table("bw_account")->where("uid = ".$u_id)->find();
        $arr=$this->db->field("*")->table("bw_interest")->where("status = 0 and uid = ".$u_id)->find();
        if(!empty($arr)){
            $this->ajax_return(309);
        }
        $anou=bc("*",$result["balance"],20);
        if($number>$anou || $number<=100){
            $this->ajax_return(310);
        }
        $this->db->beginTransaction();
        $charge=0.00098;
        $data["uid"]=$u_id;
        $data["type"]="USDT";
        $data["amount"]=$number;
        $data["ctime"]=time();
        $data["rate"]=$rate;
        $data["charge"]=$charge;
        $ids=$this->db->action($this->db->insertSql("interest",$data));
        $list["currency"]=$result["currency"]+$number;
        $idd=$this->db->action($this->db->updateSql("account",$list,"uid = ".$u_id));
        if($ids && $idd){
            $this->db->commit();
            $this->ajax_return(0);
        }else{
            $this->db->rollback();
            $this->ajax_return(500);
        }
    }
    //借币页面
    public function yeAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        $u_id=$this->reqdata['u_id'];
//        $u_id=7;
        $data=$this->db->field("*")->table("bw_interest")->where("status = 0 and uid = ".$u_id)->find();
        if(!empty($data["amount"])){
            //php 两个时间戳相隔的时间
            $timediff = time() - $data["ctime"];
            $days = intval($timediff / 86400)+1;
            $lv=bc("*",$data["amount"],$data["rate"]);
            $result["interest"]=bc("*",$days,$lv,"5");//利息：总额*利率*天数
            $amout=bc("*",$data["amount"],$data["charge"]);//手续费
            $cc=bc("+",$amout,$data["amount"]);
            $result["z_amount"]=bc("+",$cc,$result["interest"]);
//            $result["z_amount"]=$amout+$data["amount"]+$data["interest"];//应还数量
            $sx=bc("*",$data["charge"],100);
            $result["sx"]=$sx."%";
        }else{
            $result["z_amount"]=0;
        }
        $list["charge"]=$amout ? $amout : 0;
        $list["rate"]=$result["interest"] ? $result["interest"] : 0;
        $list["amount"]=$data["amount"] ? $data["amount"] : 0;
        $list["z_amount"]=$result["z_amount"];
        $this->ajax_return(0,$list);
    }
    //借币归还
    public function repayAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        if(!isset($this->reqdata['number'])){
            $this->ajax_return(3);
        }
        $u_id=$this->reqdata['u_id'];
        $number=$this->reqdata['number'];
//        $number=60000;//数量
//        $u_id = 7;
        $arrdata=$this->db->field("*")->table("bw_interest")->where("status = 0 and uid = ".$u_id)->find();
        if($arrdata){
            $data=$this->db->field("*")->table("bw_account")->where("uid = ".$u_id)->find();
            $this->db->beginTransaction();
            $list['balance']=$data["balance"]-$number;
            $result["h_amount"]=$number;
            $result["status"]=1;
            $resu["type"]="还币付息";
            $resu["info"]="还币付息操作";
            $resu["create_time"]=time();
            $resu["user_id"]=$u_id;
            $resu["num"]=$number;
            $resu["currency_name"]="USDT";
            $ids=$this->db->action($this->db->updateSql("account",$list,"uid = ".$u_id));
            $ids1=$this->db->action($this->db->updateSql("interest",$result,"status = 0 and id = ".$arrdata["id"]));
            $ids2=$this->db->action($this->db->insertSql("user_num_log",$resu));
            if($ids && $ids1 && $ids2){
                $this->db->commit();
                $this->ajax_return(0);
            }else{
                $this->db->rollback();
                $this->ajax_return(500);
            }
        }else{
            $this->ajax_return(311);
        }

    }
    //行情接口
    public function coinAction(){
        if(!isset($this->reqdata['market'])){
            $this->ajax_return(3);
        }
        if($this->reqdata['market'] != "coin"){
            $this->ajax_return(3);
        }
        $page = isset($this->reqdata['page']) ? $this->reqdata['page']: 1;
        $showpage = isset($this->reqdata['showpage']) ? $this->reqdata['showpage']: 23;
        $url = "https://dncapi.bqiapp.com/api/coin/web-coinrank?page={$page}&type=-1&pagesize={$showpage}&webp=1";
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $resul = curl_exec($ch);
        curl_close($ch);
        $huobi_usdt =json_decode($resul,true);
        $arr = [];
        foreach ($huobi_usdt["data"] as $k1=>$v1){
            if($v1["name"]=="XRP"){
                $huobi_usdt["data"][$k1]["name"]="LBTH";
            }
            $name = strtoupper($huobi_usdt["data"][$k1]["name"]);
            $arr[$k1]['name'] = $name."/USDT";
            $arr[$k1]['scale'] = $huobi_usdt["data"][$k1]["change_percent"];
            $arr[$k1]['market_value'] = $huobi_usdt["data"][$k1]['market_value'];
            $arr[$k1]['current_price_usd'] = $huobi_usdt["data"][$k1]["current_price_usd"];
        }
        $this->ajax_return(0,$arr);
    }
    //24小时行情
    public function data24Action(){
        if(!isset($this->reqdata['market'])){
            $this->ajax_return(3);
        }
        if($this->reqdata['market'] != "data"){
            $this->ajax_return(3);
        }
        if(!isset($this->reqdata['period'])){
            $this->ajax_return(307);
        }
        if(!isset($this->reqdata['symbol'])){
            $this->ajax_return(300);
        }
        if(!isset($this->reqdata['size'])){
            $this->ajax_return(3);
        }
        $time = $this->reqdata['period'];
        $coinname = $this->reqdata['symbol'];
        $size = $this->reqdata['size'];
        switch ($time){
            case 1: $period = "1m";break;
            case 5: $period = "5m";break;
            case 15: $period = "15m";break;
            case 30: $period = "30m";break;
            case 60: $period = "1h";break;
            case 1440: $period = "1d";break;
            default:$period = "1m";break;
        }
        $coin = $coinname."usdt";
        if($coin == "lbthusdt"){
            $coin = "xrpusdt";
        }
        if($coin == "usdtusdt"){
            $coin = "btcusdt";
        }
        $symbol = strtoupper($coin);
        $url = "https://api.yshyqxx.com/api/v1/klines?symbol={$symbol}&interval={$period}&limit={$size}";
        $str = file_get_contents($url);
        $line = json_decode($str,true);
        $arr = [];
        for($i=0;$i<count($line);$i++){
            $arr[$i][0] = date("Y-m-d",$line[$i][0]/1000);
            $arr[$i][1] = (float)$line[$i][1]; //开
            $arr[$i][2] = (float)$line[$i][2]; //高
            $arr[$i][3] = (float)$line[$i][3]; //低
            $arr[$i][4] = (float)$line[$i][4]; //关
            $arr[$i][5] = rand(1000000,3200000);
            $arr[$i][6] = ($arr[$i][1] > $arr[$i][4]) ? 1 : -1; //高
        }
//        $this->ajax_return(0,array_reverse($arr));
        $this->ajax_return(0,$arr);
    }
    //盘口
    public function depthAction(){
        if(!isset($this->reqdata['market'])){
            $this->ajax_return(3);
        }
        if($this->reqdata['market'] != "depth"){
            $this->ajax_return(3);
        }
        if(!$this->reqdata['symbol']){
            $this->ajax_return(300);
        }
        $coinname = $this->reqdata['symbol'];
        $coin = $coinname."usdt";
        if($coin == "lbthusdt"){
            $coin = "xrpusdt";
        }
        if($coin == "usdtusdt"){
            $coin = "btcusdt";
        }
        $symbol = strtoupper($coin);
        $url = "https://www.binancezh.com/api/v3/depth?symbol={$symbol}&limit=50";
        $str = file_get_contents($url);
        $res = json_decode($str,true);
        $data['bids'] = $res['bids'];
        $data['asks'] = $res['asks'];
        $this->ajax_return(0,$data);
    }
    //成交量
    public function buslogAction(){
        if(!isset($this->reqdata['market'])){
            $this->ajax_return(3);
        }
        if($this->reqdata['market'] != "log"){
            $this->ajax_return(3);
        }
        if(!$this->reqdata['symbol']){
            $this->ajax_return(300);
        }
        $coinname = $this->reqdata['symbol'];
        $coin = $coinname."usdt";
        if($coin == "lbthusdt"){
            $coin = "xrpusdt";
        }
        if($coin == "usdtusdt"){
            $coin = "btcusdt";
        }
        $symbol = strtoupper($coin);
        $url = "https://api.yshyqxx.com/api/v1/aggTrades?limit=500&symbol={$symbol}";
        $str1 = file_get_contents($url);
        $line = json_decode($str1,true);
        for($i=0;$i<count($line);$i++){
            $line[$i]['T'] = date("H:i:s",$line[$i]['T'] / 1000);
        }
        $this->ajax_return(0,$line);
    }
    //单笔交易对
    public function onlycoinAction(){
        if(!isset($this->reqdata['market'])){
            $this->ajax_return(3);
        }
        if($this->reqdata['market'] != "onlycoin"){
            $this->ajax_return(3);
        }
        if(!$this->reqdata['symbol']){
            $this->ajax_return(300);
        }
        $coinname = $this->reqdata['symbol'];
        $coin = $coinname."usdt";
        if($coin == "lbthusdt"){
            $coin = "xrpusdt";
        }
        if($coin == "usdtusdt"){
            $coin = "btcusdt";
        }
        $symbol = strtoupper($coin);
        $url = "https://api.yshyqxx.com/api/v1/klines?symbol={$symbol}&interval=1d&limit=1";
        $str = file_get_contents($url);
        $line = json_decode($str,true);
        $line[0][0] = date("Y/m/d",$line[0][1]/1000);
        $line[0][1] = $line[0][1]; //开
        $line[0][2] = $line[0][4]; //关
        $line[0][3] = $line[0][3]; //低
        $line[0][4] = $line[0][2]; //高
        $this->ajax_return(0,$line[0]);
    }
    //币币买入
    public function bibisellAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        if(!isset($this->reqdata['num'])){
            $this->ajax_return(302);
        }
        if(!isset($this->reqdata['paypass'])){
            $this->ajax_return(202);
        }
        if(!isset($this->reqdata['price'])){
            $this->ajax_return(202);
        }
        if(!isset($this->reqdata['symbol'])){
            $this->ajax_return(300);
        }
        $user = $this->db->field("*")
            ->table("bw_user")
            ->where("id = '{$this->reqdata['u_id']}'")
            ->find();
        $u_id = $user['id'];
        $pass = $this->reqdata['paypass'];
        $price = $this->reqdata['price']; //消耗币种
        $num = $this->reqdata['num']; //获得币种
        $symbol = $this->reqdata['symbol'];
        //买入数量
        $user_coin_num = $symbol."_num";
        $user_coin_available_balance = $symbol."_available_balance";
        include APP_PATH."/application/core/Aes.php";
        $aes = new \app\core\Aes();
        $pay = $aes->aes_encode($pass);
        if($pay == $user['transaction_password']){
            if($user['usdt_available_balance'] - $price >= 0){
                $this->db->beginTransaction();
                $data['u_id'] = $u_id;
                $data['type'] = "sell";
                $data['num'] = $num;
                $data['price'] = $price."USDT";
                $data['create_time'] = time();
                $data['coin'] = $symbol;
                $bool1 = $this->db->action($this->db->insertSql("coin_trading",$data));
                $sql = "UPDATE bw_user SET {$user_coin_num} = {$user_coin_num} + {$num},{$user_coin_available_balance} = {$user_coin_available_balance} + {$num}, usdt_num = usdt_num - {$price}, usdt_available_balance = usdt_available_balance - {$price} WHERE id = {$u_id}";
                $bool2 = $this->db->action($sql);
                $log['type'] = "币币交易";
                $log['info'] = "购买".$num.$symbol;
                $log['num'] = $num;
                $log['user_id'] = $u_id;
                $log['create_time'] = time();
                $log['currency_name'] = $symbol;
                $bool3 = $this->db->action($this->db->insertSql("user_num_log",$log));
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
    //币币卖出
    public function bibibuyAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        if(!isset($this->reqdata['num'])){
            $this->ajax_return(302);
        }
        if(!isset($this->reqdata['paypass'])){
            $this->ajax_return(202);
        }
        if(!isset($this->reqdata['price'])){
            $this->ajax_return(202);
        }
        if(!isset($this->reqdata['symbol'])){
            $this->ajax_return(300);
        }
        $user = $this->db->field("*")
            ->table("bw_user ")
            ->where("id = {$this->reqdata['u_id']}")
            ->find();
        $u_id = $user['id'];
        $pass = $this->reqdata['paypass'];
        $price = $this->reqdata['price']; //获得币种
        $num = $this->reqdata['num'];  //消耗币种
        $symbol = $this->reqdata['symbol'];
        //卖出数量
        $user_coin_num = $symbol."_num";
        $user_coin_available_balance = $symbol."_available_balance";
        include APP_PATH."/application/core/Aes.php";
        $aes = new \app\core\Aes();
        $pay = $aes->aes_encode($pass);
        if($pay == $user['transaction_password']){
            if($user[$user_coin_available_balance] - $num >= 0){
                $this->db->beginTransaction();
                $data['u_id'] = $u_id;
                $data['type'] = "buy";
                $data['num'] = $num;
                $data['price'] = $price."USDT";
                $data['create_time'] = time();
                $data['coin'] = $symbol;
                $bool1 = $this->db->action($this->db->insertSql("coin_trading",$data));
                $sql = "UPDATE bw_user SET {$user_coin_num} = {$user_coin_num} - {$num},{$user_coin_available_balance} = {$user_coin_available_balance} - {$num}, usdt_num = usdt_num + {$price}, usdt_available_balance = usdt_available_balance + {$price} WHERE id = {$u_id}";
                $bool2 = $this->db->action($sql);
                $data2['type'] = "币币交易";
                $data2['info'] = "卖出".$num.$symbol;
                $data2['num'] = $num;
                $data2['user_id'] = $u_id;
                $data2['create_time'] = time();
                $data2['currency_name'] = $symbol;
                $bool3 = $this->db->action($this->db->insertSql("user_num_log",$data2));
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
    //币币委托记录
    public function bibidelegateAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        $id = $this->reqdata['u_id'];
        $coin_trading = $this->db->field("*")
            ->table("bw_coin_trading")
            ->where("u_id = {$id}")
            ->select();
        if($coin_trading){
            $this->ajax_return(0,$coin_trading);
        }else{
            $this->ajax_return(0,[]);
        }
    }
    //合约委托记录
    public function heyuedelegateAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        $result= $this->db->field("*")->table("bw_heyue_data")->select();
        if($result){
           $this->ajax_return(0,$result);
        }else{
            $this->ajax_return(0,[]);
        }
    }
    //合约买入
    public function heyuesellAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        if(!isset($this->reqdata['paypass'])){
            $this->ajax_return(202);
        }
        if(!isset($this->reqdata['symbol'])){
            $this->ajax_return(300);
        }
        if(!isset($this->reqdata['type'])){
            $this->ajax_return(213);
        }
        if(!isset($this->reqdata['market_price'])){
            $this->ajax_return(208);
        }
        if(!isset($this->reqdata['margin'])){
            $this->ajax_return(209);
        }
        if(!isset($this->reqdata['fee'])){
            $this->ajax_return(210);
        }
        if(!isset($this->reqdata['multiple'])){
            $this->ajax_return(211);
        }
        if(!isset($this->reqdata['lots'])){
            $this->ajax_return(212);
        }
        $user = $this->db->field("*")
            ->table("bw_user ")
            ->where("id = {$this->reqdata['u_id']}")
            ->find();
        $u_id = $user['id'];
        $heyue = $this->db->field("*")
            ->table("bw_heyue")
            ->where("u_id = {$u_id}")
            ->find();
        $type = $this->reqdata['type'];
        $market_price = $this->reqdata['market_price'];
        $margin = $this->reqdata['margin'];
        $fee = $this->reqdata['fee'];
        $multiple = $this->reqdata['multiple'];
        $lots = $this->reqdata['lots'];
        $pass = $this->reqdata['paypass'];
        $symbol = $this->reqdata['symbol'];
        include APP_PATH."/application/core/Aes.php";
        $aes = new \app\core\Aes();
        $pay = $aes->aes_encode($pass);
        $price = $margin + $fee;
        if($pay == $user['transaction_password']){
            if($heyue['usdt'] - $price >= 0){
                $this->db->beginTransaction();
                $data['u_id'] = $u_id;
                $data['price'] = $price;
                $data['multiple'] = $multiple;
                $data['lots'] = $lots;
                $data['type'] = $type;
                $data['create_time'] = time();
                $data['coin'] = $symbol;
                $data['market_price'] = $market_price;
                $data['margin'] = $margin;
                $data['fee'] = $fee;
                $data['status'] = 0;
                $data['settled'] = 0;
                $bool1 = $this->db->action($this->db->insertSql("heyue_data",$data));
                $sql = "UPDATE bw_heyue SET usdt = usdt - {$price} WHERE u_id = {$u_id}";
                $bool2 = $this->db->action($sql);
                if ($bool1 && $bool2) {
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
    //合约卖出
    public function heyuebuyAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        if(!isset($this->reqdata['paypass'])){
            $this->ajax_return(202);
        }
        if(!isset($this->reqdata['symbol'])){
            $this->ajax_return(300);
        }
        if(!isset($this->reqdata['type'])){
            $this->ajax_return(213);
        }
        if(!isset($this->reqdata['market_price'])){
            $this->ajax_return(208);
        }
        if(!isset($this->reqdata['margin'])){
            $this->ajax_return(209);
        }
        if(!isset($this->reqdata['fee'])){
            $this->ajax_return(210);
        }
        if(!isset($this->reqdata['multiple'])){
            $this->ajax_return(211);
        }
        if(!isset($this->reqdata['lots'])){
            $this->ajax_return(212);
        }
        $user = $this->db->field("*")
            ->table("bw_user ")
            ->where("id = {$this->reqdata['u_id']}")
            ->find();
        $u_id = $user['id'];
        $heyue = $this->db->field("*")
            ->table("bw_heyue")
            ->where("u_id = {$u_id}")
            ->find();
        $type = $this->reqdata['type'];
        $market_price = $this->reqdata['market_price'];
        $margin = $this->reqdata['margin'];
        $fee = $this->reqdata['fee'];
        $multiple = $this->reqdata['multiple'];
        $lots = $this->reqdata['lots'];
        $pass = $this->reqdata['paypass'];
        $symbol = $this->reqdata['symbol'];
        include APP_PATH."/application/core/Aes.php";
        $aes = new \app\core\Aes();
        $pay = $aes->aes_encode($pass);
        $price = $margin + $fee;
        if($pay == $user['transaction_password']){
            if($heyue['usdt'] - $price >= 0){
                $this->db->beginTransaction();
                $data['u_id'] = $u_id;
                $data['price'] = $price;
                $data['multiple'] = $multiple;
                $data['lots'] = $lots;
                $data['type'] = $type;
                $data['create_time'] = time();
                $data['coin'] = $symbol;
                $data['market_price'] = $market_price;
                $data['margin'] = $margin;
                $data['fee'] = $fee;
                $data['status'] = 0;
                $data['settled'] = 0;
                $bool1 = $this->db->action($this->db->insertSql("heyue_data",$data));
                $sql = "UPDATE bw_heyue SET usdt = usdt - {$price} WHERE u_id = {$u_id}";
                $bool2 = $this->db->action($sql);
                if ($bool1 && $bool2) {
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
    //合约倍数
    public function heyuemultipleAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        $beishu = $this->db->field("*")
            ->table("bw_lever_multiple")
            ->where("type = 1")
            ->order("value ASC")
            ->select();
        $showshu = $this->db->field("*")
            ->table("bw_lever_multiple")
            ->where("type = 2")
            ->order("value ASC")
            ->select();
        $data['beishu'] = $beishu;
        $data['showshu'] = $showshu;
        $this->ajax_return(0,$data);

    }
}





















