<?php
class IndexController extends Base_Base{
    public function init(){
        parent::init();
    }
    public function indexAction(){
        if(!isset($this->reqdata['type'])){
            $this->ajax_return(3);
        }
        if($this->reqdata['type'] != "index"){
            $this->ajax_return(3);
        }
        $banner  = $this->db->field("*")
             ->table("bw_wap_banner")
             ->select();
        $data['banner'] = $banner;
        $clue = $this->db->field("id,title")
            ->table("bw_wap_clue")
            ->order("id desc")
            ->limit(0,3)
            ->select();
        $data['clue'] = $clue;
        $data['icon'] = $this->db->field("*")
             ->table("bw_wap_icon")
             ->select();
        $this->ajax_return(0,$data);
    }

    public function dataAction(){
        if(!isset($this->reqdata['type'])){
            $this->ajax_return(3);
        }
        if($this->reqdata['type'] != "data"){
            $this->ajax_return(3);
        }
        $url1 = "https://dncapi.bqiapp.com/api/v2/exchange/web-exchange?token=&page=1&pagesize=5&sort_type=exrank&asc=1&isinnovation=1&type=all&area=&webp=1";
        $exchange = $this->curl_get($url1);
        $res1 = json_decode($exchange,true);
        $data['exchange'] = $res1['data'];
        $url2 = "https://dncapi.bqiapp.com/api/coin/web-coinrank?page=1&type=-1&pagesize=6&webp=1";
        $currency = $this->curl_get($url2);
        $res2 = json_decode($currency,true);
        $new = [];
        foreach ($res2['data'] as $k=>$v){
            if($v['name'] != 'USDT'){
                $new[$k] = $v;
            }
        }
        $data['currency'] = $new;
        //涨https://dncapi.bqiapp.com/api/v2/coin/maxchange?isup=1&filtertype=0&sort_type=4&webp=1
        //跌https://dncapi.bqiapp.com/api/v2/coin/maxchange?isup=0&filtertype=0&sort_type=4&webp=1
        $url3 = "https://dncapi.bqiapp.com/api/v2/coin/maxchange?isup=1&filtertype=0&sort_type=4&webp=1";
        $rise = $this->curl_get($url3);
        $res3 = json_decode($rise,true);
        $data['rise'] = $res3['data'];
        $url4 = "https://dncapi.bqiapp.com/api/v2/coin/maxchange?isup=0&filtertype=0&sort_type=4&webp=1";
        $fall = $this->curl_get($url4);
        $res4 = json_decode($fall,true);
        $data['fall'] = $res4['data'];
        $this->ajax_return(0,$data);
    }
    //公告列表
    public function newlistAction(){
        if(!isset($this->reqdata['type'])){
            $this->ajax_return(3);
        }
        if($this->reqdata['type'] != "news"){
            $this->ajax_return(3);
        }
        $result = $this->db->field("*")
            ->table("bw_news")
            ->select();
        if($result){
            foreach ($result as $k=>$v){
                $result[$k]['content'] = htmlspecialchars_decode($v['content']);
            }
            $this->ajax_return(0,$result);
        }else{
            $this->ajax_return(0,[]);
        }
    }
    //公告详情
    public function newsdetailsAction(){
        if(!isset($this->reqdata['type'])){
            $this->ajax_return(3);
        }
        if($this->reqdata['type'] != "news"){
            $this->ajax_return(3);
        }
        if(!isset($this->reqdata['news_id'])){
            $this->ajax_return(3);
        }
        $id = $this->reqdata['news_id'];
        $result = $this->db->field("*")
            ->table("bw_news")
            ->where("id = {$id}")
            ->find();
        $result['content'] = htmlspecialchars_decode($result['content']);
        $this->ajax_return(0,$result);
    }

    public function curl_get($url){
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $result = curl_exec($ch);
        curl_close($ch);
        return $result;
    }
}