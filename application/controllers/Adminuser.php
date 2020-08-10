<?php
use Yaf\Controller_Abstract;
use Yaf\Dispatcher;
use Yaf\Session;
class AdminuserController extends Controller_Abstract
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

    public function systemAction(){
        $this->getView()->assign("xxxx", "yyyy");
    }

    public function userlistAction(){
        $this->getView()->assign("xxxx", "yyyy");
    }

    public function userlogAction(){
        $this->getView()->assign("xxxx", "yyyy");
    }

    public function emptyAction()
    {
        // TODO: Implement __call() method.
    }
}