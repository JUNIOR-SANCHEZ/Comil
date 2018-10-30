<?php
class indexController extends personasController{
    public function __construct() {
        parent::__construct();
        $this->_view->setCssPlugin(array("dataTables.bootstrap"));
        $this->_view->setJsPlugin(array("jquery.dataTables","dataTables.bootstrap"));
    }
    public function index()
    {
        
        $this->_view->setJS(array("js"));
        $this->_view->assign("title","Personas");
        $this->_view->renderizar("index","personas","index");
    }
}