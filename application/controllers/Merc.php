<?php
use Yaf\Controller_Abstract;
use Yaf\Dispatcher;
use Yaf\Session;
class MercController extends Controller_Abstract
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

    public function indexAction(){
        if(!$this->sessions->merc){
            alertText("请先登录","/merc/login");exit;
        }else{
            $this->getView()->assign("xxxx", "yyyy");
        }
    }

    public function loginAction(){
        if($this->getRequest()->isPost()){
            Dispatcher::getInstance()->autoRender(false);
            $data['user'] = post("username");
            $data['pass'] = $this->hashkey(post("password"),self::Login_Key);
            $sql = $this->db->field("username,password")
                ->table("bw_merc_user")
                ->where("username = ? and password = ?")
                ->getSql();
            $result = $this->db->stmtFetch($sql,[$data['user'],$data['pass']]);
            if($result){
                $datax['login_time'] = time();
                $datax['ip'] = server("REMOTE_ADDR");
                $this->db->action($this->db->updateSql("merc_user",$datax,"username = '{$data['user']}' and password = '{$data['pass']}'"));
                $this->sessions->merc = $data['user'];
                success("登录成功","/merc/index");
            }else{
                error("登录失败");
            }
        }else{
            $this->getView()->assign("xxxx", "yyyy");
        }
    }

    public function loginoutAction(){
        Dispatcher::getInstance()->autoRender(false);
        $this->sessions->del('merc');
        echo json_encode(["code"=>0,"msg"=>"退出成功","data"=>null]);
    }

    public function passwordAction(){
        if(!$this->sessions->merc){
            alertText("请先登录","/merc/login");exit;
        }else{
            if($this->getRequest()->isPost()){
                Dispatcher::getInstance()->autoRender(false);
                $oldpassword = $this->hashkey(post("oldPassword"),self::Login_Key);
                $user = $this->sessions->merc;
                $result = $this->db->field("id,username,password")
                    ->table("bw_merc_user")
                    ->where("username = '{$user}' and password = '{$oldpassword}'")
                    ->find();
                if($result){
                    $password = $this->hashkey(post("repassword"),self::Login_Key);
                    $bool = $this->db->action($this->db->updateSql("merc_user",["password"=>$password],"id = {$result['id']}"));
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

    public function addAction(){
        $user = $this->sessions->merc;
        if($this->getRequest()->isPost()){
            Dispatcher::getInstance()->autoRender(false);
            $data['username'] = post("username");
            $is_user = $this->db->field("id,group_id")->table('bw_merc_user')->where("username = '{$data['username']}'")->find();
            if($is_user){
                echo 2;
            }else{
                $data['name'] = post("name");
                $data['password'] = $this->hashkey(post("password"),self::Login_Key);
                $data['rating'] = post("rating");
                $floor_id = post("floor_id");
                $user = $this->db->field("id,group_id")->table('bw_merc_user')->where("username = '{$floor_id}'")->find();
                $data['ip'] = $_SERVER["REMOTE_ADDR"];
                $data['floor_id'] = $user['id'];
                $data['group_id'] = $user['group_id'].",".$user['id'];
                $data['invit'] = $this->build_merc_code();
                $bool = $this->db->action($this->db->insertSql("merc_user",$data));
                echo $bool ? 1 : 0 ;
            }
        }else{
            $result = $this->db->field("*")
                ->table("bw_merc_user")
                ->where("username = '{$user}'")
                ->find();
            $rating = $result['rating'];
            $this->getView()->assign("rating",$rating);
        }
    }

    public function isratingAction(){
        Dispatcher::getInstance()->autoRender(false);
        $data = post("tag") - 1;
        $admin = $this->sessions->merc;
        $user = $this->db->field("*")->table('bw_merc_user')->where("username = '{$admin}'")->find();
        $sql = "SELECT * FROM (SELECT * FROM bw_merc_user WHERE group_id LIKE '%{$user['id']}%') as A WHERE rating = {$data}";
        $result = $this->db->action($sql);
        if($result){
            $user = [];
            foreach($result as $k=>$v){
                $user[$k] = $v['username'];
            }
            echo json_encode(["res"=>$user]);
        }else{
            echo json_encode(["res"=>[$admin]]);
        }
    }

    public function listAction(){
        if(!$this->sessions->merc){
            alertText("请先登录","/admin/login");exit;
        }else{
            $username = $this->sessions->merc;
            $user = $this->db->field("*")->table('bw_merc_user')->where("username = '{$username}'")->find();
            $where = "group_id LIKE '%{$user['id']}%'";
            $result = $this->db->field("*")->table('bw_merc_user')->where($where)->select();
            $coinlist = $this->db->field("*")->table("bw_currency")->where('status = 1')->select();
            $execl = "";
            $usertotal = 0;
            foreach ($result as $k=>$v){
                $where2 = "group_id LIKE '%{$v['id']}%'";
                $usercopy = $this->db->field("*")->table("bw_merc_user_copy")->where($where2)->select();
                $usertotal += count($usercopy);
                if($usercopy){
                    $total_deposit = 0;
                    $total_withdrawal = 0;
                    $deposit = 0;
                    $withdraw = 0;
                    foreach($usercopy as $k1=>$v1){
                        $total_deposit += $v1['total_deposit'];
                        $total_withdrawal += $v1['total_withdrawal'];
                        $deposit += $v1['usdt_deposit'];
                        $withdraw += $v1['usdt_withdraw'];
                    }
                    $result[$k]['total_deposit'] = $total_deposit;
                    $result[$k]['total_withdrawal'] = $total_withdrawal;
                    $result[$k]['deposit'] = $deposit;
                    $result[$k]['withdraw'] = $withdraw;
                    $result[$k]['net_price'] = $total_deposit - $total_withdrawal;
                    $result[$k]['net_deposit'] = $deposit - $withdraw;
                }
                $execl .=  $v['id'].",";
            }
            $this->getView()->assign([
                "execl"=>substr($execl,0,-1),
                "merctotal"=>count($result),
                "usertotal"=>$usertotal,
                "coinlist"=>$coinlist,
                "result"=>$result
            ]);
        }
    }

    public function userAction(){
        if(!$this->sessions->merc){
            alertText("请先登录","/admin/login");exit;
        }else{
            $username = $this->sessions->merc;
            $user = $this->db->field("*")->table('bw_merc_user')->where("username = '{$username}'")->find();
            $where = "group_id LIKE '%{$user['id']}%'";
            $result = $this->db->field("*")->table('bw_merc_user_copy')->where($where)->select();
            $coinlist = $this->db->field("*")->table("bw_currency")->where('status = 1')->select();
            $execl = "";
            foreach ($result as $k=>$v){
                $execl .=  $v['id'].",";
            }
            $this->getView()->assign([
                "execl"=>substr($execl,0,-1),
                "coinlist"=>$coinlist,
                "result"=>$result
            ]);
        }
    }

    public function logAction(){
        if(!$this->sessions->merc){
            alertText("请先登录","/admin/login");exit;
        }else{
            $username = $this->sessions->merc;
            $user = $this->db->field("*")->table('bw_merc_user')->where("username = '{$username}'")->find();
            $where = "group_id LIKE '%{$user['id']}%'";
            $result = $this->db->field("*")->table('bw_merc_user_log')->select();
            $coinlist = $this->db->field("*")->table("bw_currency")->where('status = 1')->select();
            $this->getView()->assign([
                "coinlist"=>$coinlist,
                "result"=>$result
            ]);
        }
    }

    public function sendexcelAction(){
        $data = get("data");
        $type = get("tag");
        $title = "";
        $newArr = [];
        if($type == 1){
            $title = ["ID","用户账号","姓名","代理商","总入金","总出金","充币","提币","净入金","净充币","亏盈"];
            $arrData = $this->db->field("*")->table('bw_merc_user')->where("id in({$data})")->select();
            foreach($arrData as $k=>$v){
                $newArr[$k]['ID'] = $v['id'];
                $newArr[$k]['用户账号'] = $v['username'];
                $newArr[$k]['姓名'] = $v['name'];
                $newArr[$k]['代理商'] = $v['rating']."级代理商";
                $newArr[$k]['总入金'] = $v['total_deposit'];
                $newArr[$k]['总出金'] = $v['total_withdrawal'];
                $newArr[$k]['充币'] = $v['deposit'];
                $newArr[$k]['提币'] = $v['withdraw'];
                $newArr[$k]['净入金'] = $v['net_price'];
                $newArr[$k]['净充币'] = $v['net_deposit'];
                $newArr[$k]['亏盈'] = $v['loss'];
            }
        }else{
            $title = ["ID","代理商账号","代理商名称","总入金","总出金","充币","提币","申购总额","交易总额","交易盈亏","总交易手续费"];
            $arrData = $this->db->field("*")->table('bw_merc_user_copy')->where("id in({$data})")->select();
            foreach($arrData as $k=>$v){
                $newArr[$k]['ID'] = $v['id'];
                $newArr[$k]['代理商账号'] = $v['m_username'];
                $newArr[$k]['代理商名称'] = $v['m_name'];
                $newArr[$k]['总入金'] = $v['total_deposit'];
                $newArr[$k]['总出金'] = $v['total_withdrawal'];
                $newArr[$k]['充币'] = $v['deposit'];
                $newArr[$k]['提币'] = $v['withdraw'];
                $newArr[$k]['申购总额'] = $v['subscription_total'];
                $newArr[$k]['交易总额'] = $v['total_transaction'];
                $newArr[$k]['交易盈亏'] = $v['trading_loss'];
                $newArr[$k]['总交易手续费'] = $v['total_handling_fee'];
            }
        }
        include APP_PATH."/application/core/Phpecel2.php";
        $ecel = new \app\core\Phpecel2();
        $ecelobj = $ecel->importDataForObj($newArr,$title);
        $time = date("YmdHis");
        $ecel->download($ecelobj,$time);
        exit;
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