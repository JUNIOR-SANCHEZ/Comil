<?php
/**
 * TODO: CREA, LEE, ACTUALIZA, LOS REGISTROS DE UNA PERSONA
 */
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
        
        $this->_view->setJS(array("js"));
        $paginador = new Paginador();
        $this->_view->assign("title","Personas");
        $this->_view->assign('consulta', $paginador->paginar($this->_sql->consulta()));
        $this->_view->assign('civil',$this->_sql->civilstatus());
        $this->_view->assign('gender',$this->_sql->gender());
        $this->_view->assign('blood',$this->_sql->blood());
        $this->_view->assign('paginador', $paginador->getView('paginacion_ajax'));
        $this->_view->renderizar("index","personas","index");
    }
    public function consultar_ajax()
    {
        if (!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
            $pagina = $this->getInt('pagina');
            $paginador = new Paginador();
            $this->_view->assign('consulta', $paginador->paginar($this->_sql->consulta(), $pagina));
            $this->_view->assign('paginador', $paginador->getView('paginacion_ajax'));
            $this->_view->renderizar("viewAjax/index",false, false, true);
        } else {
            echo "Error Processing Request";
        }
    }
    public function insertar_ajax()
    {
        if (!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
           
        } else {
            echo "Error Processing Request";
        }
    }
    public function exel()
    {

    }
}