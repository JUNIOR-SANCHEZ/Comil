<?php
class tipo_sangreController extends personasController
{
    private $__sql;
    public function __construct()
    {
        parent::__construct();
        $this->_sql = $this->loadModel("tipo_sangre");
    }
    public function index()
    {

        $this->_view->setJS(array("js"));
        $paginador = new Paginador();
        $this->_view->assign("title", "Persona");
        $this->_view->assign('consulta', $paginador->paginar($this->_sql->consulta(), false));
        $this->_view->assign('paginador', $paginador->getView('paginacion_ajax'));
        $this->_view->renderizar("index", "personas", "t_sangre");
    }
    public function consulta_ajax()
    {
        if (!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
            $pagina = $this->getInt('pagina');
            $paginador = new Paginador();
            $this->_view->assign('consulta', $paginador->paginar($this->_sql->consulta(), $pagina));
            $this->_view->assign('paginador', $paginador->getView('paginacion_ajax'));
            $this->_view->renderizar("viewAjax/index", false, false, true);
        } else {
            echo "Error Processing Request";
        }
    }
    public function insertar_ajax()
    {
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
    public function modificar_ajax()
    {
        if (!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
            $result = $this->_sql->modificar(array($this->getInt("txtid"), $this->getText("txtdescripcion")));
            if (!$result) {
                echo json_encode(array("error"=>"Error al modificar"));
                exit;
            }
            echo json_encode("Se modifico registro");
            exit;
        } else {
            echo "Error Processing Request";
        }
    }
    public function eliminar_ajax()
    {
        if (!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
            $result = $this->_sql->eliminar($this->getInt("txtid"));
            if ($result > 0) {
                echo "Se elimino " . $result . " fila";
            } else {
                echo "Error al eliminar";
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
