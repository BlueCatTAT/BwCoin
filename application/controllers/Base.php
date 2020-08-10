<?php
use Yaf\Application;
use Yaf\Dispatcher;
class BaseController extends Controller_Abstract  {
    public $db;
    public $request; //wap接收数据
    public $data; //sdk接收数据
    public $session;
    const APP_KEY = "MDc2OWJkYWI0ZGJiMmMxMzBjNzA3MGQ5NTU0MDVkODE=";
    public function init(){
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, x-token");
        header('Access-Control-Allow-Methods: GET, POST, PUT, PATCH, DELETE, HEAD, OPTIONS');
        $this->db = new dbModel();
        $this->data = file_get_contents("php://input");
        $this->session =  Yaf\Session::getInstance();
    }
    public function jsonmessage($code,$message,$reqdata){
        $resdata = ["code"=>$code,"message"=>$message,"data"=>$reqdata];
        return json_encode($resdata);
    }
    public function issign($lockdata,$sdkdata){
        $newdata = $this->sign($lockdata);
        if($sdkdata != $newdata){
            echo json_encode(['code'=>100,'message'=>"签名错误"]);exit;
        }else{
            return "ok";
        }
    }
    public function sign($data){
        $arrData = $this->argSort($data);
        $signstr = $this->strlink($arrData);
        return hash_hmac("sha256",$signstr,self::APP_KEY);
    }
    public function strlink($para) {
        $arg  = "";
        while (list ($key, $val) = each ($para)) {
            $arg.=$key."=".$val."&";
        }
        //去掉最后一个&字符
        $arg = substr($arg,0,count($arg)-2);
        //如果存在转义字符，那么去掉转义
        if(get_magic_quotes_gpc()){$arg = stripslashes($arg);}
        return $arg;
    }
    public function argSort($para) {
        ksort($para);
        reset($para);
        return $para;
    }
    public function buildorderno(){
        return "pet".date('YmdHis').substr(implode(array_map('ord', str_split(substr(uniqid(), 7, 13), 1))), 0, 8)."tap";
    }
    //单文件上传
    public function uploadone($file,$path){
        $time = time();
        $dir = APP_PATH."/public/".$path."/".$time;
        if(!file_exists($dir)){
            mkdir($dir,0777,true);
        }
        $pathicon = $dir."/".$file['name'];
        move_uploaded_file( $file['tmp_name'],$pathicon);
        $fileArr = "/public/".$path."/".$time."/".$file['name'];
        return $fileArr;
    }
    //成功
    public function status($res){
        $result['code'] = 20000;
        $result['msg'] = 'success';
        $result['data'] = $res;
        echo json_encode($result,320);
        exit;
    }
    //失败
    public function error($res,$code=20000){
        $result['code'] = $code;
        $result['msg'] = 'error';
        $result['data'] = $res;
        echo json_encode($result,320);
        exit;
    }
    //验证输入字段是否为数字
    public function checkEnter($str){
        if(!preg_match("/^[0-9\.]+$/", $str)){
            $this->error('参数类型有误');
        }
    }
    //二维码生成器
    public function qrcode($inser_info){
        include APP_PATH."/vendor/phpqrcode/phpqrcode.php";
        $url = "/public/qrcode/".time().rand(000,999).".png";
        $path = APP_PATH.$url;
        @chmod($path,0777);
        QRcode::png($inser_info,$path,"L",6,1);
        return $url;
    }
    //404
    public function emptyAction()
    {
        // TODO: Implement __call() method.
    }
}
