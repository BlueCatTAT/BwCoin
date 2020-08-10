<?php
use Yaf\Controller_Abstract;
use Yaf\Dispatcher;
use Yaf\Session;
class AdminhomeController extends Controller_Abstract
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
        if(!$this->sessions->user){
            alertText("请先登录","/admin/login");exit;
        }
    }

    public function systemAction(){
        //查询系统设置
//        $field="id,system,domain,logo,eamil,phone,icp,bottom,cause,sys_states,qrcode,qrcode1";
        $field="*";
        $data=$this->db->field($field)->table("bw_setting")->find();
        if(!empty($data["banner_img"])){
            $data["banner"]=explode(",",$data["banner_img"]);
        }
        $this->getView()->assign("data", $data);
    }

    public function newslistAction(){
        $this->getView()->assign("xxxx", "yyyy");
    }

    public function addnewsAction(){
        $this->getView()->assign("xxxx", "yyyy");
    }

    public function consoleAction(){
        $this->getView()->assign("xxxx", "yyyy");
    }

    public function authenticationAction(){
        $this->getView()->assign("xxxx", "yyyy");
    }

    public function noticeAction(){
        $this->getView()->assign("xxxx", "yyyy");
    }

    public function addnoticeAction(){
        $this->getView()->assign("xxxx", "yyyy");
    }

    public function emptyAction()
    {
        // TODO: Implement __call() method.
    }
}