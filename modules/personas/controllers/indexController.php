<?php
class indexController extends personasController{
    private $_sql;
    public function __construct() {
        parent::__construct();
        $this->_sql = $this->loadModel("index");
        $this->_view->setCssPlugin(array("dataTables.bootstrap"));
        $this->_view->setJsPlugin(array("jquery.dataTables","dataTables.bootstrap"));
    }
    public function index()
    {
        // print_r($this->_sql->consulta());exit;
        $this->_view->setJS(array("js"));
        $this->_view->assign("title","Personas");
        $this->_view->renderizar("index","personas","index");
    }
    public function consulta_ajax()
    {
        json_encode($this->_sql->consulta());
    }
}