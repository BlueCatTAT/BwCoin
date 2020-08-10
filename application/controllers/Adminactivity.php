<?php
use Yaf\Controller_Abstract;
use Yaf\Dispatcher;
use Yaf\Session;
class AdminactivityController extends Controller_Abstract
{
    public $db;
    public $sessions;
    public $yac;

    public function init()
    {
        $this->db = new dbModel();
        $this->sessions = Session::getInstance();
        $this->yac = new Yac(); //缓存
    }

    //投票上币
    public function voteAction(){
//        $a=chr(98);
////        echo strtolower($a);
//        echo $a;
//        exit;
//        //引入分页
//        include APP_PATH."/application/core/Page.php";
//        $page = new \app\core\Page();
//        $p=get("page");
//        $p=$p ? $p : 1;
//        $limit = 2;
//        $pagesize=$p-1;
//        $start = $pagesize * $limit;
//        $result=$this->db->field("m.*,a.type as name,b.type as x_name")->table("bw_activity as m")->join("bw_currency as a","m.currency_id = a.id")->join("bw_currency as b","m.x_currency_id = b.id")->order("id desc")->limit($start,$limit)->select();
////        echo "<pre>";
////        print_r($result);
////        exit;
//        //获取总数
//        $count=$this->db->field("m.*,a.type as name,b.type as x_name")->table("bw_activity as m")->join("bw_currency as a","m.currency_id = a.id")->join("bw_currency as b","m.x_currency_id = b.id")->order("id desc")->getSql();
//        $len=$this->db->count($count);
//        $page->init($len,$limit);
//        $showstr = $page->show();
//        foreach ($result as $k=>$v){
//            $result[$k]["least"]=floatval($v["least"]);
//            $result[$k]["maximum"]=floatval($v["maximum"]);
//            $result[$k]["consume_number"]=floatval($v["consume_number"]);
//            $result[$k]["support"]=floatval($v["support"]);
//            $result[$k]["oppose"]=floatval($v["oppose"]);
//            $result[$k]["ctime"]=date("Y-m-d H:i:s",$v["ctime"]);
//        }
//        $data["list"]=$result;
//        $data["show"]=$showstr;//渲染分页
        $this->getView()->assign("xxxx", "yyyy");
    }

    //添加投币规则
    public function addvoteAction(){
        $data=$this->db->field("*")->table("bw_currency")->order("id")->select();
        $this->getView()->assign("data", $data);
    }

    //修改投币规则
    public function editvoteAction(){
        $id=get("id");
        $page=get("page");
        $data=$this->db->field("*")->table("bw_currency")->order("id")->select();
        $arrdata=$this->db->field("*")->table("bw_activity")->where("id = ".$id)->find();
        $result["data"]=$data;
        $result["arrdata"]=$arrdata;
        $result["page"]=$page;
        $this->getView()->assign("result", $result);
    }

    //添加投币列表
    public function votelistAction(){
        $this->getView()->assign("xxxx", "yyyy");
    }

    //添加理财规则
    public function cbsxAction(){
        $result = $this->db->field("*")
            ->table("bw_cbsx")
            ->select();
        $this->getView()->assign(["result"=>$result]);
    }

    public function addcbsxAction(){
        if($this->getRequest()->isPost()){
            Dispatcher::getInstance()->autoRender(false);
            $data = post();
            $data['period'] = str_replace("-","",$data['period']);
            $data['start_time'] = strtotime($data['start_time']);
            $data['end_time'] = strtotime($data['end_time']);
            $bool = $this->db->action($this->db->insertSql("cbsx",$data));
            echo $bool ? 1 : 0;
        }else{
            $currency = $this->db->field("*")
                ->table("bw_currency")
                ->select();
            $this->getView()->assign(["currency"=>$currency]);
        }
    }

