<?php
/**
 * TODO: CREA, LEE, ACTUALIZA, LOS REGISTROS DE UNA PERSONA
 */
class indexController extends personasController
{
    private $__sql;
    public function __construct()
    {
        parent::__construct();
        $this->_sql = $this->loadModel("index");
        $this->_view->setCssPlugin(array("all"));
        $this->_view->setJsPlugin(array("icheck.min"));

    }
    public function index()
    {

        $this->_view->setJS(array("js"));
        $paginador = new Paginador();
        $this->_view->assign("title", "Personas");
        $this->_view->assign('consulta', $paginador->paginar($this->_sql->consulta()));
        $this->_view->assign('civil', $this->_sql->civilstatus());
        // $this->_view->assign('gender', $this->_sql->gender());
        $this->_view->assign('blood', $this->_sql->blood());
        $this->_view->assign('paginador', $paginador->getView('paginacion_ajax'));
        $this->_view->renderizar("index", "personas", "index");
    }
    public function consultar_ajax()
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
    public function consultaid_ajax($id)
    {
        if (!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
            echo json_encode($this->_sql->consultaid($id));
        } else {
            echo "Error Processing Request";
        }
    }
    public function insertar_ajax()
    {
        if (!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
            $result = $this->_sql->insertar(
                array(
                    $this->getText("txtname"),
                    $this->getText("txtlastname"),
                    $this->getText("txtcard"),
                    $this->getText("txtaddress"),
                    $this->getText("txtemail1"),
                    $this->getText("txtemail2"),
                    $this->getText("txtphone"),
                    $this->getText("txtbirthdate"),
                    $this->getInt("cb_blod"),
                    $this->getText("rd_genero"),
                    $this->getInt("cb_civil"),
                )
            );
            if ($result == 0) {
                echo json_encode(array("error" => "No se pudo registrar " . $result . $this->getInt('cb_civil')));
                exit;
            }
            echo json_encode("Se registro " . $result . "fila");
            exit;
        } else {
            echo "Error Processing Request";
        }
    }
    public function modificar_ajax()
    {
        if (!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
            $result = $this->_sql->modificar(
                array(
                    $this->getText("txtname"),
                    $this->getText("txtlastname"),
                    $this->getText("txtcard"),
                    $this->getText("txtaddress"),
                    $this->getText("txtemail1"),
                    $this->getText("txtemail2"),
                    $this->getText("txtphone"),
                    $this->getText("txtbirthdate"),
                    $this->getInt("cb_blod"),
                    $this->getText("rd_genero"),
                    $this->getInt("cb_civil"),
                    $this->getInt("id"),
                )
            );
            if ($result == 0) {
                echo json_encode(array("error" => "No se pudo registrar "));
                exit;
            }
            echo json_encode("Se modifico  " . $result . "fila");
            exit;
        } else {
            echo "";
        }
    }

}
