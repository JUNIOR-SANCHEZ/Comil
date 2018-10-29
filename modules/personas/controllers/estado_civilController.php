<?php
class estado_civilController extends personasController{
    public function __construct() {
        parent::__construct();
    }
    public function index()
    {
        $this->_view->assign("title","Estado civil");
        $this->_view->renderizar("index","personas","s_civil");
    }
}