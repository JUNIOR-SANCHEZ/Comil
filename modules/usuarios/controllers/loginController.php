<?php

class loginController extends Controller {
    private $_login;
    public function __construct() {
        parent::__construct();
        
        $this->_login = $this->loadModel('login');
        $this->_view->setTemplate("login");
    }
    public function index() {
        // ARCHIVOS ADJUNTOS
        $this->_view->assign("titulo","Login");
        if ($this->getInt('login') == 1) {
            $this->_view->assign("datos",$_POST);
            if(!$this->getText('user')){
                 $this->_view->assign("_error","Escriba el nombre de usuario");
                $this->_view->renderizar('index', 'login');
                exit;
            }
            if(!$this->getSql('password')){
                 $this->_view->assign("_error","Escriba una contraseña");
                 $this->_view->renderizar('index', 'login');
                exit;
            }
            
            $row = $this->_login->getUser(
                    $this->getText('user'),
                    $this->getSql('password')
                    ); 
            if(!$row){
                $this->_view->assign("_error","Usuario y/o contraseña incorrecta");
                 $this->_view->renderizar('index', 'login');
                exit;
            }
            $this->_view->datos="Session";
            Session::set('autenticado', true);
            Session::set('level', $row['role']);
            Session::set('rol_name', $row['rol_name']);
            Session::set("id", $row["id"]);
            Session::set('usuario', $row['usuario']);
            Session::set('nombre', $row['nombres']);
            Session::set('img', $row['img']);
            Session::set('apellido', $row['apellidos']);
            Session::set('tiempo', time());
            
            $this->redireccionar();
        }
        $this->_view->renderizar('index', 'login');
    }
    public function cerrar() {
        Session::destroy();
        $this->redireccionar("usuarios/login");
    }
}
