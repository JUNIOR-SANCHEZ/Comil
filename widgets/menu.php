<?php

class menuWidget extends Widget{
    
    private $modelo;
    
    public function __construct() {
        
        
        $this->modelo= $this->loadModel("menu");
        
        
    }

    public function getMenu($menu,$view,$invers = null){
        $data["menu"]= $this->modelo->getMenu($menu);
        $data["invers"]=$invers;
        return $this->render($view,$data);
    }
    
    public function getConfigs($menu){

        //CONFIGURACION DE MENU QUE SE MUESTRA EN TODA LA APLICACION 
        $menus["top"] = array(
            "position"=>"top",
            "show"=>"all",
           "hide"=>array()
        );

        $menus["sidenav"] = array(
            "position"=>"sidenav",
            "show"=>"all",
            "hide"=>array(""),
        );
        return $menus[$menu];
    }
}