    public function editcbsxAction(){
        if($this->getRequest()->isPost()){
            Dispatcher::getInstance()->autoRender(false);
            $id = post("id");
            $data = post();
            unset($data['id']);
            $data['period'] = str_replace("-","",$data['period']);
            $data['start_time'] = strtotime($data['start_time']);
            $data['end_time'] = strtotime($data['end_time']);
            $bool = $this->db->action($this->db->updateSql("cbsx",$data,"id = {$id}"));
            echo $bool ? 1 : 1;
        }else{
            $id = get("id");
            $currency = $this->db->field("*")
                ->table("bw_currency")
                ->select();
            $result = $this->db->field("*")
                ->table("bw_cbsx")
                ->where("id = {$id}")
                ->find();
            $result['period'] = substr($result['period'],0,4)."-".substr($result['period'],4,2)."-".substr($result['period'],6,2);
            $result['start_time'] = date("Y-m-d",$result['start_time']);
            $result['end_time'] =  date("Y-m-d",$result['end_time']);
            $this->getView()->assign(["currency"=>$currency,"result"=>$result]);
        }
    }

    //理财列表
    public function cbsxlistAction(){
        $this->getView()->assign("xxxx", "yyyy");
    }

    //新币预售规则
    public function xbysAction(){
        $result = $this->db->field("*")
            ->table("bw_xbys")
            ->select();
        $this->getView()->assign("result", $result);
    }

    public function addxbysAction(){
        if($this->getRequest()->isPost()){
            Dispatcher::getInstance()->autoRender(false);
            $data = $_POST;
            $data['start_time'] = strtotime($_POST['start_time']);
            $data['end_time'] = strtotime($_POST['start_time']) + ($_POST['cycle'] * 24 * 60 * 60);
            $data['create_time'] = time();
            //echo $this->db->insertSql("xbys",$data);exit;
            $bool = $this->db->action($this->db->insertSql("xbys",$data));
            echo $bool ? 1 : 0;
        }else{
            $currency = $this->db->field("*")
                ->table("bw_currency")
                ->select();
            $this->getView()->assign(["currency"=>$currency]);
        }
    }

    public function editxbysAction(){
        if($this->getRequest()->isPost()){
            Dispatcher::getInstance()->autoRender(false);
            $id = post("id");
            $data = post();
            unset($data['id']);
            $data['start_time'] = strtotime($data['start_time']);
            $data['end_time'] = strtotime($data['end_time']);
            $bool = $this->db->action($this->db->updateSql("xbys",$data,"id = {$id}"));
            echo $bool ? 1 : 1;
        }else{
            $id = get("id");
            $currency = $this->db->field("*")
                ->table("bw_currency")
                ->select();
            $result = $this->db->field("*")
                ->table("bw_xbys")
                ->where("id = {$id}")
                ->find();
            $result['start_time'] = date("Y-m-d",$result['start_time']);
            $result['end_time'] =  date("Y-m-d",$result['end_time']);
            $this->getView()->assign(["currency"=>$currency,"result"=>$result]);
        }
    }
    //新币预售列表
    public function xbyslistAction(){
        $this->getView()->assign("xxxx", "yyyy");
    }

    public function fomoAction(){
        $result = $this->db->field("*")
            ->table("bw_auktion")
            ->select();
        $this->getView()->assign("result", $result);
    }

    public function fomolistAction(){
        $result = $this->db->field("*")
            ->table("bw_auktion_user")
            ->select();
        $this->getView()->assign("result", $result);
    }

    public function addfomoAction(){
        if($this->getRequest()->isPost()){
            $data = post();
            $data['start_time'] = strtotime($_POST['start_time']);
            $data['end_time'] = strtotime($_POST['end_time']);
            $bool = $this->db->action($this->db->insertSql("auktion",$data));
            echo $bool ? 1 : 0;
        }else{
            $this->getView()->assign("xxx", "yyy");
        }
    }

    public function editfomoAction(){
        if($this->getRequest()->isPost()){
            $data = post();
            $f_id = post("f_id");
            unset($data['f_id']);
            $data['start_time'] = strtotime($_POST['start_time']);
            $data['end_time'] = strtotime($_POST['end_time']);
            $bool = $this->db->action($this->db->updateSql("auktion",$data,"f_id = {$f_id}"));
            echo $bool ? 1 : 1;
        }else{
            $id = get("id");
            $result = $this->db->field("*")
                ->table("bw_auktion")
                ->where("id = {$id}")
                ->find();
            $result['start_time'] = date("Y-m-d",$result['start_time']);
            $result['end_time'] =  date("Y-m-d",$result['end_time']);
            $this->getView()->assign("result",$result);
        }
    }

    public function emptyAction()
    {
        // TODO: Implement __call() method.
    }
}