<?php
class LegalController extends Base_Base{
    public function init(){
        parent::init();
    }

    //币种种类
    public function typeAction(){
        $result=$this->db->field("*")->table("bw_currency")->order("id")->select();
        $list["result"]=$result;
        $this->ajax_return(0,$list);
    }

    //法币购买列表
    public function purchaseAction(){
        if(!$this->reqdata['coin']){
            $this->ajax_return(3);
        }
        if(!isset($this->reqdata['page'])){
            $this->ajax_return(3);
        }
        if(!isset($this->reqdata['showpage'])){
            $this->ajax_return(3);
        }
        if(!isset($this->reqdata['type'])){
            $this->ajax_return(3);
        }
        $con=$this->reqdata['coin'];
        $type=$this->reqdata['type'];//购买or卖出
//        $con="BTC";
        $showpage = $this->reqdata['showpage'];
        $page = $this->reqdata['page'];
//        $showpage=10;
//        $page=1;
        $start =  ($page-1)*$showpage;
        if($type==1){
            $condition="status = 0 and type = 1 and designation = '$con'";
        }else{
            $condition="status = 0 and type = 0 and designation = '$con'";
        }
        $data=$this->db->field("*")
            ->table("bw_merchant")
            ->where($condition)
            ->order("id desc")
            ->limit($start,$showpage)
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
//        $result=$this->db->field("*")->table("bw_currency")->order("id")->select();
        $list["data"]=$data;
//        $list["result"]=$result;
        $this->ajax_return(0,$list);
//        $this->getView()->assign(["result"=>$result,"data"=>$data,"con"=>$con]);
    }

    //交易记录
    public function recordAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        if(!isset($this->reqdata['status'])){
            $this->ajax_return(3);
        }
        if(!isset($this->reqdata['page'])){
            $this->ajax_return(3);
        }
        if(!isset($this->reqdata['showpage'])){
            $this->ajax_return(3);
        }
        $u_id = $this->reqdata['u_id'];
        $staus = $this->reqdata['status'];//1、全部,2、买入,3、卖出,4、待付款,5、取消
        $showpage = $this->reqdata['showpage'];
        $page = $this->reqdata['page'];
//        $u_id=7;
//        $staus=1;
//        $showpage=10;
//        $page=1;
        $start =  ($page-1)*$showpage;
        switch ($staus){
            case 1:
                $condition="id > 0 ";
                break;
            case 2:
                $condition="type = 0 ";
                break;
            case 3:
                $condition="type = 1 ";
                break;
            case 4:
                $condition="status = 0 ";
                break;
            case 5:
                $condition="status = 2 ";
                break;
                default;
        }
        $data=$this->db->field("*")->table("bw_merchant_order")->where($condition."and in_uid = ".$u_id)->order("id desc")->limit($start,$showpage)->select();
        foreach ($data as $k=>$v){
            $data[$k]["ctime"]=date("Y-m-d H:i:s",$v["ctime"]);
        }
        $list["list"]=$data;
        $this->ajax_return(0,$list);
    }

    //交易页面
    public function dealAction(){
        if(!isset($this->reqdata['id'])){
            $this->ajax_return(3);
        }
        $id=$this->reqdata['id'];
//        $id=4230;
        $condition="id = ".$id;
        $data=$this->db->field("*")->table("bw_merchant")->where($condition)->find();
        $str=strlen($data["name"]);
        if($str>6){
            $data["name1"]=substr_replace($data["name"],"**",3);
        }else{
            $data["name1"]=substr_replace($data["name"],"*",3);
        }
        $data["rate"]=(bc("/",$data["degree"],$data["transactions"],2)*100)."%";
        $list["list"]=$data;
        $this->ajax_return(0,$list);
    }

    //会员购买
    public function buyAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        if(!isset($this->reqdata['num'])){
            $this->ajax_return(3);
        }
        if(!isset($this->reqdata['yuan'])){
            $this->ajax_return(3);
        }
        if(!isset($this->reqdata['id'])){
            $this->ajax_return(3);
        }
        $u_id=$this->reqdata['u_id'];
        $num=$this->reqdata['num'];
        $yuan=$this->reqdata['yuan'];
        $id=$this->reqdata['id'];
