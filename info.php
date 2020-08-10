<?php
//首页调用第三方API接口
header('Access-Control-Allow-Origin:*');//允许所有来源访问
header('Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, x-token');
header('Access-Control-Allow-Method: POST, GET');//允许访问的方式
$size = isset($_GET['size']) ? 10 : $_GET['size'];
$url = "https://dncapi.bqiapp.com/api/coin/web-coinrank?page=1&type=-1&pagesize=8&webp=1";
$str = file_get_contents($url);
echo $str;

