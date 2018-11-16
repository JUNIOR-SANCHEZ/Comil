<?php
class estado_civilController extends personasController{
    private $_sql;
    public function __construct() {
        parent::__construct();
        $this->_sql = $this->loadModel("estado_civil");
    }
    public function index()
    {
        $this->_view->setJS(array("js"));
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
        // echo json_encode(array("error"=>$this->getText("txtdescripcion")));exit;
        if (!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
            $result = $this->_sql->insertar($this->getText("txtdescripcion"));
            if (!$result) {
                echo json_encode(array("error"=>"Error al registrar"));
                exit;
            }
            echo json_encode("Se registro registro");
            exit;
        } else {
            echo "Error Processing Request";
        }
    }
    public function modificar_ajax(Type $var = null)
    {
        if (!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
            $result = $this->_sql->modificar(array($this->getInt("txtid"),$this->getText("txtdescripcion")));
            if($result > 0){
                echo "Se modifico ".$result." registro";
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
                $result = $this->_sql->estado($this->getInt("txtid"));
                if($result > 0){
                    echo "Se actualizo ".$result." registro";
                }else{
                    echo "Error al actualizar";
                } 
            } else {
                echo "Error Processing Request";
            }
    }
    public function autocomplete_ajax()
    {
        echo json_encode($this->_sql->autocomplete($this->getText("q")));
    }
}