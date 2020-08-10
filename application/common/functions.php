<?php
function get_user_name($id){
    $db = new dbModel();
    $u_id = $db->getByKey("user","username","id = '{$id}'");
    return $u_id;
}
function get_currency_name($id){
    $db = new dbModel();
    $type = $db->getByKey("currency","type","id = {$id}");
    return $type;
}
function get_xbys_num($id){
    $db = new dbModel();
    $count = $db->zscount("newscoin","*",'total',"xbys_id = {$id}");
    return $count;
}
//订单生成
function build_order_no(){
    return date('Ymd').substr(implode(array_map('ord', str_split(substr(uniqid(), 7, 13), 1))), 0, 8);
}

function isMobile() {
    // 如果有HTTP_X_WAP_PROFILE则一定是移动设备
    if (isset($_SERVER['HTTP_X_WAP_PROFILE'])) {
        return true;
    }
    // 如果via信息含有wap则一定是移动设备,部分服务商会屏蔽该信息
    if (isset($_SERVER['HTTP_VIA'])) {
        // 找不到为flase,否则为true
        return stristr($_SERVER['HTTP_VIA'], "wap") ? true : false;
    }
    // 脑残法，判断手机发送的客户端标志,兼容性有待提高。其中'MicroMessenger'是电脑微信
    if (isset($_SERVER['HTTP_USER_AGENT'])) {
        $clientkeywords = array('nokia','sony','ericsson','mot','samsung','htc','sgh','lg','sharp','sie-','philips','panasonic','alcatel','lenovo','iphone','ipod','blackberry','meizu','android','netfront','symbian','ucweb','windowsce','palm','operamini','operamobi','openwave','nexusone','cldc','midp','wap','mobile','MicroMessenger');
        // 从HTTP_USER_AGENT中查找手机浏览器的关键字
        if (preg_match("/(" . implode('|', $clientkeywords) . ")/i", strtolower($_SERVER['HTTP_USER_AGENT']))) {
            return true;
        }
    }
    // 协议法，因为有可能不准确，放到最后判断
    if (isset ($_SERVER['HTTP_ACCEPT'])) {
        // 如果只支持wml并且不支持html那一定是移动设备
        // 如果支持wml和html但是wml在html之前则是移动设备
        if ((strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') !== false) && (strpos($_SERVER['HTTP_ACCEPT'], 'text/html') === false || (strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') < strpos($_SERVER['HTTP_ACCEPT'], 'text/html')))) {
            return true;
        }
    }
    return false;
}

