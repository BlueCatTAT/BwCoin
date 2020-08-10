<?php
use Yaf\Controller_Abstract;
use Yaf\Dispatcher;
use Yaf\Session;
class AdminController extends Controller_Abstract
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
        $system = $this->db->field("*")
            ->table("bw_setting")
            ->find();
        $this->getView()->assign(["system" => $system]);
    }

    public function loginAction(){
        if($this->getRequest()->isPost()){
            Dispatcher::getInstance()->autoRender(false);
            $data['user'] = post("username");
            $data['pass'] = $this->hashkey(post("password"),self::Login_Key);
            $sql = $this->db->field("system,password")
                ->table("bw_system")
                ->where("system = ? and password = ? and is_lock = 1")
                ->getSql();
            $result = $this->db->stmtFetch($sql,[$data['user'],$data['pass']]);
            if($result){
                $datax['login_time'] = time();
                $datax['ip'] = server("REMOTE_ADDR");
                $this->db->action($this->db->updateSql("system",$datax,"system = '{$data['user']}' and password = '{$data['pass']}'"));
                $this->sessions->user = $data['user'];
                success("登录成功","/admin/index");
            }else{
                error("登录失败");
            }
        }else{
            $this->getView()->assign("xxxx", "yyyy");
        }
    }

    public function loginoutAction(){
        Dispatcher::getInstance()->autoRender(false);
        $this->sessions->del('user');
        echo json_encode(["code"=>0,"msg"=>"退出成功","data"=>null]);
    }

    public function indexAction(){
        if(!$this->sessions->user){
            alertText("请先登录","/admin/login");exit;
        }else{
            $this->getView()->assign("xxxx", "yyyy");
        }
    }

    public function passwordAction(){
        if(!$this->sessions->user){
            alertText("请先登录","/admin/login");exit;
        }else{
            if($this->getRequest()->isPost()){
                Dispatcher::getInstance()->autoRender(false);
                $oldpassword = $this->hashkey(post("oldPassword"),self::Login_Key);
                $user = $this->sessions->user;
                $result = $this->db->field("id,system,password")
                    ->table("bw_system")
                    ->where("system = '{$user}' and password = '{$oldpassword}'")
                    ->find();
                if($result){
                    $password = $this->hashkey(post("repassword"),self::Login_Key);
                    $bool = $this->db->action($this->db->updateSql("system",["password"=>$password],"id = {$result['id']}"));
                    if($bool){
                        echo json_encode(["code"=>1,"msg"=>"修改成功"]);
                    }else{
                        echo json_encode(["code"=>2,"msg"=>"修改失败"]);
                    }
                }else{
                    echo json_encode(["code"=>0,"msg"=>"原始密码错误"]);
                }
            }else{
                $this->getView()->assign("xxxx", "yyyy");
            }
        }
    }

    public function hashkey($data,$key){
        return hash_hmac("sha256",$data,$key);
    }

    public function emptyAction()
    {
        // TODO: Implement __call() method.
    }
}