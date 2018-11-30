<?php
class motivosController extends permisosController
{
    private $_sql;
    public function __construct()
    {
        parent::__construct();
        $this->_sql = $this->loadModel('motivos');
    }
    public function index()
    {
        $this->_view->setJs(array('js'));
        $paginador = new Paginador();
        $this->_view->assign('title', 'Motivos');
        $this->_view->assign('consulta', $paginador->paginar($this->_sql->consulta()));
        $this->_view->assign('paginador', $paginador->getView('paginacion_ajax'));
        $this->_view->renderizar('index', 'permisos', 'motivos');
    }
    public function consulta_ajax()
    {
        if (!empty(_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower(_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
            $pagina = $this->getInt('pagina');
            $paginador = new Paginador();
            $this->_view->assign('consulta', $paginador->paginar($this->_sql->consulta(), $pagina));
            $this->_view->assign('paginador', $paginador->getView('paginacion_ajax'));
            $this->_view->renderizar('viewAjax/nuevo', false, false, true);
        } else {
            echo 'Error Processing Request';
        }
    }
    public function insertar_ajax()
    {
        if (!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
            $result = $this->_sql->insertar(array());
            if (!$result) {
                echo json_encode(array('error' => 'Ha ocurrido un error'));
                exit;
            }
            echo json_encode('Se a ingresado ' . $result . ' fila');
            exit;
        } else {
            echo 'Error Processing Request';
        }
    }
    public function modificar_ajax()
    {
        if (!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
            $this->_sql->modificar(array());
            if (!$result) {
                echo json_encode(array('error' => 'Ha ocurrido un error'));
                exit;
            }
            echo json_encode('Se a ingresado ' . result . ' fila');
            exit;
        } else {
            echo 'Error Processing Request';
        }
    }
}