//        $u_id=7;
//        $num=7.89340;
//        $yuan=550044;
//        $id=4230;
        $condition="id = ".$id;
        $data=$this->db->field("*")->table("bw_merchant")->where($condition)->find();
        $user=$this->db->field("*")->table("bw_user")->where("id = $u_id")->find();
        if($yuan<$data["min_price"] || $yuan>$data["max_price"]){
            $this->ajax_return(308);
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
        $resu["info"]="成功购买".$num."个".$data["designation"];
        $resu["create_time"]=time();
        $resu["user_id"]=$u_id;
        $resu["num"]=$yuan;
        $resu["currency_name"]="USDT";
        switch ($data["designation"]){
            case "BTC":
                $whe["btc_num"]=bc("+",$user["btc_num"],$num);
                if($whe["btc_num"]<0){
                    $this->ajax_return(502);
                }
                break;
            case "ETH":
                $whe["eth_available_balance"]=bc("+",$user["eth_available_balance"],$num);
                $whe["eth_num"]=bc("+",$user["eth_num"],$num);
                if($whe["eth_num"]<0){
                    $this->ajax_return(502);
                }
                break;
            case "USDT":
                $whe["usdt_available_balance"]=bc("+",$user["usdt_available_balance"],$num);
                $whe["usdt_num"]=bc("+",$user["usdt_num"],$num);
                if($whe["usdt_num"]<0){
                    $this->ajax_return(502);
                }
                break;
            case "LBTH":
                $whe["lbth_available_balance"]=bc("+",$user["lbth_available_balance"],$num);
                $whe["lbth_num"]=bc("+",$user["lbth_num"],$num);
                if($whe["lbth_num"]<0){
                    $this->ajax_return(502);
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
            $this->ajax_return(0,["msg"=>"购买成功"]);
        }else{
            $this->db->rollback();
            $this->ajax_return(500);
        }

    }

    //会员出售
    public function sellAction(){
        if(!isset($this->reqdata['u_id'])){
            $this->ajax_return(200);
        }
        if(!isset($this->reqdata['phone'])){
            $this->ajax_return(3);
        }
        if(!isset($this->reqdata['num'])){
            $this->ajax_return(3);
        }
        if(!isset($this->reqdata['yuan'])){
            $this->ajax_return(3);
        }
        if(!isset($this->reqdata['id'])){
            $this->ajax_return(3);
        }
        if(!isset($this->reqdata['pname'])){
            $this->ajax_return(3);
        }
        $u_id=$this->reqdata['u_id'];
        $phone=$this->reqdata['phone'];
        $num=$this->reqdata['num'];
        $yuan=$this->reqdata['yuan'];
        $id=$this->reqdata['id'];
        $pname=$this->reqdata['pname'];
//        $u_id=7;
//        $phone=13524574521;//支付宝账号
//        $num=0.78928;//出售数量
//        $yuan=55000;//得到金额
//        $id=4130;//商家id
//        $pname="龙腾";//收款人名称
        $data=$this->db->field("*")->table("bw_merchant")->where("id = $id")->find();
        $user=$this->db->field("*")->table("bw_user")->where("id = $u_id")->find();
        if($yuan<$data["min_price"] || $yuan>$data["max_price"]){
            $this->ajax_return(308);
        }
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
                    $this->ajax_return(502);
                }
                break;
            case "ETH":
                $whe["eth_available_balance"]=bc("-",$user["eth_available_balance"],$num);
                $whe["eth_num"]=bc("-",$user["eth_num"],$num);
                if($whe["eth_num"]<0){
                    $this->ajax_return(502);
                }
                break;
            case "USDT":
                $whe["usdt_available_balance"]=bc("-",$user["usdt_available_balance"],$num);
                $whe["usdt_num"]=bc("-",$user["usdt_num"],$num);
                if($whe["usdt_num"]<0){
                    $this->ajax_return(502);
                }
                break;
            case "LBTH":
                $whe["lbth_available_balance"]=bc("-",$user["lbth_available_balance"],$num);
                $whe["lbth_num"]=bc("-",$user["lbth_num"],$num);
                if($whe["lbth_num"]<0){
                    $this->ajax_return(502);
                }
                break;
            default;
        }
        $resu["type"]="法币交易";
        $resu["info"]="成功出售".$num."个".$data["designation"];
        $resu["create_time"]=time();
        $resu["user_id"]=$u_id;
        $resu["num"]=$yuan;
        $resu["currency_name"]="USDT";
        $ids=$this->db->action($this->db->insertSql("merchant_order",$list));
        $idds=$this->db->action($this->db->updateSql("user",$whe,"id = ".$u_id));
        $ids2=$this->db->action($this->db->insertSql("user_num_log",$resu));
        if($ids && $idds && $ids2){
            $this->db->commit();
            $this->ajax_return(0,["msg"=>"出售成功"]);

        }else{
            $this->db->rollback();
            $this->ajax_return(502);
        }
    }

}





















