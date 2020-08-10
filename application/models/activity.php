<?php
use Yaf\Application;
class activityModel{
    public $db;

    public function __construct()
    {
        $this->db = new dbModel();
    }

    public function get_youinvutation($user_id,$leavel){
        $sql = "";
        if($leavel == 1){
            $sql = "select id from bw_user where floor_id = {$user_id}";
        }else if($leavel == 2){
            $sql = "select id from bw_user where floor_id in (select id from bw_user where floor_id = {$user_id})";
        }else if($leavel == 3){
            $sql = "select id from bw_user where floor_id in (select id from bw_user where floor_id in (select id from bw_user where floor_id = {$user_id}))";
        }
        $userone = $this->db->action($sql);
        if(!empty($userone)){
            return count($userone);
        }else{
            return 0;
        }
    }

    public function get_group_user($u_id)
    {
        $sql = "SELECT * FROM bw_user WHERE group_id LIKE '%{$u_id}%'";
        $topRes = $this->db->action($sql);
        return $topRes;
    }
}