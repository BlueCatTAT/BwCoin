<?php
use Yaf\Controller_Abstract;
use Yaf\Dispatcher;
use Yaf\Session;
class TradeController extends Controller_Abstract {
    public $db;
    public $sessions;
    public $yac;
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
        $market = str_replace("_","",get("market"));
        if($market == "lbthusdt"){
            $market = "xrpusdt";
        }
        $huobi_today = $this->db->field("*")
            ->table("bw_huobi_ticker")
            ->where("symbol = '{$market}'")
            ->find();
        $coin_trading = $this->db->field("*")->table("bw_coin_trading")->select();
        if(!$this->sessions->username){
            $this->getView()->assign(["huobi_usdt"=>$huobi_usdt["data"],"huobi_today"=>$huobi_today,"balance"=>0,"coin_trading"=>$coin_trading]);
        }else{
            $balance = $this->db->getByKey("user","usdt_available_balance","username = '{$this->sessions->username}'");
            $this->getView()->assign(["huobi_usdt"=>$huobi_usdt["data"],"huobi_today"=>$huobi_today,"balance"=>$balance,"coin_trading"=>$coin_trading]);
        }
    }

    public function heyueAction(){

        $url = "https://dncapi.bqiapp.com/api/coin/web-coinrank?page=1&type=-1&pagesize=23&webp=1";
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
        $market = str_replace("_","",get("market"));
        if($market == "lbthusdt"){
            $market = "xrpusdt";
        }
        $huobi_today = $this->db->field("*")
            ->table("bw_huobi_ticker")
            ->where("symbol = '{$market}'")
            ->find();
        $coin_trading = $this->db->field("*")->table("bw_heyue_data")->select();
        $beishu = $this->db->field("*")->table("bw_lever_multiple")->where("type = 1")->order("value ASC")->select();
        $showshu = $this->db->field("*")->table("bw_lever_multiple")->where("type = 2")->order("value ASC")->select();
        if(!$this->sessions->username){
            $this->getView()->assign([
                "huobi_usdt"=>$huobi_usdt["data"],
                "huobi_today"=>$huobi_today,
                "balance"=>0,
                "coin_trading"=>$coin_trading,
                "beishu" => $beishu,
                "showshu" => $showshu
            ]);
        }else{
            $balance = $this->db->getByKey("user","usdt_available_balance","username = '{$this->sessions->username}'");
            $this->getView()->assign([
                "huobi_usdt"=>$huobi_usdt["data"],
                "huobi_today"=>$huobi_today,
                "balance"=>$balance,
                "coin_trading"=>$coin_trading,
                "beishu" => $beishu,
                "showshu" => $showshu
            ]);
        }
    }
    //K线图 数据库
    public function ajaxdata2Action(){
        Dispatcher::getInstance()->autoRender(false);
        $coin =  str_replace("_","",post("coin")); //处理币种
        $time = post("time"); //获取时间
        if($coin = "lbthusdt"){
            $coin = "xrpusdt";
        }
        if($coin = "usdtusdt"){
            $coin = "btcusdt";
        }
        //模拟数据展示
        $data = $this->db->field("id,open,close,low,high")
            ->table("bw_huobi_ticker")
            ->where("symbol = '{$coin}'")
            ->find();
        $arr = array();
        $times = time();
        $open = 0;
        $close = 0;
        $low = 0;
        $high = 0;
        for($i = 0;$i<400;$i++){
            $arr[$i][0] = date("Y/m/d",$times);
            $arr[$i][1] = $data['open'] + $open;
            $arr[$i][2] = $data['close'] + $close;
            $arr[$i][3] = $data['low'] + $low;
            $arr[$i][4] = $data['high'] + $high;
            $times = $times + 60*60*24;
            $open = $open + rand(-1000,1000);
            $close = $close + rand(-1000,1000);
            $low = $low - rand(-1000,1000);
            $high = $high + rand(-1000,1000);
        }
        echo json_encode(array_reverse($arr),320);
    }
    //K线图
    public function ajaxdataAction(){
        Dispatcher::getInstance()->autoRender(false);
        $size = isset($_POST['size']) ?  $_POST['size']: 500 ;
        $time = $_POST['time'];
        $period = "";
        switch ($time){
            case 1: $period = "1m";break;
            case 5: $period = "5m";break;
            case 15: $period = "15m";break;
            case 30: $period = "30m";break;
            case 60: $period = "1h";break;
            case 1440: $period = "1d";break;
            default:$period = "1m";break;
        }
        $coin = str_replace("_","",$_POST['coin']);
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
        for($i=0;$i<count($line);$i++){
            $line[$i][0] = date("Y/m/d",$line[$i][0]/1000);
            $line[$i][1] = $line[$i][1]; //开
            $line[$i][2] = $line[$i][4]; //关
            $line[$i][3] = $line[$i][3]; //低
            $line[$i][4] = $line[$i][2]; //高
        }
        $str2 = json_encode(array_reverse($line));
        echo $str2;
    }
    //盘口
    public function ajaxdepthAction(){
        Dispatcher::getInstance()->autoRender(false);
        $size = isset($_POST['size']) ?  $_POST['size']: 50 ;
        $coin = str_replace("_","",$_POST['symbol']);
        if($coin == "lbthusdt"){
            $coin = "xrpusdt";
        }
        if($coin == "usdtusdt"){
            $coin = "btcusdt";
        }
        $symbol = strtoupper($coin);
        $url = "https://www.binancezh.com/api/v3/depth?symbol={$symbol}&limit={$size}";
        $str = file_get_contents($url);
        echo $str;
    }
    //成交量
    public function buslogAction(){

        Dispatcher::getInstance()->autoRender(false);
        $size = isset($_POST['size']) ?  $_POST['size']: 500 ;
        $coin = str_replace("_","",$_POST['symbol']);
        if($coin == "lbthusdt"){
            $coin = "xrpusdt";
        }
        if($coin == "usdtusdt"){
            $coin = "btcusdt";
        }
        $symbol = strtoupper($coin);
        $start_time = (time() - 3600 * 24 * 10) * 1000;
        $end_time = time() * 1000;
        //$url = "https://api.yshyqxx.com/api/v1/klines?symbol={$symbol}&interval=1d&limit={$size}&startTime={$start_time}&endTime={$end_time}";
        //https://api.yshyqxx.com/api/v1/klines?symbol=BTCUSDT&interval=1d&limit=1000&startTime=1589241600001&endTime=1590498364000
        //https://api.yshyqxx.com/api/v1/aggTrades?limit=80&symbol=BTCUSDT
        $url = "https://api.yshyqxx.com/api/v1/aggTrades?limit={$size}&symbol={$symbol}";
        $str1 = file_get_contents($url);
        $line = json_decode($str1,true);
        for($i=0;$i<count($line);$i++){
            $line[$i]['T'] = date("H:i:s",$line[$i]['T'] / 1000);
        }
        echo json_encode($line,320);
    }
    //币种
    public function cointypeAction($site=50)
    {
        Dispatcher::getInstance()->autoRender(false);
        $size = isset($_POST['size']) ? $_POST['size'] : $site;
        $url = "https://dncapi.bqiapp.com/api/coin/web-coinrank?page=1&type=-1&pagesize={$size}&webp=1";
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $result = curl_exec($ch);
        curl_close($ch);
        $result=json_decode($result,true);
        foreach ($result["data"] as $k=>$v){
            if($v["name"]=="XRP"){
                $result["data"][$k]["name"]="LBTH";
                $result["data"][$k]["co_name"]="lbth";
            }else{
                $result["data"][$k]["co_name"]=strtolower($v["name"]);
            }
        }
        $result=json_encode($result);
        echo $result;
    }
    //单币行情数据
    public function onecoinAction(){
        Dispatcher::getInstance()->autoRender(false);
        $coin = str_replace("_","",$_POST['symbol']);
        if($coin == "lbthusdt"){
            $coin = "xrpusdt";
        }
        if($coin == "usdtusdt"){
            $coin = "btcusdt";
        }
        $symbol = strtoupper($coin);
        $url = "https://api.yshyqxx.com/api/v1/klines?symbol={$symbol}&interval=1d&limit=1";
        $str = file_get_contents($url);
        echo $str;
    }

    public function sellAction(){
        Dispatcher::getInstance()->autoRender(false);
        if(!$this->sessions->username){
             echo json_encode(["code"=>"0","msg"=>"未登录"]);
        }else{
            $user = $this->db->field("*")
                ->table("bw_user ")
                ->where("username = '{$this->sessions->username}'")
                ->find();
            $u_id = $user['id'];
            $pass = post("pass");
            $price = post("price"); //消耗币种
            $num = post("num"); //获得币种
            $symbol = post("symbol");
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
                    $data2['type'] = "币币交易";
                    $data2['info'] = "购买".$num.$symbol;
                    $data2['num'] = $num;
                    $data2['user_id'] = $u_id;
                    $data2['create_time'] = time();
                    $data2['currency_name'] = $symbol;
                    $bool3 = $this->db->action($this->db->insertSql("user_num_log",$data2));
                    if ($bool1 && $bool2 && $bool3) {
                        $this->db->commit();
                        echo json_encode(["code"=>1,"msg"=>"交易成功"]);
                    } else {
                        $this->db->rollback();
                        echo json_encode(["code"=>0,"msg"=>"交易失败，稍后再试"]);
                    }
                }else{
                    echo json_encode(["code"=>2,"msg"=>"该USDT余额不足"]);
                }
            }else{
                echo json_encode(["code"=>2,"msg"=>"交易密码错误"]);
            }
        }
    }

    public function buyAction(){
        Dispatcher::getInstance()->autoRender(false);
        if(!$this->sessions->username){
            echo json_encode(["code"=>"0","msg"=>"未登录"]);
        }else{
            $user = $this->db->field("*")
                ->table("bw_user ")
                ->where("username = '{$this->sessions->username}'")
                ->find();
            $u_id = $user['id'];
            $pass = post("pass");
            $price = post("price"); //获得币种
            $num = post("num");  //消耗币种
            $symbol = post("symbol");
            //卖出数量
            $user_coin_num = $symbol."_num";
            $user_coin_available_balance = $symbol."_available_balance";
            include APP_PATH."/application/core/Aes.php";
            $aes = new \app\core\Aes();
            $pay = $aes->aes_encode($pass);
            if($pay == $user['transaction_password']){
                if($user[$user_coin_available_balance] - $price >= 0){
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
                        echo json_encode(["code"=>1,"msg"=>"交易成功"]);
                    } else {
                        $this->db->rollback();
                        echo json_encode(["code"=>0,"msg"=>"交易失败，稍后再试"]);
                    }
                }else{
                    echo json_encode(["code"=>2,"msg"=>"该{$symbol}余额不足"]);
                }
            }else{
                echo json_encode(["code"=>2,"msg"=>"交易密码错误"]);
            }
        }
    }
    //合约买
    public function heyuesellAction(){
        Dispatcher::getInstance()->autoRender(false);
        $user = $this->db->field("*")
            ->table("bw_user ")
            ->where("username = '{$this->sessions->username}'")
            ->find();
        $u_id = $user['id'];
        $heyue = $this->db->field("*")
            ->table("bw_heyue")
            ->where("u_id = {$u_id}")
            ->find();
        $inputtxt = post("inputtxt");
        $type = "";
        if($inputtxt == "买入开多(看涨)"){
            $type = "看涨";
        }
        if($inputtxt == "买入平空"){
            $type = "平空";
        }
        $market_price = post("market_price");
        $margin = post("margin");
        $fee = post("fee");
        $multiple = post("multiple");
        $lots = post("lots");
        $pass = post("pass");
        $symbol = post("symbol");
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
                    echo json_encode(["code"=>1,"msg"=>"挂单成功"]);
                } else {
                    $this->db->rollback();
                    echo json_encode(["code"=>0,"msg"=>"挂单失败，稍后再试"]);
                }
            }else{
                echo json_encode(["code"=>2,"msg"=>"该余额不足"]);
            }
        }else{
            echo json_encode(["code"=>2,"msg"=>"交易密码错误"]);
        }
    }
    //合约卖
    public function heyuebuyAction(){
        Dispatcher::getInstance()->autoRender(false);
        $user = $this->db->field("*")
            ->table("bw_user ")
            ->where("username = '{$this->sessions->username}'")
            ->find();
        $u_id = $user['id'];
        $heyue = $this->db->field("*")
            ->table("bw_heyue ")
            ->where("u_id = {$u_id}")
            ->find();
        $inputtxt = post("inputtxt");
        $type = "";
        if($inputtxt == "卖出开空(看跌)"){
            $type = "看跌";
        }
        if($inputtxt == "卖出平多"){
            $type = "平多";
        }
        $market_price = post("market_price");
        $margin = post("margin");
        $fee = post("fee");
        $multiple = post("multiple");
        $lots = post("lots");
        $pass = post("pass");
        $symbol = post("symbol");
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
                    echo json_encode(["code"=>1,"msg"=>"挂单成功"]);
                } else {
                    $this->db->rollback();
                    echo json_encode(["code"=>0,"msg"=>"挂单失败，稍后再试"]);
                }
            }else{
                echo json_encode(["code"=>2,"msg"=>"该余额不足"]);
            }
        }else{
            echo json_encode(["code"=>2,"msg"=>"交易密码错误"]);
        }
    }

    public function emptyAction()
    {
        // TODO: Implement __call() method.
    }
    //杠杆交易
    public function leveragedAction(){
        $con=$_GET['market'];
        if(!empty($con)){
            $sz=explode("_",$con);
            if($sz[0]=="usdt"){
                $sz[0]="btc";
            }
        }
        $user = $this->db->field("*")
            ->table("bw_user ")
            ->where("username = '{$this->sessions->username}'")
            ->find();
        $amounum=0;
        if(!empty($user["id"])){
            $arrdata=$this->db->field("*")->table("bw_account")->where("uid = ".$user['id'])->find();
            $data=$this->db->field("*")->table("bw_interest")->where("status = 0 and uid = ".$user['id'])->find();
            $lvlist=$this->db->field("*")->table("bw_pry_order")->where("uid = ".$user['id'])->order("id desc")->select();
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
        $list["num_coin"]=$num_coin ? $num_coin : 0;//总负债多少币种
        $list["z_amount"]=$result["z_amount"] ? $result["z_amount"] : 0;//总负债多少USDT
        $list["balance"]=$data["amount"] ? $data["amount"] : 0;//我的借币
        $list["usdt"]=$arrdata["balance"] ? $arrdata["balance"] : 0;//可用币种余额
        $list["price"]=$price;//当前行情价格
        $result['service']="0.098%";//手续费
        $result['balance']=0;
//        $result['BTC_balance']=$arrdata["BTC_balance"];//默认BTC币种
        $this->getView()->assign(["result"=>"$result","arrlist"=>$resul["data"],"list"=>$list,"coin_trading"=>$lvlist]);
    }
    //资金划转
    public function transferAction(){
        Dispatcher::getInstance()->autoRender(false);
        $user = $this->db->field("*")
            ->table("bw_user ")
            ->where("username = '{$this->sessions->username}'")
            ->find();
        $u_id = $user['id'];
        $roll=post("roll");//转出账户
//        $shift=post("shift");//转入账户
        $number=post("number");//转出数量
        if(empty($roll) || empty($number)){
            echo json_encode(["code"=>2,"msg"=>"转出账户或数量为空"]);exit;
        }
        //开启事物
        $this->db->beginTransaction();
        $us = $this->db->field("*")
            ->table("bw_account ")
            ->where("uid = ".$user['id'])
            ->find();
        $resu["type"]="账户划转";
        $resu["create_time"]=time();
        $resu["user_id"]=$user['id'];
        $resu["num"]=$number;
        $resu["currency_name"]="USDT";
        if($roll=="bibi"){
            $data['usdt_available_balance']=$user['usdt_available_balance']-$number;
            if($data['usdt_available_balance']<0){
                echo json_encode(["code"=>2,"msg"=>"账户余额数量不足"]);exit;
            }
            $list["balance"]=$number+$us["balance"];
            $list["status"]=0;
            $resu["info"]="从币币账户划转到杠杆账户";
            $ids=$this->db->action($this->db->updateSql('account',$list,"uid = ".$user['id']));
            $ids1=$this->db->action($this->db->updateSql('user',$data,"id = ".$user['id']));
        }else{
            $arr=$this->db->field("*")->table("bw_interest")->where("status = 0 and uid = ".$u_id)->find();
            if(!empty($arr)){
                echo json_encode(["code"=>2,"msg"=>"你还有借币未归还,请先归还"]);exit;
            }
            $data['balance']=$us['balance']-$number;
            if($data['balance']<0){
                echo json_encode(["code"=>2,"msg"=>"账户余额数量不足"]);exit;
            }
            $resu["info"]="从杠杆账户划转到币币账户";
            $list['usdt_available_balance']=$us['usdt_available_balance']+$number;
            $ids=$this->db->action($this->db->updateSql('account',$data,"uid = ".$user['id']));
            $ids1=$this->db->action($this->db->updateSql('user',$list,"id = ".$user['id']));
        }
        $ids2=$this->db->action($this->db->insertSql("user_num_log",$resu));
        if($ids && $ids1 && $ids2){
            $this->db->commit();
            echo json_encode(["code"=>1,"msg"=>"交易成功"]);exit;
        }else{
            $this->db->rollback();
            echo json_encode(["code"=>2,"msg"=>"账户划转失败"]);exit;
        }

    }
    //申请借币
    public function currencyAction(){
        Dispatcher::getInstance()->autoRender(false);
        $number=post("number");//数量
        $rate=post("rate");//日息率
        if(empty($number)){
            echo json_encode(["code"=>2,"msg"=>"请输入数量"]);exit;
        }
        $user = $this->db->field("*")
            ->table("bw_user ")
            ->where("username = '{$this->sessions->username}'")
            ->find();
        $u_id = $user['id'];
        $arr=$this->db->field("*")->table("bw_interest")->where("status = 0 and uid = ".$u_id)->find();
        if(!empty($arr)){
            echo json_encode(["code"=>2,"msg"=>"你还有借币未归还,请先归还"]);exit;
        }
        $this->db->beginTransaction();
        $charge=0.00098;
        $data["uid"]=$u_id;
        $data["type"]="USDT";
        $data["amount"]=$number;
        $data["ctime"]=time();
        $data["rate"]=$rate;
        $data["charge"]=$charge;
        $result=$this->db->field("*")->table("bw_account")->where("uid = ".$u_id)->find();
        $ids=$this->db->action($this->db->insertSql("interest",$data));
        $list["currency"]=$result["currency"]+$number;
        $idd=$this->db->action($this->db->updateSql("account",$list,"uid = ".$u_id));
        if($ids && $idd){
            $this->db->commit();
            echo json_encode(["code"=>1,"msg"=>"申请成功"]);exit;
        }else{
            $this->db->rollback();
            echo json_encode(["code"=>2,"msg"=>"申请失败"]);exit;
        }
    }
    //借币还息
    public function repaybAction(){
        Dispatcher::getInstance()->autoRender(false);
        $number=post("number");//数量
        $id=post("id");//数量
        if(empty($number)){
            echo json_encode(["code"=>2,"msg"=>"请输入数量"]);exit;
        }
        $user = $this->db->field("*")
            ->table("bw_user ")
            ->where("username = '{$this->sessions->username}'")
            ->find();
        $u_id = $user['id'];
        $data=$this->db->field("*")->table("bw_account")->where("uid = ".$u_id)->find();
        $this->db->beginTransaction();
        $list['balance']=$data["balance"]-$number;
        $result["h_amount"]=$number;
        $result["status"]=1;
        $resu["type"]="还币付息";
        $resu["info"]="还币付息操作";
        $resu["create_time"]=time();
        $resu["user_id"]=$user['id'];
        $resu["num"]=$number;
        $resu["currency_name"]="USDT";
        $ids=$this->db->action($this->db->updateSql("account",$list,"uid = ".$u_id));
        $ids1=$this->db->action($this->db->updateSql("interest",$result,"status = 0 and id = ".$id));
        $ids2=$this->db->action($this->db->insertSql("user_num_log",$resu));
        if($ids && $ids1 && $ids2){
            $this->db->commit();
            echo json_encode(["code"=>1,"msg"=>"归还成功"]);exit;
        }else{
            $this->db->rollback();
            echo json_encode(["code"=>2,"msg"=>"归还失败"]);exit;
        }
    }
    // 杠杆交易
    public function dealAction(){
        Dispatcher::getInstance()->autoRender(false);
        $price=post("price");
        $number=post("number");
//        $buy_cls=post("buy_cls");//USDT币种
        $cls=post("cls");//买入、卖出币种类型
//        $cls = str_replace("_","",$_POST['cls']);
//        if($cls == "lbthusdt"){
//            $cls = "xrpusdt";
//        }
//        if($cls == "usdtusdt"){
//            $cls = "btcusdt";
//        }
        $type=post("type");//1买入，2卖出
        $user = $this->db->field("*")
            ->table("bw_user ")
            ->where("username = '{$this->sessions->username}'")
            ->find();
        $u_id = $user['id'];
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
                echo json_encode(["code"=>2,"msg"=>"账户余额不足"]);exit;
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
                break;
            case "ETH":
                $resu["ETH_balance"]=bc($ty,$result["ETH_balance"],$number);
                break;
            case "LBTH":
                $resu["LBTH_balance"]=bc($ty,$result["LBTH_balance"],$number);
                break;
                default;
        }
        $ids=$this->db->action($this->db->insertSql("pry_order",$data));
        $ids1=$this->db->action($this->db->updateSql("account",$resu,"uid = ".$u_id));
        if($ids && $ids1){
            $this->db->commit();
            echo json_encode(["code"=>1,"msg"=>"交易成功"]);exit;
        }else{
            $this->db->rollback();
            echo json_encode(["code"=>2,"msg"=>"交易失败"]);exit;
        }
    }
}











