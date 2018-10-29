<?php

class Bootstrap {

    public static function run(Request $peticion) {
        $modulo = $peticion->getModulo();
        $contoller = $peticion->getControlador() . "Controller";

        $metodo = $peticion->getMetodo();
        $args = $peticion->getArgs();
        if ($modulo) {
             $rutaModulo = ROOT . "controllers" . DS . $modulo . "Controller.php";
            if (is_readable($rutaModulo)) {
                require_once $rutaModulo;
                $rutaControlador = ROOT . "modules" . DS . $modulo . DS . "controllers" . DS . $contoller . ".php";
            } else {

                throw new Exception("Error de base de modulo");
            }
        } else {
            $rutaControlador = ROOT . "controllers" . DS . $contoller . ".php";
        }
        if (is_readable($rutaControlador)) {
            require_once $rutaControlador;
            $contoller = new $contoller;

            if (is_callable(array($contoller, $metodo))) {
                $metodo = $peticion->getMetodo();
            } else {
                $metodo = "index";
            }

            if (isset($args)) {
                call_user_func_array(array($contoller, $metodo), $args);
            } else {
                call_user_func(array($contoller, $metodo));
            }
        } else {
            echo $rutaControlador ."<br>";
            throw new Exception("No se encontro la ruta actual");
        }
    }

}
