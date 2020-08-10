<?php

use Yaf\Controller_Abstract;
use Yaf\Dispatcher;
use Yaf\Session;

class AjaxController extends Controller_Abstract
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
        Dispatcher::getInstance()->autoRender(false);
    }

    public function ajax_render($data, $count = 20, $msg = "success")
    {
        $res['code'] = 0;
        $res['msg'] = $msg;
        $res['count'] = $count;
        $res['data'] = $data;
        echo json_encode($res, 320);
    }

    //新闻列表
    public function newslistAction()
    {
        $result = $this->db->field("*")
            ->table("bw_news")
            ->select();
        if ($result) {
            $this->ajax_render($result);
        } else {
            $this->ajax_render([]);
        }
    }

    public function noticelistAction(){
        $result = $this->db->field("*")
            ->table("bw_notice")
            ->select();
        if ($result) {
            $this->ajax_render($result);
        } else {
            $this->ajax_render([]);
        }
    }

    //添加新闻
    public function addnewsAction()
    {
        if ($this->getRequest()->isPost()) {
            Dispatcher::getInstance()->autoRender(false);
            $data['type'] = post("type");
            $data['title'] = post("title");
            $data['content'] = htmlspecialchars(post("content"));
            $data['create_time'] = time();
            $bool = $this->db->action($this->db->insertSql("news", $data));
            echo $bool ? 1 : 0;
        } else {
            $this->getView()->assign("xxx", "yyy");
        }
    }

    public function addnoticeAction()
    {
        if ($this->getRequest()->isPost()) {
            Dispatcher::getInstance()->autoRender(false);
            $data['title'] = post("title");
            $data['content'] = htmlspecialchars(post("content"));
            $bool = $this->db->action($this->db->insertSql("notice", $data));
            echo $bool ? 1 : 0;
        } else {
            $this->getView()->assign("xxx", "yyy");
        }
    }

    //系统设置
    public function editsystemAction()
    {
        if ($this->getRequest()->isPost()) {
            $data["id"] = post("id");//名称
            $data["system"] = post("system");//名称
            $data["domain"] = post("domain");//域名
            $data["logo"] = post("logo");
            $data["applogo"] = post("applogo");
            $data["qrcode"] = post("qrcode");
            $data["qrcode1"] = post("qrcode1");
            $data["eamil"] = post("eamil");//邮箱
            $data["phone"] = post("phone");//电话
            $data["friend"] = post("friend");//友情链接名称
            $data["friend_url"] = post("friend_url");//友情链接URL
            $data["icp"] = post("icp");//ICP证书
            $data["bottom"] = post("bottom");//底部信息
            $data["sys_states"] = post("sys_states");//状态
            $data["cause"] = post("cause");//升级原因
            $banner_img = post("banner_img");//banner多图
            $data["banner_img"] = implode(",", $banner_img);//banner多图转换为字符串
            $map = "id = " . $data["id"];
            if (empty($data["id"])) {//判断是增加还是修改
                $bool = $this->db->action($this->db->insertSql("setting", $data));
            } else {
                $bool = $this->db->action($this->db->updateSql("setting", $data, $map));

            }
            echo 1;
//            echo $bool ? 1 : 1;
        }
    }

    //添加币种
    public function addcurrencyAction()
    {
        $data['type'] = $_POST['type'];
        $data['status'] = isset($_POST['status']) ? 1 : 0;
        $result = $this->db->field("*")
            ->table("bw_currency")
            ->where("type = '{$data['type']}'")
            ->find();
        if ($result) {
            echo 2;
        } else {
            $bool = $this->db->action($this->db->insertSql("currency", $data));
            echo $bool ? 1 : 0;
        }
    }

    //修改币种
    public function editcurrencyAction()
    {
        $id = post("id");
        $data['type'] = $_POST['type'];
        $data['status'] = isset($_POST['status']) ? 1 : 0;
        if ($_POST['icon']) {
            $data['icon'] = $_POST['icon'];
            $bool = $this->db->action($this->db->updateSql("currency", $data, "id = {$id}"));
            echo $bool ? 1 : 1;
        } else {
            $bool = $this->db->action($this->db->updateSql("currency", $data, "id = {$id}"));
            echo $bool ? 1 : 1;
        }
    }

    //开关币种
    public function isswitchAction()
    {
        $m_id = post("id");
        $status = (post("status") == "ON") ? 0 : 1;
        $bool = $this->db->action($this->db->updateSql("currency", ["status" => $status], "id = {$m_id}"));
        echo $bool ? 1 : 0;
    }

    //通用删除方法
    public function delAction()
    {
        $table = post("table");
        $id = post("id");
        $sql = "DELETE FROM bw_{$table} WHERE ID = {$id}";
        $bool = $this->db->action($sql);
        echo $bool ? 1 : 0;
    }

    //通用列表方法
    public function listAction()
    {
        error_reporting(0);
        $page = get("page");
        $page = $page ? $page : 1;
        $limit = get("limit");
        $start = ($page - 1) * $limit;
        $table = get("table");//多表用","分开
        $on = get("on") ?? "";//join连接条件,用","分开
        $field = get("field") ?? "";//字段
        $map = get("condition") ?? "";//查询条件
        $operation = get("operation") ?? "";//查询条件
        $inner = get("inner") ?? "";//join 连接方式
        $cou = strstr($table, ",");
        if (!empty($map)) {//判断是否有条件查询
            $malist = explode(",", $map);
            $oplist = explode(",", $operation);
            $stlen = "";
            foreach ($malist as $k => $v) {//拼接where条件
                $rd = strstr($v, ".");
                $resu = "";
                if ($rd) {//判断是否有别名设置
                    $st = substr($v, strpos($v, '.') + 1);
                    $resu = trim(get($st));
                } else {
                    $resu = trim(get($v));
                }
                if (!empty($resu)) {
                    if(is_numeric($resu)){
                        $stlen .= "$v $oplist[$k] $resu " . "and ";
                    }else{
                        $resu = "'".$resu."'";
                        $stlen .= "$v $oplist[$k] $resu " . "and ";
                    }
                }
            }
            $map = $stlen ? substr($stlen, 0, -4) : null;
        }
        if ($cou) {//判断是否是连接表的数据
            $data = explode(",", $table);//将表转换为数组
            $arrdata = explode(",", $on);//将连接条件转换为数组
            $str = 'bw_' . $data[0] . ' as a';
            unset($data[0]);
            $data = array_values($data);
            $str1 = "";
            $str2 = "";
            $num = 98;
            foreach ($data as $k => $v) {//循环拼接join连接条件
                $b = chr($num);
                $tab = "bw_" . $v;
//                $str1.='"'.$tab.' as '.$b.'","'.$arrdata[$k].'"|';
//                $str1.='"'.$tab.' as '.$b.'"'.",".'"'.$arrdata[$k].'"'."|";
                $str1 .= "$tab as $b" . '|';
                $str2 .= "$arrdata[$k]" . '|';
                $num++;
            }
            $str1 = substr($str1, 0, -1);//去掉字符串最后的一个字符
            $str2 = substr($str2, 0, -1);
            $relist = explode("|", $str1);
            $relist1 = explode("|", $str2);
            $coun = count($relist);
            if (empty($inner)) {
                switch ($coun) {//判断join连接数,拼接sql语句
                    case 1:
                        $result = $this->db->field($field)->table($str)->join($relist[0], $relist1[0])->where($map)->order("a.id desc")->limit($start, $limit)->select();
                        $sql = $this->db->field($field)->table($str)->join($relist[0], $relist1[0])->where($map)->order("a.id desc")->getSql();
                        break;
                    case 2:
                        $result = $this->db->field($field)->table($str)->join($relist[0], $relist1[0])->join($relist[1], $relist1[1])->where($map)->order("a.id desc")->limit($start, $limit)->select();
                        $sql = $this->db->field($field)->table($str)->join($relist[0], $relist1[0])->join($relist[1], $relist1[1])->where($map)->order("a.id desc")->getSql();
                        break;
                    case 3:
                        $result = $this->db->field($field)->table($str)->join($relist[0], $relist1[0])->join($relist[1], $relist1[1])->join($relist[2], $relist1[2])->where($map)->order("a.id desc")->limit($start, $limit)->select();
                        $sql = $this->db->field($field)->table($str)->join($relist[0], $relist1[0])->join($relist[1], $relist1[1])->join($relist[2], $relist1[2])->where($map)->order("a.id desc")->getSql();
                        break;
                    case 4:
                        $result = $this->db->field($field)->table($str)->join($relist[0], $relist1[0])->join($relist[1], $relist1[1])->join($relist[2], $relist1[2])->join($relist[3], $relist1[3])->where($map)->order("a.id desc")->limit($start, $limit)->select();
                        $sql = $this->db->field($field)->table($str)->join($relist[0], $relist1[0])->join($relist[1], $relist1[1])->join($relist[2], $relist1[2])->join($relist[3], $relist1[3])->where($map)->order("a.id desc")->getSql();
                        break;
                    case 5:
                        $result = $this->db->field($field)->table($str)->join($relist[0], $relist1[0])->join($relist[1], $relist1[1])->join($relist[2], $relist1[2])->join($relist[3], $relist1[3])->join($relist[4], $relist1[4])->where($map)->order("a.id desc")->limit($start, $limit)->select();
                        $sql = $this->db->field($field)->table($str)->join($relist[0], $relist1[0])->join($relist[1], $relist1[1])->join($relist[2], $relist1[2])->join($relist[3], $relist1[3])->join($relist[4], $relist1[4])->where($map)->order("a.id desc")->getSql();
                        break;
                    case 6:
                        $result = $this->db->field($field)->table($str)->join($relist[0], $relist1[0])->join($relist[1], $relist1[1])->join($relist[2], $relist1[2])->join($relist[3], $relist1[3])->join($relist[4], $relist1[4])->join($relist[5], $relist1[5])->where($map)->order("a.id desc")->limit($start, $limit)->select();
                        $sql = $this->db->field($field)->table($str)->join($relist[0], $relist1[0])->join($relist[1], $relist1[1])->join($relist[2], $relist1[2])->join($relist[3], $relist1[3])->join($relist[4], $relist1[4])->join($relist[5], $relist1[5])->where($map)->order("a.id desc")->getSql();
                        break;
                    default;
                }
            } else {
                $inner = explode(",", $inner);
                switch ($coun) {//判断join连接数,拼接sql语句
                    case 1:
                        $result = $this->db->field($field)->table($str)->joinlink($inner[0], $relist[0], $relist1[0])->where($map)->order("a.id desc")->limit($start, $limit)->select();
                        $sql = $this->db->field($field)->table($str)->joinlink($inner[0], $relist[0], $relist1[0])->where($map)->order("a.id desc")->getSql();
                        break;
                    case 2:
                        $result = $this->db->field($field)->table($str)->joinlink($inner[0], $relist[0], $relist1[0])->joinlink($inner[1], $relist[1], $relist1[1])->where($map)->order("a.id desc")->limit($start, $limit)->select();
                        $sql = $this->db->field($field)->table($str)->joinlink($inner[0], $relist[0], $relist1[0])->joinlink($inner[1], $relist[1], $relist1[1])->where($map)->order("a.id desc")->getSql();
                        break;
                    case 3:
                        $result = $this->db->field($field)->table($str)->joinlink($inner[0], $relist[0], $relist1[0])->joinlink($inner[1], $relist[1], $relist1[1])->joinlink($inner[2], $relist[2], $relist1[2])->where($map)->order("a.id desc")->limit($start, $limit)->select();
                        $sql = $this->db->field($field)->table($str)->joinlink($inner[0], $relist[0], $relist1[0])->joinlink($inner[1], $relist[1], $relist1[1])->joinlink($inner[2], $relist[2], $relist1[2])->where($map)->order("a.id desc")->getSql();
                        break;
                    case 4:
                        $result = $this->db->field($field)->table($str)->joinlink($inner[0], $relist[0], $relist1[0])->joinlink($inner[1], $relist[1], $relist1[1])->joinlink($inner[2], $relist[2], $relist1[2])->joinlink($inner[3], $relist[3], $relist1[3])->where($map)->order("a.id desc")->limit($start, $limit)->select();
                        $sql = $this->db->field($field)->table($str)->joinlink($inner[0], $relist[0], $relist1[0])->joinlink($inner[1], $relist[1], $relist1[1])->joinlink($inner[2], $relist[2], $relist1[2])->joinlink($inner[3], $relist[3], $relist1[3])->where($map)->order("a.id desc")->getSql();
                        break;
                    case 5:
                        $result = $this->db->field($field)->table($str)->joinlink($inner[0], $relist[0], $relist1[0])->joinlink($inner[1], $relist[1], $relist1[1])->joinlink($inner[2], $relist[2], $relist1[2])->joinlink($inner[3], $relist[3], $relist1[3])->joinlink($inner[4], $relist[4], $relist1[4])->where($map)->order("a.id desc")->limit($start, $limit)->select();
                        $sql = $this->db->field($field)->table($str)->joinlink($inner[0], $relist[0], $relist1[0])->joinlink($inner[1], $relist[1], $relist1[1])->joinlink($inner[2], $relist[2], $relist1[2])->joinlink($inner[3], $relist[3], $relist1[3])->joinlink($inner[4], $relist[4], $relist1[4])->where($map)->order("a.id desc")->getSql();
                        break;
                    case 6:
                        $result = $this->db->field($field)->table($str)->joinlink($inner[0], $relist[0], $relist1[0])->joinlink($inner[1], $relist[1], $relist1[1])->joinlink($inner[2], $relist[2], $relist1[2])->joinlink($inner[3], $relist[3], $relist1[3])->joinlink($inner[4], $relist[4], $relist1[4])->joinlink($inner[5], $relist[5], $relist1[5])->where($map)->order("a.id desc")->limit($start, $limit)->select();
                        $sql = $this->db->field($field)->table($str)->joinlink($inner[0], $relist[0], $relist1[0])->joinlink($inner[1], $relist[1], $relist1[1])->joinlink($inner[2], $relist[2], $relist1[2])->joinlink($inner[3], $relist[3], $relist1[3])->joinlink($inner[4], $relist[4], $relist1[4])->joinlink($inner[5], $relist[5], $relist1[5])->where($map)->order("a.id desc")->getSql();
                        break;
                    default;
                }
            }
            $counts = $this->db->count($sql);//查询总条数
        } else {
            $tablename = "bw_" . $table;
            //求长度
            $counts = $this->db->zscount($table,"*","total",$map);
            //当页数据
            $result = $this->db->field("*")
                ->table($tablename)
                ->where($map)
                ->limit($start, $limit)
                ->select();
        }
        if ($result) {
            $this->ajax_render($result, $counts);
        } else {
            $this->ajax_render([], 0);
        }
    }

    //通用列表方法
    public function listAction1()
    {
        $page = get("page");
        $limit = get("limit");
        $start = ($page - 1) * $limit;
        $table = get("table");
        $tablename = "bw_" . $table;
        //求长度
        $counts = $this->db->zscount($table);
        //当页数据
        $result = $this->db->field("*")
            ->table($tablename)
            ->limit($start, $limit)
            ->select();
        if ($result) {
            $this->ajax_render($result, $counts);
        } else {
            $this->ajax_render([], 0);
        }
    }

    public function depositcheckAction(){
        $type = post("type");
        $id = post("id");
        $result = $this->db->field("*")
            ->table("bw_deposit")
            ->where("id = {$id}")
            ->find();
        if($type == 'success'){
            $coin_type = strtolower($result['currency']);
            $this->db->beginTransaction();
            $num = $coin_type."_num";
            $available_balance = $coin_type."_available_balance";
            $u_id = $result['u_id'];
            $token_num = $result['token_num'];
            $sql = "UPDATE bw_user SET {$available_balance} = {$available_balance} + {$token_num},{$num} = {$num} + {$token_num} WHERE id = {$u_id}";
            $bool1 = $this->db->action($sql);
            $data['type'] = "余额充值";
            $data['create_time'] = time();
            $data['info'] = "成功{$token_num}".strtoupper($coin_type);
            $data['user_id'] = $u_id;
            $data['num'] = $token_num;
            $data['currency_name'] = strtoupper($coin_type);
            $bool2 = $this->db->action($this->db->insertSql("user_num_log",$data));
            $bool3 = $this->db->action($this->db->updateSql("deposit",["status"=>1],"id = {$id}"));
            if ($bool1 && $bool2 && $bool3) {
                $this->db->commit();
                echo 1;
            } else {
                $this->db->rollback();
                echo 0;
            }
        }else{
            $info = post("info");
            $bool = $this->db->action($this->db->updateSql("deposit",["status"=>3,"info"=>$info],"id = {$id}"));
            echo $bool ? 1 : 0;
        }
    }

    public function inlistAction(){
        $page = get("page");
        $limit = get("limit");
        $start = ($page - 1) * $limit;
        $table = get("table");
        $tablename = "bw_" . $table;
        //求长度
        $counts = $this->db->zscount($table);
        //当页数据
        $result = $this->db->field("*")
            ->table($tablename)
            ->limit($start, $limit)
            ->select();
        if ($result) {
            $this->ajax_render($result, $counts);
        } else {
            $this->ajax_render([], 0);
        }
    }

    //状态修改
    public function isstateAction()
    {
        if ($this->getRequest()->isPost()) {
            $id = post("id");
            $table = post("table");//表名
            $status = post("status");//状态：OFF或ON
            $data["status"] = $status == "OFF" ? 1 : 0;
            $whe = "id = " . $id;
            $ids = $this->db->action($this->db->updateSql($table, $data, $whe));
            echo $ids ? 1 : 0;
        }
    }

    //充值列表
    public function depositAction()
    {
        $result = $this->db->field("*")
            ->table("bw_deposit")
            ->select();
        if ($result) {
            $this->ajax_render($result);
        } else {
            $this->ajax_render([]);
        }
    }

    //提现列表
    public function withdrawAction()
    {
        $result = $this->db->field("*")
            ->table("bw_withdraw")
            ->select();
        if ($result) {
            $this->ajax_render($result);
        } else {
            $this->ajax_render([]);
        }
    }

    //添加投票上币活动
    public function addvoteAction()
    {
        if ($this->getRequest()->isPost()) {
            $data["currency_id"] = post("currency_id");
            $data["least"] = post("least");
            $data["maximum"] = post("maximum");
            $data["x_currency_id"] = post("x_currency_id");
            $data["consume_number"] = post("consume_number");
            $data["title"] = post("title");
            $data["rule"] = post("content");
            if (empty($data["currency_id"]) || empty($data["least"]) || empty($data["maximum"]) || empty($data["x_currency_id"]) || empty($data["consume_number"]) || empty($data["rule"])) {
                echo 2;
                exit;
            }
            $data["ctime"] = time();
            $ids = $this->db->action($this->db->insertSql("activity", $data));
            echo $ids ? 1 : 0;
        }
    }

    //修改投票上币活动
    public function editvoteAction()
    {
        if ($this->getRequest()->isPost()) {
            $data["currency_id"] = post("currency_id");
            $data["least"] = post("least");
            $data["maximum"] = post("maximum");
            $data["x_currency_id"] = post("x_currency_id");
            $data["consume_number"] = post("consume_number");
            $data["title"] = post("title");
            $data["rule"] = post("content");
            $id = post("id");
            if (empty($data["currency_id"]) || empty($data["least"]) || empty($data["maximum"]) || empty($data["x_currency_id"]) || empty($data["consume_number"]) || empty($data["rule"])) {
                echo 2;
                exit;
            }
            $data["ctime"] = time();
            $ids = $this->db->action($this->db->updateSql("activity", $data, "id = " . $id));
            echo $ids ? 1 : 0;
        }
    }

    //管理员列表
    public function systemAction()
    {
        $result = $this->db->field("*")
            ->table("bw_system")
            ->select();
        if ($result) {
            $this->ajax_render($result);
        } else {
            $this->ajax_render([]);
        }
    }

    //用户列表
    public function userlistAction()
    {
        $result = $this->db->field("*")
            ->table("bw_user")
            ->select();
        if ($result) {
            $this->ajax_render($result);
        } else {
            $this->ajax_render([]);
        }
    }

    //系统设置banner删除图片
    public function delpicAction()
    {
        if ($this->getRequest()->isPost()) {
            $banner = post("banner_img");
            $data = $this->db->field("id,banner_img")->table("bw_setting")->find();
            $arrdata = explode(",", $data["banner_img"]);
            unset($arrdata[array_search($banner, $arrdata)]);
            if (!empty($arrdata)) {
                $result["banner_img"] = implode(",", $arrdata);
            } else {
                $result["banner_img"] = null;
            }
            $map = "id = " . $data["id"];
            $bool = $this->db->action($this->db->updateSql("setting", $result, $map));
            echo $bool ? 1 : 0;
        }
    }

    //审核权限
    public function authenticationAction(){
        $id = post("id");//审核id
        $u_id = post("u_id"); //用户id
        $type = post("type");
        if($type == 'success'){
            $status = post("status")+1; //审核等级
            $bool = $this->db->action($this->db->updateSql("user",["authenticate"=>$status],"id = {$u_id}"));
            echo $bool ? 1 : 0;
        }else{
            $info = post("info");
            $status = (post("status") == 1)?5:6; //审核等级
            $this->db->beginTransaction();
            $bool1 = $this->db->action($this->db->updateSql("user",["authenticate"=>$status],"id = {$u_id}"));
            $bool2 = $this->db->action($this->db->updateSql("user_authentication",["info"=>$info],"id = {$id}"));
            if ($bool1 && $bool2) {
                $this->db->commit();
                echo 1;
            } else {
                $this->db->rollback();
                echo 0;
            }
        }


    }

    public function emptyAction()
    {
        // TODO: Implement __call() method.
    }
}















