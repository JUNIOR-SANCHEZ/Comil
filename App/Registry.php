<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Registry {

    private static $_instancia;
    private $_data;

    //no se pueda instaciar la clase
    private function __construct() {
        
    }

    public static function getInstancia() {
        if(!self::$_instancia instanceof self){
            self::$_instancia = new Registry();
        }
        return self::$_instancia;
    }
    
    public function __set($name, $value) {
        $this->_data[$name] = $value;
    }
    
    public function __get($name) {
        if(isset($this->_data[$name])){
            return $this->_data[$name];
        }
        return false;
    }

}

