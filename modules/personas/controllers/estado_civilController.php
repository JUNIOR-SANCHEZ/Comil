<?php
class estado_civilController extends personasController{
    private $_sql;
    public function __construct() {
        parent::__construct();
        $this->_sql = $this->loadModel("estado_civil");
    }
    public function index()
    {
        
        $paginador = new Paginador();
        $this->_view->assign("title","Estado civil");
        $this->_view->assign('consulta', $paginador->paginar($this->_sql->consulta(), false));
        $this->_view->assign('paginador', $paginador->getView('paginacion_ajax'));
        $this->_view->renderizar("index","personas","s_civil");
    }
    public function consulta_ajax()
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
            $result = $this->_sql->insertar($this->getText("txtdescripcion"));
            if($result > 0){
                echo "Se registro ".$result." fila";
            }else{
                echo "Error al registrar";
            }
        } else {
            echo "Error Processing Request";
        }
    }
    public function modificar_ajax(Type $var = null)
    {
        // print_r($_POST["txtid"]);exit;
        if (!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
            $result = $this->_sql->modificar(array($this->getInt("txtid"),$this->getText("txtdescripcion")));
            if($result > 0){
                echo "Se modifico ".$result." fila";
            }else{
                echo "Error al registrar";
            }     
        } else {
            echo "Error Processing Request";
        }
    }
    public function eliminar_ajax()
    {
        	if (!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
                $result = $this->_sql->eliminar($this->getInt("txtid"));
                if($result > 0){
                    echo "Se elimino ".$result." fila";
                }else{
                    echo "Error al eliminar";
                } 
            } else {
                echo "Error Processing Request";
            }
    }
}