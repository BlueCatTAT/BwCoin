<?php
use Yaf\Controller_Abstract;
use Yaf\Dispatcher;
use Yaf\Session;
class AdminmercController extends Controller_Abstract
{
    const Login_Key = "MDc2OWJkYWI0ZGJiMmMxMzBjNzA3MGQ5NTU0MDVkODE=";
    public $db;
    public $sessions;
    public $yac;

    public function init()
    {
        $this->db = new dbModel();
        $this->sessions = Session::getInstance();
        $this->yac = new Yac(); //缓存
    }

    public function listAction(){
        $result = $this->db->field("*")
            ->table("bw_merc_user")
            ->select();
        $this->getView()->assign("result",$result);
    }

    public function addAction(){
        $this->getView()->assign("xxxx","yyyy");
    }

    public function addmercAction(){
        Dispatcher::getInstance()->getRequest(false);
        $data['username'] = post("username");
        $userinfo = $this->db->field("username")
            ->table("bw_merc_user")
            ->where("username = '{$data['username']}'")
            ->find();
        if($userinfo){
            echo 2;
        }else{
            $data['name'] = post("name");
            $data['password'] = $this->hashkey(post("password"),self::Login_Key);
            $data['login_time'] = time();
            $data['ip'] = $_SERVER["REMOTE_ADDR"];
            $data['rating'] = 0;
            $data['floor_id'] = 0;
            $data['group_id'] = 0;
            $data['invit'] = $this->build_merc_code();
            $bool = $this->db->action($this->db->insertSql("merc_user",$data));
            echo $bool ? 1 : 0;
        }
    }

    public function editAction(){
        $id = get("id");
        $result = $this->db->field("*")
            ->table("bw_merc_user")
            ->where("id = '{$id}'")
            ->find();
        $this->getView()->assign("result",$result);
    }

    public function editmercAction(){
        Dispatcher::getInstance()->getRequest(false);
        $username = post("username");
        if(post("password") == ""){
            $data['name'] = post("name");
            $bool = $this->db->action($this->db->updateSql("merc_user",$data,"username = '{$username}'"));
            echo $bool ? 1 : 1;
        }else{
            $data['name'] = post("name");
            $data['password'] = $this->hashkey(post("password"),self::Login_Key);
            $bool = $this->db->action($this->db->updateSql("merc_user",$data,"username = '{$username}'"));
            echo $bool ? 1 : 1;
        }
    }

    public function reward123Action(){
        if($this->getRequest()->isPost()){
            Dispatcher::getInstance()->autoRender(false);
            $data = post();
            $bool = $this->db->action($this->db->insertSql("merc_setting",$data,"id = 1"));
            echo $bool ? 1 : 1;
        }else{
            $result = $this->db->field("*")
                ->table("bw_merc_setting")
                ->find();
            $this->getView()->assign(["result"=>$result]);
        }
    }

    public function hashkey($data,$key){
        return hash_hmac("sha256",$data,$key);
    }

    public function build_merc_code(){
        $str = uniqid();
        return "B".strtoupper($str)."W";
    }

    public function emptyAction()
    {
        // TODO: Implement __call() method.
    }
}