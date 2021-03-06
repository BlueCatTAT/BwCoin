<?php
use Yaf\Application;
class fomoModel{
    public $db;
    public $fomo_id;
    public $fomo;

    public function __construct(){
        $this->db = new dbModel();
        $fomoinfo = $this->db->field("*")
            ->table("bw_auktion")
            ->where("status = 0")
            ->find();
        $this->fomo = $fomoinfo;
        $this->fomo_id = $fomoinfo['f_id'];
    }

    public function get_user_info($user){
        $userinfo = $this->db->field("*")
            ->table("bw_user")
            ->where("username = '{$user}'")
            ->find();
        return $userinfo;
    }

    public function get_user_info_id($id){
        $userinfo = $this->db->field("id as user_id,lbth_available_balance,usdt_available_balance,eth_available_balance,btc_available_balance")
            ->table("bw_user")
            ->where("id = {$id}")
            ->find();
        return $userinfo;
    }

    public function get_user_fomo(){
        $result = $this->db->field("*")
            ->table("bw_auktion_user")
            ->where("f_id = {$this->fomo_id}")
            ->order("price DESC")
            ->select();
        foreach($result as $k=>$v){
            $result[$k]['address'] = substr($v['address'],0,10)."....".substr($v['address'],-10,10);
        }
        return $result;
    }

    public function get_user_fomo_find($uid){
        $result = $this->db->field("*")
            ->table("bw_auktion_user")
            ->where("f_id = {$this->fomo_id}")
            ->order("price DESC")
            ->select();
        $user = [];
        foreach($result as $k=>$v){
            if($v['u_id'] == $uid){
                $user['level'] = $k+1;
                $user['price'] = $v['price'];
                break;
            }
        }
        return $user;
    }
}