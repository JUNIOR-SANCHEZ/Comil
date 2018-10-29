<?php


class footerWidget extends Widget{
    public function __construct() {
    }
    public function getFooter($menu,$view,$invers = null){
        $data["menu"]=$menu;
        $data["invers"]=$invers;
        return $this->render($view,$data);
    }
    public function getConfigs($menu){
        $footer["footer"] = array(
            "position"=>"footer",
            "show"=>"all",
            "hide"=>array("")
        );
        return $footer[$menu];
    }
}