function isWechat() {
    // 如果有HTTP_X_WAP_PROFILE则一定是移动设备
    if (isset($_SERVER['HTTP_X_WAP_PROFILE'])) {
        return true;
    }
    // 如果via信息含有wap则一定是移动设备,部分服务商会屏蔽该信息
    if (isset($_SERVER['HTTP_VIA'])) {
        // 找不到为flase,否则为true
        return stristr($_SERVER['HTTP_VIA'], "wap") ? true : false;
    }
    // 脑残法，判断手机发送的客户端标志,兼容性有待提高。其中'MicroMessenger'是电脑微信
    if (isset($_SERVER['HTTP_USER_AGENT'])) {
        $clientkeywords = array('MicroMessenger');
        // 从HTTP_USER_AGENT中查找手机浏览器的关键字
        if (preg_match("/(" . implode('|', $clientkeywords) . ")/i", strtolower($_SERVER['HTTP_USER_AGENT']))) {
            return true;
        }
    }
    // 协议法，因为有可能不准确，放到最后判断
    if (isset ($_SERVER['HTTP_ACCEPT'])) {
        // 如果只支持wml并且不支持html那一定是移动设备
        // 如果支持wml和html但是wml在html之前则是移动设备
        if ((strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') !== false) && (strpos($_SERVER['HTTP_ACCEPT'], 'text/html') === false || (strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') < strpos($_SERVER['HTTP_ACCEPT'], 'text/html')))) {
            return true;
        }
    }
    return false;
}
function isiphone() {
    // 如果有HTTP_X_WAP_PROFILE则一定是移动设备
    if (isset($_SERVER['HTTP_X_WAP_PROFILE'])) {
        return true;
    }
    // 如果via信息含有wap则一定是移动设备,部分服务商会屏蔽该信息
    if (isset($_SERVER['HTTP_VIA'])) {
        // 找不到为flase,否则为true
        return stristr($_SERVER['HTTP_VIA'], "wap") ? true : false;
    }
    // 脑残法，判断手机发送的客户端标志,兼容性有待提高。其中'MicroMessenger'是电脑微信
    if (isset($_SERVER['HTTP_USER_AGENT'])) {
        $clientkeywords = array('iphone','ipod');
        // 从HTTP_USER_AGENT中查找手机浏览器的关键字
        if (preg_match("/(" . implode('|', $clientkeywords) . ")/i", strtolower($_SERVER['HTTP_USER_AGENT']))) {
            return true;
        }
    }
    // 协议法，因为有可能不准确，放到最后判断
    if (isset ($_SERVER['HTTP_ACCEPT'])) {
        // 如果只支持wml并且不支持html那一定是移动设备
        // 如果支持wml和html但是wml在html之前则是移动设备
        if ((strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') !== false) && (strpos($_SERVER['HTTP_ACCEPT'], 'text/html') === false || (strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') < strpos($_SERVER['HTTP_ACCEPT'], 'text/html')))) {
            return true;
        }
    }
    return false;
}
function conversion($data){
    if($data == 0){
        return "X";
    }else{
        $strData = (string)$data;
        $mun = ['0','1','2','3','4','5','6','7','8','9'];
        $zhcn = ['十','一','二','三','四','五','六','七','八','九'];
        if(strlen($strData) == 3 && $strData[1] <> 0 && $strData[2] <> 0){
            return str_replace($mun, $zhcn, $strData[0]) . "百" . str_replace($mun, $zhcn, $strData[1]) . "十" . str_replace($mun, $zhcn, $strData[2]);
        }elseif(strlen($strData) == 3 && $strData[1] == 0 && $strData[2] <> 0){
            return str_replace($mun, $zhcn, $strData[0]) . "百零" . str_replace($mun, $zhcn, $strData[2]);
        }elseif(strlen($strData) == 3  && $strData[1] <> 0 && $strData[2] == 0){
            return str_replace($mun, $zhcn, $strData[0]) . "百" . str_replace($mun, $zhcn, $strData[1]) . "十";
        }elseif(strlen($strData) == 3 && $strData[1] == 0 && $strData[2] == 0){
            return str_replace($mun, $zhcn, $strData[0]) . "百";
        }elseif(strlen($strData) == 2 && $data <> 10 && $strData[1] <> 0){
            return str_replace($mun,$zhcn,$strData[0])."十".str_replace($mun,$zhcn,$strData[1]);
        }elseif(strlen($strData) == 2 && $data <> 10 && $strData[1] == 0){
            return str_replace($mun,$zhcn,$strData[0])."十";
        }elseif($strData == 10){
            return "十";
        }elseif(strlen($strData) == 1 &&  $data > 0){
            return str_replace($mun,$zhcn,$strData);
        }
    }
}
function alertText($data,$url) {
    echo "<script>
    var divNode = document.createElement('div');
    divNode.setAttribute('id','msg');
    divNode.style.position = 'fixed';
    divNode.style.top = '50%';
    divNode.style.width = '400px';
    divNode.style.left = '50%';
    divNode.style.marginLeft = '-220px';
    divNode.style.height = '30px';
    divNode.style.lineHeight = '30px';
    divNode.style.marginTop = '-35px';
    var pNode = document.createElement('p');
    pNode.style.background = 'rgba(0,0,0,0.6)';
    pNode.style.width = '300px';
    pNode.style.color = '#fff';
    pNode.style.textAlign = 'center';
    pNode.style.padding = '20px';
    pNode.style.margin = '0 auto';
    pNode.style.fontSize = '16px';
    pNode.style.borderRadius = '4px';
    pNode.innerText = '".$data."';
    divNode.appendChild(pNode);
    var htmlNode = document.documentElement;
    htmlNode.style.background = 'rgba(0,0,0,0)';
    htmlNode.appendChild(divNode);
    var t = setTimeout(next,2000);
    function next(){
        htmlNode.removeChild(divNode);
        window.location.href='".$url."';
    }
    </script>";
}
function success($msg,$url){
    echo "<script>alert('".$msg."');window.location.href='".$url."';</script>";
}
function error($msg){
    echo "<script>alert('".$msg."');window.history.back();</script>";
}
function statusUrl($bool,string $success_msg, string $success_url,string $error_msg){
    if($bool){
        success($success_msg,$success_url);
    }else{
        error($error_msg);
    }
}
function server($data = null){
    if(is_null($data)){
        return $_SERVER;
    }else{
        $key = strtoupper($data);
        return $_SERVER[$key];
    }
}
function request($data = null){
    if(is_null($data)){
        return $_REQUEST;
    }else{
        return $_REQUEST[$data];
    }
}
function post($data = null){
    if(is_null($data)){
        return $_POST;
    }else{
        return $_POST[$data];
    }
}
function get($data = null){
    if(is_null($data)){
        return $_GET;
    }else{
        return $_GET[$data];
    }
}
function files($data = null){
    if(is_null($data)){
        return $_FILES;
    }else{
        return $_FILES[$data];
    }
}
function fun_adm_each($arr){
    $strData = "?";
    foreach ($arr as $k=>$v){
        $strData.=$k."=".$v."&";
    }
    return substr($strData,0,-1);
    //$arr_key = array_keys($arr);
    //$arr_value = array_values($arr);
    //$strData = "?";
    //for($i=0;$i<count($arr_key);$i++){
    //    $strData .= $arr_key[$i]."=".$arr_value[$i]."&";
    //}
}
function load_view($filename=null,$data=null){
    if(is_null($data)){
        include_once APP_PATH."/application/views/{$filename}.phtml";
    }else{
        include_once APP_PATH."/application/views/{$filename}.phtml".fun_adm_each($data);
    }
}
function p($data){
    if(is_bool($data) || is_null($data)){
        var_dump($data);
    }
    if(is_array($data) || is_object($data) || is_resource($data)){
        echo "<pre>";
        print_r($data);
        echo "</pre>";
    }
    if(is_int($data) || is_string($data) || is_float($data)){
        echo $data;
    }
    exit;
}
function dump($data){
    switch (true){
        case is_string($data) || is_int($data) || is_float($data): echo $data ; break; exit;
        case is_array($data) || is_object($data) : echo "<pre>";print_r($data);echo "</pre>"; break;exit;
        case is_bool($data) || is_null($data) : var_dump($data) ; break;exit;
        default: var_dump($data) ;break;exit;
    }
    exit;
}
//文件下载
function apkdownload($file){
    if(file_exists($file)){
        header("Content-type:application/vnd.android.package-archive");
        $filename = basename($file);
        header("Content-Disposition:attachment;filename = ".$filename);
        header("Accept-ranges:bytes");
        header("Accept-length:".filesize($file));
        readfile($file);
    }else{
        echo "<script>alert('文件不存在')</script>";
    }
}
//获取CURD请求类型
function Get_method(){
    $method = $_SERVER['REQUEST_METHOD'];
    return $method;
}
//获取CURD请求数据
function Resp_curl(){
    parse_str(file_get_contents('php://input'), $data);
    $data = array_merge($_GET, $_POST, $data);
    return $data;
}
//建立CURD请求模式
function Rest_curl($url,$type='GET',$data="",$bool=false,array $headers=["content-type: application/x-www-form-urlencoded;charset=UTF-8"]){
    //post 新增  get查询  put修改  delete删除
    $curl= curl_init();
    curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($curl, CURLOPT_URL,$url);
    if($bool == true){
        curl_setopt($curl, CURLOPT_HEADER, $bool);
    }
    curl_setopt($curl, CURLOPT_RETURNTRANSFER,1);
    curl_setopt($curl, CURLOPT_TIMEOUT, 30);
    switch ($type){
        case "GET":break;
        case "POST":
            curl_setopt($curl, CURLOPT_POST, 1);
            curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
            break;
        case "PUT":
            curl_setopt($curl, CURLOPT_CUSTOMREQUEST, 'PUT');
            curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
            break;
        case "DELETE":
            curl_setopt($curl, CURLOPT_CUSTOMREQUEST, 'DELETE');
            curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
            break;
        default:break;
    }
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER,false);
    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST,false);
    if(curl_exec($curl) === false){
        return "error code:".curl_getinfo($curl, CURLINFO_HTTP_CODE).',error message:'.curl_error($curl);
    }
    $strData = curl_exec($curl);
    curl_close($curl);
    return $strData;
}
function curl_get($url){
    $curl= curl_init();
    curl_setopt($curl, CURLOPT_URL,$url);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER,1);
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER,false);
    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST,false);
    if(curl_exec($curl) === false){
        return "error code:".curl_getinfo($curl, CURLINFO_HTTP_CODE).',error message:'.curl_error($curl);
    }
    $strData = curl_exec($curl);
    curl_close($curl);
    $arrData = json_decode($strData);
    return $arrData;
}

/** PHP高精度计算
 * @param string $type
 * @param $n
 * @param $m
 * @param int $len 保留几位小数
 */
function bc($type = "*",$n,$m,$len=5){
    $t = 0;
    switch ($type){
        case "*":
            $t = bcmul($n,$m,$len);
            break;
        case "/";
            if($m != 0){
                $t = bcdiv($n,$m,$len);
            }
            break;
        case "+":
            $t = bcadd($n,$m,$len);
            break;
        case "-":
            $t = bcsub($n,$m,$len);
            break;
    }
    return $t;
}

