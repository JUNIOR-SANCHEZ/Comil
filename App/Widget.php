<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

abstract class Widget {

    protected function loadModel($model) {
        if (is_readable(ROOT . "widgets" . DS . "models" . DS . $model . ".php")){
            include_once ROOT . "widgets" . DS . "models" . DS . $model . ".php";
            
            $modelClass = $model ."ModelWidget";
            
            if(class_exists($modelClass)){
                return new $modelClass;
            }
        } else {
            throw  new Exception("Error modelo de widget");
        }
    }

    protected function render($view,$data=array(),$ext="php") {
        if (is_readable(ROOT . "widgets" . DS . "views" . DS . $view . ".".$ext)){
            ob_start();
            extract($data);
            include ROOT . "widgets" . DS . "views" . DS . $view . ".".$ext;
            $content = ob_get_contents();
            ob_end_clean();
            return $content;
        }else{
            throw new Exception("Error vista widget");
        }
    }

}
