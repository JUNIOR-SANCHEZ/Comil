<?php
class menuModelWidget extends Model
{
    private $__registry;
    private $__acl;
    public function __construct()
    {
        parent::__construct();
        $this->_registry = Registry::getInstancia();
        $this->_acl = $this->_registry->_acl;
    }
    public function getmenu($menu)
    {
        $menus["sidenav"] = array();
        $menus["sidenav"][] = array(
            "id" => "personas",
            "title" => "Personas",
            "icon" => "fa-users",
            "sub-menu" => array(
                array(
                    "id" => "t_sangre",
                    "title" => "Tipo de Sangre",
                    "icon" => " fa-circle-o",
                    "link" => BASE_URL . "personas/tipo_sangre",
                ),
                array(
                    "id" => "s_civil",
                    "title" => "Estado Civil",
                    "icon" => " fa-circle-o",
                    "link" => BASE_URL . "personas/estado_civil",
                ),
                array(
                    "id" => "index",
                    "title" => "Personas",
                    "icon" => " fa-circle-o",
                    "link" => BASE_URL . "personas/",
                )
            )
        );

        $menus["sidenav"][] = array(
            "id" => "permisos",
            "title" => "Permisos",
            "icon" => "fa-hotel",
            "sub-menu" => array(
                array(
                    "id" => "permiso",
                    "title" => "Nuevo",
                    "icon" => " fa-circle-o",
                    "link" => BASE_URL . "permisos/"
                ),
            ),
        );

        if ($this->_acl->permiso("admin_access")) {
            $menus["sidenav"][] =
            array(
                "id" => "usuarios",
                "title" => "Permisos por usuario",
                "icon" => "fa-user",
                "link" => BASE_URL . "usuarios",
                "sub-menu" => array(),

            );
            $menus["sidenav"][] =
            array(
                "id" => "acl",
                "title" => "Control de acceso por rol",
                "icon" => "fa-group",
                "link" => BASE_URL . "acl",
                "sub-menu" => array(),

            );
            $menus["sidenav"][] =
            array(
                "id" => "registro",
                "title" => "Registrar nuevo usuario",
                "icon" => " fa-user-plus",
                "link" => BASE_URL . "usuarios/registro",
                "sub-menu" => array(),
            );
        }
        $menus["top"] = array();
        return $menus[$menu];
    }
}
