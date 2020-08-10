<?php
use Yaf\Controller_Abstract;
use Yaf\Dispatcher;
/**
 * Created by PhpStorm.
 * User: openice
 * Date: 2020/5/16
 * Time: 16:21
 */
class QuotesController extends Controller_Abstract {

    public function init(){
        Dispatcher::getInstance()->autoRender(false);
    }

    public $base_url = "https://api.huobi.pro";
    /**
     * Get candle candlestick chart
     * @param string $symbol required true default [btcusdt|ethbtc|.....]
     * @param string $period required true default [1min|5min|15min|30min|60min|4hour|1day|1mon|1week|1year]
     * @param integer $size required false default [1,2000]
     * @return array and if the is empty  Api/Quotes/klineDiagram
     */
    public function kline_diagram()
    {
        $market = isset($_GET['market'])?$_GET['market']:"btc_usdt";
        $start = strstr(strtolower($market), '_');
        $end = strstr(strtolower($market), '_', true);
        if($end == 'vce'){
            $market = "iota".$start;
        }else{
            $market = $end.$start;
        }
        $symbol = str_replace("_","",$market);
        $time = isset($_GET['time'])?$_GET['time']:1;
        $period = "";
        switch ($time){
            case 1: $period = "1min";break;
            case 5: $period = "5min";break;
            case 15: $period = "15min";break;
            case 30: $period = "30min";break;
            case 60: $period = "60min";break;
            case 1440: $period = "1day";break;
            default:$period = "1min";break;
        }
        $data['symbol'] = $symbol;
        $data['size'] = 200;
        $data['period'] = $period;
        $ApiData = $this->createLinkstring($data);
        $api = "/market/history/kline";
        $url = $this->base_url.$api."?".$ApiData;
        $result = $this->request_get($url);
        $res = json_decode($result,true);
        if($res['status'] == 'ok'){
             if($period == '1day'){
                 $data = $res['data'];
                 $arr = array();
                 foreach ($data as $k=>$v){
                     $arr[$k][0] = date("Ymd",$v['id']);
                     $arr[$k][1] = $v['open'];
                     $arr[$k][2] = $v['close'];
                     $arr[$k][3] = $v['low'];
                     $arr[$k][4] = $v['high'];
                 }
                 echo json_encode(array_reverse($arr),320);
             }else{
                 $data = $res['data'];
                 $arr = array();
                 foreach ($data as $k=>$v){
                     $arr[$k][0] = date("H:i",$v['id']);
                     $arr[$k][1] = $v['open'];
                     $arr[$k][2] = $v['close'];
                     $arr[$k][3] = $v['low'];
                     $arr[$k][4] = $v['high'];
                 }
                 echo json_encode(array_reverse($arr),320);
             }
        }else{
            exit;
        }
    }

    public function kline_coin(){
        $market = isset($_GET['market'])?$_GET['market']:"btc_usdt";
        $start = strstr(strtolower($market), '_');
        $end = strstr(strtolower($market), '_', true);
        if($end == 'vce'){
            $market = "iota".$start;
        }else{
            $market = $end.$start;
        }
        $symbol = str_replace("_","",$market);
        $data['symbol'] = $symbol;
        $ApiData = $this->createLinkstring($data);
        $api = "/market/detail/merged";
        $url = $this->base_url.$api."?".$ApiData;
        $result = $this->request_get($url);
        $res = json_decode($result,true);
        if($res['status'] == 'ok'){
            $data = $res['tick'];
            $data['buy_price']=$res['tick']['close'];
            $data['sell_price']=$res['tick']['open'];
            echo json_encode($data,320);
        }else{
            echo json_encode([]);
        }
    }

    public function createLinkstring($para) {
        $arg  = "";
        while (list ($key, $val) = each ($para)) {
            $arg.=$key."=".$val."&";
        }
        $arg = substr($arg,0,count($arg)-2);
        if(get_magic_quotes_gpc()){$arg = stripslashes($arg);}
        return $arg;
    }
  
    public function coin_del(){
         M()->query("TRUNCATE TABLE tw_huobi_ticker");
         echo "数据删除成功";
    }

    public function coin_depth(){
        $market = isset($_GET['market'])?$_GET['market']:"btc_usdt";
        $start = strstr(strtolower($market), '_');
        $end = strstr(strtolower($market), '_', true);
        if($end == 'vce'){
            $market = "iota".$start;
        }else{
            $market = $end.$start;
        }
        $symbol = str_replace("_","",$market);
        $data['symbol'] = $symbol;
        $data['type'] = "step2";
        $ApiData = $this->createLinkstring($data);
        $api = "/market/depth";
        $url = $this->base_url.$api."?".$ApiData;
        $result = $this->request_get($url);
        $res = json_decode($result,true);
        if($res['status'] == 'ok'){
            $ndata['buy']=$res['tick']['bids'];
            $ndata['sell']=array_reverse($res['tick']['asks']);
            echo json_encode($ndata,320);
        }else{
            echo json_encode([]);
        }
    }

