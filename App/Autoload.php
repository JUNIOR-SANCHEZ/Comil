<?php

function autoloadCore($class)
{
    if (file_exists(APP_PATH . ucfirst(strtolower($class)) . ".php")) {
        include APP_PATH . ucfirst(strtolower($class)) . ".php";
    }
}

function autoloadLibs($class)
{
    if (file_exists(ROOT . "libs" . DS . "class." . strtolower($class) . ".php")) {
        include ROOT . "libs" . DS . "class." . strtolower($class) . ".php";
    }
}
function autoloadEntidades($class)
{

    if (file_exists(ROOT . "entidades" . DS . "entidades." . strtolower($class) . ".php")) {
        include ROOT . "entidades" . DS . "entidades." . strtolower($class) . ".php";
    }
}

spl_autoload_register("autoloadCore");
spl_autoload_register("autoloadLibs");
spl_autoload_register("autoloadEntidades");
