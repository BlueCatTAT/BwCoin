<?php
use Yaf\Controller_Abstract;
use Yaf\Dispatcher;
use Yaf\Session;
class AdminwapController extends Controller_Abstract
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

    public function iconAction(){
        $result = $this->db->field("*")
            ->table("bw_wap_icon")
            ->select();
        $this->getView()->assign("result",$result);
    }

    public function addAction(){
        if($this->getRequest()->isPost()){
            Dispatcher::getInstance()->autoRender(false);
            $data['title'] = post("title");
            $data['icon'] = post("icon");
            $data['path'] = post("path");
            $bool = $this->db->action($this->db->insertSql("wap_icon",$data));
            echo $bool ? 1 : 0 ;
        }else{
            $this->getView()->assign("xxxx","yyyy");
        }
    }

    public function editAction(){
        if($this->getRequest()->isPost()){
            Dispatcher::getInstance()->autoRender(false);
            $id = post("id");
            if(post("icon") == ""){
                $data['title'] = post("title");
                $data['path'] = post("path");
            }else{
                $data['title'] = post("title");
                $data['icon'] = post("icon");
                $data['path'] = post("path");
            }
            $bool = $this->db->action($this->db->updateSql("wap_icon",$data,"id = {$id}"));
            echo $bool ? 1 : 1 ;
        }else{
            $id = get("id");
            $result = $this->db->field("*")
                ->table("bw_wap_icon")
                ->where("id = {$id}")
                ->find();
            $this->getView()->assign("result",$result);
        }
    }

    public function bannerAction(){
        $result = $this->db->field("*")
            ->table("bw_wap_banner")
            ->select();
        $this->getView()->assign("result",$result);
    }

    public function addbannerAction(){
        if($this->getRequest()->isPost()){
            Dispatcher::getInstance()->autoRender(false);
            $data['pic'] = post("pic");
            $data['status'] = post("status");
            $bool = $this->db->action($this->db->insertSql("wap_banner",$data));
            echo $bool ? 1 : 0 ;
        }else{
            $this->getView()->assign("xxxx","yyyy");
        }
    }

    public function clueAction(){
        $clue = $this->db->field("*")
            ->table("bw_wap_clue")
            ->select();
        $this->getView()->assign("result",$clue);
    }

    public function addclueAction(){
        if($this->getRequest()->isPost()){
            Dispatcher::getInstance()->autoRender(false);
            $data['title'] = post("title");
            $data['content'] = htmlspecialchars(post("content"));
            $data['create_time'] = time();
            $bool = $this->db->action($this->db->insertSql("wap_clue",$data));
            echo $bool ? 1 : 0 ;
        }else{
            $this->getView()->assign("xxxx","yyyy");
        }
    }

    public function feedbackAction(){
        $result = $this->db->field("*")
            ->table("bw_user_feedback")
            ->select();
        $this->getView()->assign("result",$result);
    }

    public function emptyAction()
    {
        // TODO: Implement __call() method.
    }
}