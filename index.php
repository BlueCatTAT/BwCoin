<?php
use Yaf\Application;
use Yaf\Exception;
//error_reporting(0);
/* 指向public的上一级 */
define("APP_PATH",  realpath(dirname(__FILE__) . '/'));
// Autoload 自动载入
$app  = new Application(APP_PATH . "/conf/application.ini",ini_get('yaf.environ'));
$app->bootstrap()->run();













