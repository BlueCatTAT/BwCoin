<?php
use Yaf\Controller_Abstract;
use Yaf\Dispatcher;
use Yaf\Session;
use Error\CodeConfigModel;
class Base_Base extends Controller_Abstract
{
    protected $db;
    protected $request; //wap接收数据
    protected $data; //sdk接收数据
    protected $sessions;
    protected $error;
    protected $reqdata;
    const APP_KEY = "MDc2OWJkYWI0ZGJiMmMxMzBjNzA3MGQ5NTU0MDVkODE=";
    public function init(){
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, x-token");
        header('Access-Control-Allow-Methods: GET, POST, PUT, PATCH, DELETE, HEAD, OPTIONS');
        Dispatcher::getInstance()->autoRender(false);
        $this->db = new dbModel();
        $this->data = file_get_contents("php://input");
        $this->sessions = Session::getInstance();
        $this->error = (new CodeConfigModel())->getCodeConfig();
        if(empty($this->data)){
            $this->ajax_return(4);
        }else{
            $result = json_decode($this->data,true);
            if(!isset($result['token'])){
                $this->ajax_return(1);
            }else{
                $token = $result['token'];
                unset($result['token']);
                if($this->issign($result,$token) == "ok"){
                    $this->reqdata = $result;
                }
            }
        }
    }

    public function ajax_return($code,$data = null){
        if(is_null($data)){
            echo json_encode(['code'=>$code,'message'=>$this->error[$code]]);exit;
        }else{
            echo json_encode(['code'=>$code,'message'=>$this->error[$code],"data"=>$data]);exit;
        }
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

    public function hashkey($data,$key){
        return hash_hmac("sha256",$data,$key);
    }

    public function issign($lockdata,$sdkdata){
        $newdata = $this->sign($lockdata);
        if($sdkdata != $newdata){
            $this->ajax_return(2);
        }else{
            return "ok";
        }
    }
    public function sign($data){
        $arrData = $this->argSort($data);
        $signstr = $this->strlink($arrData);
        return hash_hmac("sha256",$signstr.self::APP_KEY,self::APP_KEY);
    }
    public function strlink($para) {
        $arg  = "";
        foreach ($para as $k=>$v){
            $arg.=$k."=".$v."&";
        }
        //去掉最后一个&字符
        $arg = substr($arg,0,-1);
        //如果存在转义字符，那么去掉转义
        if(get_magic_quotes_gpc()){$arg = stripslashes($arg);}
        return $arg;
    }
    public function argSort($para) {
        ksort($para);
        reset($para);
        return $para;
    }

    public function emptyAction()
    {
        // TODO: Implement __call() method.
    }
}