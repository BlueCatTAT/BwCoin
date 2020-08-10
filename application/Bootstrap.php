<?php
use \Yaf\Bootstrap_Abstract;
use \Yaf\Application;
use \Yaf\Dispatcher;
use \Yaf\Loader;
use \Yaf\Registry;
//initialization Controller
class Bootstrap extends Bootstrap_Abstract{

    public function _initCommonFunctions(){
        Loader::import(Application::app()->getConfig()->application->directory . '/common/functions.php');
        Loader::getInstance()->registerLocalNameSpace('Base');
    }

    public function _initConfig(Dispatcher $dispatcher) {
        $config = Application::app()->getConfig();
        Registry::set("config", $config);
    }

    public function _initAutoload(Dispatcher $dispatcher) {
        // Autoload 自动载入
        Loader::import(APP_PATH.'/vendor/autoload.php');
    }

    public function _initPlugin(Dispatcher $dispatcher) {
        //注册一个插件
        $objSamplePlugin = new SamplePlugin();
        $dispatcher->registerPlugin($objSamplePlugin);
    }

    public function _initRoute(Dispatcher $dispatcher) {
        //在这里注册自己的路由协议,默认使用简单路由
    }

    //smarty配置
//    public function _initSmarty(Dispatcher $dispatcher) {
//        Loader::import( APP_PATH ."/application/library/smarty-3.1.34/libs/Adapter.php");
//        $smarty = new Smarty_Adapter(null, Application::app()->getConfig()->smarty);
//        Dispatcher::getInstance()->setView($smarty);
//    }

    public function _initView(Dispatcher $dispatcher){
        //在这里注册自己的view控制器，例如smarty,firekylin
        //smarty配置
        //Dispatcher::getInstance()->disableView(); //关闭其自动渲染
    }
}