    public function coin_log(){
        $market = isset($_GET['market'])?$_GET['market']:"btc_usdt";
        $start = strstr(strtolower($market), '_');
        $end = strstr(strtolower($market), '_', true);
        if($end == 'vce'){
            $market = "iota".$start;
        }else{
            $market = $end.$start;
        }
        $symbol = str_replace("_","",$market);
        $data['symbol'] = $symbol;
        $data['size'] = 5;
        $ApiData = $this->createLinkstring($data);
        $api = "/market/history/trade";
        $url = $this->base_url.$api."?".$ApiData;
        $result = $this->request_get($url);
        $res = json_decode($result,true);
        if($res['status'] == 'ok'){
            $data = $res['data'];
            $arr0[] = [];
            foreach ($data[0]['data'] as $k=>$v){
                $arr0[$k]['addtime'] =  Date("H:i:s",$v['ts']/1000);
                $arr0[$k]['price'] =  $v['price'];
                $arr0[$k]['mum'] =  $v['amount'];
                $arr0[$k]['type'] = ($v['direction']=='buy')?1:2;
            }
            $arr1[] = [];
            foreach ($data[1]['data'] as $k1=>$v1){
                $arr1[$k1]['addtime'] =  Date("H:i:s",$v1['ts']/1000);
                $arr1[$k1]['price'] =  $v1['price'];
                $arr1[$k1]['mum'] =  $v1['amount'];
                $arr1[$k1]['type'] = ($v1['direction']=='buy')?1:2;
            }
            $arr2[] = [];
            foreach ($data[1]['data'] as $k1=>$v1){
                $arr2[$k1]['addtime'] =  Date("H:i:s",$v1['ts']/1000);
                $arr2[$k1]['price'] =  $v1['price'];
                $arr2[$k1]['mum'] =  $v1['amount'];
                $arr2[$k1]['type'] = ($v1['direction']=='buy')?1:2;
            }
            $arr3[] = [];
            foreach ($data[1]['data'] as $k1=>$v1){
                $arr3[$k1]['addtime'] =  Date("H:i:s",$v1['ts']/1000);
                $arr3[$k1]['price'] =  $v1['price'];
                $arr3[$k1]['mum'] =  $v1['amount'];
                $arr3[$k1]['type'] = ($v1['direction']=='buy')?1:2;
            }
            $arr4[] = [];
            foreach ($data[1]['data'] as $k1=>$v1){
                $arr4[$k1]['addtime'] =  Date("H:i:s",$v1['ts']/1000);
                $arr4[$k1]['price'] =  $v1['price'];
                $arr4[$k1]['mum'] =  $v1['amount'];
                $arr4[$k1]['type'] = ($v1['direction']=='buy')?1:2;
            }
            $newArr = array_merge($arr0,$arr1,$arr2,$arr3,$arr4);
            echo json_encode($newArr,320);
        }else{
            echo json_encode([]);
        }
    }
  
    public function coin_list(){
        $api = "/market/tickers";
        $url = $this->base_url.$api;
        $result = $this->request_get($url);
        $res = json_decode($result,true);
        echo "<pre>";
        print_r($res);
        exit;
    }

    public function coin_data(){
        $api = "/market/tickers";
        $url = $this->base_url.$api;
        $result = $this->request_get($url);
        $res = json_decode($result,true);
        if($res['status'] == 'ok'){
            $data = $res["data"];
            $huobi=M('Huobi_ticker');
            foreach ($data as $k=>$v){
                $huobi_data['symbol'] = $v['symbol'];
                $huobi_data['amount'] = $v['amount'];
                $huobi_data['count'] = $v['count'];
                $huobi_data['open'] = $v['open'];
                $huobi_data['close'] = $v['close'];
                $huobi_data['low'] = $v['low'];
                $huobi_data['high'] = $v['high'];
                $huobi_data['vol'] = $v['vol'];
                $huobi_data['bid'] = $v['bid'];
                $huobi_data['bidSize'] = $v['bidSize'];
                $huobi_data['ask'] = $v['ask'];
                $huobi_data['askSize'] = $v['askSize'];
                $huobi->add($huobi_data);
            }
            echo "更新数据OK<hr>".$url;
            exit;
        }else{
            exit;
        }
        exit;
    }

    public function request_get($url){
        $header = array(
            'Accept: application/json'
        );
        $con = curl_init();
        curl_setopt($con, CURLOPT_HEADER, false);
        curl_setopt($con, CURLOPT_URL, $url);
        curl_setopt($con, CURLOPT_HTTPHEADER, $header);
        curl_setopt($con, CURLOPT_RETURNTRANSFER,true);
        curl_setopt($con, CURLOPT_TIMEOUT, 30);
        curl_setopt($con, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($con, CURLOPT_SSL_VERIFYHOST, FALSE);
        $output = curl_exec($con);
        curl_close($con);
        return $output;
    }

}

