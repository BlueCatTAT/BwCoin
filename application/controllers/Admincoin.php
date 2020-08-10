<?php
use Yaf\Controller_Abstract;
use Yaf\Dispatcher;
use Yaf\Session;
class AdmincoinController extends Controller_Abstract
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

    public function currencyAction(){
        $result = $this->db->field("*")
            ->table("bw_currency")
            ->select();
        $this->getView()->assign("result", $result);
    }

    public function depositAction(){
        $this->getView()->assign("xxxx", "yyyy");
    }

    public function withdrawAction(){
        $this->getView()->assign("xxxx", "yyyy");
    }

    public function addcurrencyAction(){
        $this->getView()->assign("xxxx", "yyyy");
    }

    public function editcurrencyAction(){
        $id = get("id");
        $result = $this->db->field("*")
            ->table("bw_currency")
            ->where("id = {$id}")
            ->find();
        $this->getView()->assign("result", $result);
    }

    public function fiatcoinAction(){
        $this->getView()->assign("xxxx", "yyy");
    }

    public function suijAction(){
        $lastname_arr = array('赵','钱','孙','李','周','吴','郑','王','冯','陈','褚','卫','蒋','沈','韩','杨','朱','秦','尤','许','何','吕','施','张','孔','曹','严','华','金','魏','陶','姜',
            '戚','谢','邹','喻','柏','水','窦','章','云','苏','潘','葛','奚','范','彭','郎','鲁','韦','昌','马','苗','凤','花','方','任','袁','柳','鲍','史','唐','费','薛','雷','贺','倪',
            '汤','滕','殷','罗','毕','郝','安','常','傅','卞','齐','元','顾','孟','平','黄','穆','萧','尹','姚','邵','湛','汪','祁','毛','狄','米','伏','成','戴','谈','宋','茅','庞','熊',
            '纪','舒','屈','项','祝','董','梁','杜','阮','蓝','闵','季','贾','路','娄','江','童','颜','郭','梅','盛','林','钟','徐','邱','骆','高','夏','蔡','田','樊','胡','凌','霍','虞',
            '万','支','柯','管','卢','莫','柯','房','裘','缪','解','应','宗','丁','宣','邓','单','杭','洪','包','诸','左','石','崔','吉','龚','程','嵇','邢','裴','陆','荣','翁','荀','于',
            '惠','甄','曲','封','储','仲','伊','宁','仇','甘','武','符','刘','景','詹','龙','叶','幸','司','黎','溥','印','怀','蒲','邰','从','索','赖','卓','屠','池','乔','胥','闻','莘',
            '党','翟','谭','贡','劳','逄','姬','申','扶','堵','冉','宰','雍','桑','寿','通','燕','浦','尚','农','温','别','庄','晏','柴','瞿','阎','连','习','容','向','古','易','廖','庾',
            '终','步','都','耿','满','弘','匡','国','文','寇','广','禄','阙','东','欧','利','师','巩','聂','关','荆','司马','上官','欧阳','夏侯','诸葛','闻人','东方','赫连','皇甫','尉迟',
            '公羊','澹台','公冶','宗政','濮阳','淳于','单于','太叔','申屠','公孙','仲孙','轩辕','令狐','徐离','宇文','长孙','慕容','司徒','司空');
        $firstname_arr = array('伟','刚','勇','毅','俊','峰','强','军','平','保','东','文','辉','力','明','永','健','世','广','志','义','兴','良','海','山','仁','波','宁','贵','福','生','龙',
            '元','全','国','胜','学','祥','才','发','武','新','利','清','飞','彬','富','顺','信','子','杰','涛','昌','成','康','星','光','天','达','安','岩','中','茂','进','林','有','坚',
            '和','彪','博','诚','先','敬','震','振','壮','会','思','群','豪','心','邦','承','乐','绍','功','松','善','厚','庆','磊','民','友','裕','河','哲','江','超','浩','亮','政','谦',
            '亨','奇','固','之','轮','翰','朗','伯','宏','言','若','鸣','朋','斌','梁','栋','维','启','克','伦','翔','旭','鹏','泽','晨','辰','士','以','建','家','致','树','炎','德','行',
            '时','泰','盛','雄','琛','钧','冠','策','腾','楠','榕','风','航','弘','秀','娟','英','华','慧','巧','美','娜','静','淑','惠','珠','翠','雅','芝','玉','萍','红','娥','玲','芬',
            '芳','燕','彩','春','菊','兰','凤','洁','梅','琳','素','云','莲','真','环','雪','荣','爱','妹','霞','香','月','莺','媛','艳','瑞','凡','佳','嘉','琼','勤','珍','贞','莉','桂',
            '娣','叶','璧','璐','娅','琦','晶','妍','茜','秋','珊','莎','锦','黛','青','倩','婷','姣','婉','娴','瑾','颖','露','瑶','怡','婵','雁','蓓','纨','仪','荷','丹','蓉','眉','君',
            '琴','蕊','薇','菁','梦','岚','苑','婕','馨','瑗','琰','韵','融','园','艺','咏','卿','聪','澜','纯','毓','悦','昭','冰','爽','琬','茗','羽','希','欣','飘','育','滢','馥','筠',
            '柔','竹','霭','凝','晓','欢','霄','枫','芸','菲','寒','伊','亚','宜','可','姬','舒','影','荔','枝','丽','阳','妮','宝','贝','初','程','梵','罡','恒','鸿','桦','骅','剑','娇',
            '纪','宽','苛','灵','玛','媚','琪','晴','容','睿','烁','堂','唯','威','韦','雯','苇','萱','阅','彦','宇','雨','洋','忠','宗','曼','紫','逸','贤','蝶','菡','绿','蓝','儿','翠',
            '钱','孙','李','周','吴','郑','王','冯','陈','褚','卫','蒋','沈','韩','杨','朱','秦','尤','许','何','吕','施','张','孔','曹','严','华','金','魏','陶','姜','戚','谢','邹','喻','柏','水','窦','章','云','苏','潘','葛','奚','范','彭','郎','鲁','韦','昌','马','苗','凤','花','方','任','袁','柳','鲍','史','唐','费','薛','雷','贺','倪','汤','滕','殷','罗','毕','郝','安','常','傅','卞','齐','元','顾','孟','平','黄','穆','萧','尹','姚','邵','湛','汪','祁','毛','狄','米','伏','成','戴','谈','宋','茅','庞','熊','纪','舒','屈','项','祝','董','梁','杜','阮','蓝','闵','季','贾','路','娄','江','童','颜','郭','梅','盛','林','钟','徐','邱','骆','高','夏','蔡','田','樊','胡','凌','霍','虞','万','支','柯','管','卢','莫','柯','房','裘','缪','解','应','宗','丁','宣','邓','单','杭','洪','包','诸','左','石','崔','吉','龚','程','嵇','邢','裴','陆','荣','翁','荀','于','惠','甄','曲','封','储','仲','伊','宁','仇','甘','武','符','刘','景','詹','龙','叶','幸','司','黎','溥','印','怀','蒲','邰','从','索','赖','卓','屠','池','乔','胥','闻','莘','党','翟','谭','贡','劳','逄','姬','申','扶','堵','冉','宰','雍','桑','寿','通','燕','浦','尚','农','温','别','庄','晏','柴','瞿','阎','连','习','容','向','古','易','廖','庾','终','步','都','耿','满','弘','匡','国','文','寇','广','禄','阙','东','欧','利','师','巩','聂','关','荆',
            '烟');
        $num=rand(1,2);
        $count=array_rand($lastname_arr,1);
        $str=$lastname_arr[$count];
        $count1=array_rand($firstname_arr,$num);
        if(is_array($count1)){
            $str1=$firstname_arr[$count1[0]].$firstname_arr[$count1[1]];
        }else{
            $str1=$firstname_arr[$count1];
        }
        return $str.$str1;
    }

    public function merchantAction(){
//        $this->sjstoreAction();
        $this->getView()->assign("xxxx", "yyy");
    }

    //币种数量，取数字小数点后5位
    public function randomFloatAction1($min = 0, $max = 1) {
        $num = $min + mt_rand() / mt_getrandmax() * ($max - $min);
        return sprintf("%.2f",$num);  //控制小数后几位
    }

    public function sjstoreAction(){
        //查询所有币种
        $data=$this->db->field("*")->table("bw_currency")->where("status = 1")->select();
        $hqdata=$this->cointypeAction(8);
        $hqdata=json_decode($hqdata,true);
        foreach ($data as $k=>$v){
            foreach ($hqdata["data"] as $k1=>$v1){
                if($v["type"]==$v1["name"]){
                    $price=$v1["current_price"];
                }
            }
            switch ($v["type"]){
                case "BTC":
                    $min=0.0001;
                    $max=100;
                    break;
                case "ETH":
                    $min=20;
                    $max=1000;
                    break;
                case "USDT":
                    $min=10;
                    $max=5555;
                    break;
                case "LBTH":
                    $min=20;
                    $max=5000;
                    break;
                    default;
            }
            //查询币种在进行中的所有商家
            $con=$v["type"];
            $condition="type = 0 and status = 0 and designation = '$con'";
            $arrdata=$this->db->field("*")->table("bw_merchant")->where($condition)->select();
            $condition1="type = 1 and status = 0 and designation = '$con'";
            $arrdata1=$this->db->field("*")->table("bw_merchant")->where($condition1)->select();
            if(count($arrdata)<100){//不满足100的币种进行补充
                $cou=100-count($arrdata);
                $this->creatAction($cou,$con,$min,$max,$price);
            }
            if(count($arrdata1)<100){//不满足100的币种进行补充
                $cou=100-count($arrdata);
                $this->creatAction($cou,$con,$min,$max,$price,1);
            }

        }
        return $data;
    }

    public function creatAction($cou,$type,$min,$max,$price,$cls=0){
        $list=[];
        for ($i=0;$i<$cou;$i++){
            $list["name"]=$this->suijAction();//随机商家姓名
            $list["designation"]=$type;
            $list["number"]=$this->randomFloatAction($min,$max);//随机生成币种数量
            $list["y_number"]=$list["number"];
            $list["price"]=$price;//币种当前行情
            $list["type"]=$cls;//币种当前行情
            if($type=="BTC"){
                if($list["number"]<=0.001){
                    $list["min_price"]=bc("*",$list["number"],$list["price"],5);//出售最低额
                    $list["max_price"]=bc("*",$list["number"],$list["price"],5);//出售最高额
                }else{
                    $list["min_price"]=bc("*",rand(1,10)/10000,$list["price"],5);
                    $list["max_price"]=bc("*",$list["number"],$list["price"],5);
                }
            }elseif ("ETH"){
                if($list["number"]<=1){
                    $list["min_price"]=bc("*",$list["number"],$list["price"],5);//出售最低额
                    $list["max_price"]=bc("*",$list["number"],$list["price"],5);//出售最高额
                }else{
                    $list["min_price"]=bc("*",rand(1,10)/10,$list["price"],5);
                    $list["max_price"]=bc("*",$list["number"],$list["price"],5);
                }
            }else{
                if($list["number"]<=100){
                    $list["min_price"]=bc("*",$list["number"],$list["price"],5);//出售最低额
                    $list["max_price"]=bc("*",$list["number"],$list["price"],5);//出售最高额
                }else{
                    $list["min_price"]=bc("*",rand(20,100),$list["price"],5);
                    $list["max_price"]=bc("*",$list["number"],$list["price"],5);
                }
            }
            $nu=rand(10,50);
            $nu1=rand($nu,$nu+8);
            $list["ctime"]=time();
            $list["degree"]=$nu;
            $list["transactions"]=$nu1;
//                    echo $this->db->insertSql("merchant",$list);
//                    exit;
            $this->db->action($this->db->insertSql("merchant",$list));
        }
    }

    //取各种币种的行情数据
    public function cointypeAction($size)
    {
        Dispatcher::getInstance()->autoRender(false);
//        $size = isset($_POST['size']) ? $_POST['size'] : 50;
        $url = "https://dncapi.bqiapp.com/api/coin/web-coinrank?page=1&type=-1&pagesize={$size}&webp=1";
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $result = curl_exec($ch);
        curl_close($ch);
        return $result;
    }

    //币种数量，取数字小数点后5位
    public function randomFloatAction($min = 0, $max = 1) {
        $num = $min + mt_rand() / mt_getrandmax() * ($max - $min);
        return sprintf("%.5f",$num);  //控制小数后几位
    }

    public function multipleAction(){
        $result = $this->db->field("*")->table("bw_lever_multiple")->select();
        $this->getView()->assign("result",$result);
    }

    public function addmultipleAction(){
        if ($this->getRequest()->isPost()){
            Dispatcher::getInstance()->autoRender(false);
            $type = post("type");
            $value = post("value");
            $result = $this->db->field("*")
                ->table("bw_lever_multiple")
                ->where("type = {$type} AND value = '{$value}'")
                ->find();
            if($result){
                echo 2;
            }else{
                $data['type'] = $type;
                $data['value'] = $value;
                $bool = $this->db->action($this->db->insertSql("lever_multiple",$data));
                echo $bool ? 1 : 0 ;
            }
        }else{
            $this->getView()->assign("xxx","yyy");
        }
    }

    public function heyueAction(){
        $result = $this->db->field("*")->table("bw_heyue_data")->select();
        $this->getView()->assign("result",$result);
    }

    public function emptyAction()
    {
        // TODO: Implement __call() method.
    }
}