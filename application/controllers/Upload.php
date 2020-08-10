<?php
use Yaf\Application;
use Yaf\Dispatcher;
class UploadController extends Yaf\Controller_Abstract {
    public $db;
    public function init(){
        $this->db = new dbModel();
        Dispatcher::getInstance()->autoRender(false);
        header('Access-Control-Allow-Origin:*');//允许所有来源访问
        header('Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, x-token');
        header('Access-Control-Allow-Method: POST, GET');//允许访问的方式
        if(strtoupper($_SERVER['REQUEST_METHOD'])== 'OPTIONS'){
            exit;
        }
    }
    //文件上传
    public function indexAction() {
        $key = array_keys($_FILES)[0];
        if(!empty($_FILES[$key])){
            if(is_array($_FILES[$key]['name'])){
                $res = $this->uploadss($_FILES[$key],"upload");
            }else{
                $res = $this->uploadone($_FILES[$key],"upload");
            }
        }else{
            $res = ['msg'=>"上传失败"];
        }
        $result['code'] = 20000;
        $result['msg'] = 'success';
        $result['data'] = $res;
        echo json_encode($result,320);
        exit;
    }
    //富文本上传
    public function editAction(){
        $key = array_keys($_FILES)[0];
        if(!empty($_FILES[$key])){
            if(is_array($_FILES[$key]['name'])){
                $res = $this->uploadss($_FILES[$key],"upload");
            }else{
                $res = $this->uploadone($_FILES[$key],"upload");
            }
        }else{
            $res = ['msg'=>"上传失败"];
        }
        $result['code'] = 0;
        $result['msg'] = 'success';
        $result['data']['src'] = $res;
        echo json_encode($result,320);
        exit;
    }
    //单文件上传
    public function uploadone($file,$path){
        $time = date("Y-m-d",time());
        $dir = APP_PATH."/public/".$path."/".$time;
        if(!file_exists($dir)){
            mkdir($dir,0777,true);
        }
        $name = time().rand(100000,999999).".".substr($file["name"],(strrpos($file["name"],'.') + 1));
        $pathicon = $dir."/".$name;
        move_uploaded_file($file['tmp_name'],$pathicon);
        $fileArr = "/public/".$path."/".$time."/".$name;
        return $fileArr;
    }
    //多文件上传
    public function uploadss($file,$path){
        $time = date("Y-m-d",time());
        $dir = APP_PATH."/public/".$path."/".$time;
        if(!file_exists($dir)){
            mkdir($dir,0777,true);
        }
        $fileArr = [];
        for($i=0;$i<count($file['name']);$i++){
            $pathicon = $dir."/".$file['name'][$i];
            move_uploaded_file( $file['tmp_name'][$i],$pathicon);
            $fileArr[] = "/public/".$path."/".$time."/".$file['name'][$i];
        }
        $filedata = json_encode($fileArr,320);
        return $filedata;
    }
    //apk上传
    public function uploadapkAction(){
        if($_FILES['file']['name']){
            $file = files("file");
            $dir = APP_PATH."/package";
            if(!file_exists($dir)){
                mkdir($dir,0777,true);
            }
            $pathicon = $dir."/".$file['name'];
            move_uploaded_file( $file['tmp_name'],$pathicon);
            $res['update_address'] = "/package/".$file['name'];
            $res['package_size'] = $file['size'];
            $result['code'] = 20000;
            $result['msg'] = 'success';
            $result['data'] = $res;
            echo json_encode($result,320);
            exit;
        }

    }

    public function emptyAction()
    {
        // TODO: Implement __call() method.
    }

}
?>
