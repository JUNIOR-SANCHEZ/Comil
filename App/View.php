<?php

require_once ROOT . "libs" . DS . "smarty" . DS . "libs" . DS . "Smarty.class.php";

class View extends Smarty
{

    private $_request;
    private $_js;
    private $_css;
    private $_template;
    private $_acl;
    private $_rutas;
    private $_jsPlugin;
    private $_cssPlugin;
    private static $_item;
    private static $_subitem;
    private $_widget;

    public function __construct(Request $peticion, ACL $_acl)
    {
        parent::__construct();
        $this->_request = $peticion;
        $this->_js = array();
        $this->_css = array();
        $this->_template = DEFAULT_LAYOUT;
        $this->_acl = $_acl;
        $this->_rutas = array();
        $this->_jsPlugin = array();
        $this->_cssPlugin = array();
        self::$_item = null;
        self::$_subitem = null;

        $modulo = $this->_request->getModulo();
        $controlador = $this->_request->getControlador();
        if ($modulo) {
            $this->_rutas["view"] = ROOT . "modules" . DS . $modulo . DS . "views" . DS . $controlador . DS;
            $this->_rutas["js"] = BASE_URL . "modules/" . $modulo . "/views/" . $controlador . '/js/';
            $this->_rutas["css"] = BASE_URL . "modules/" . $modulo . "/views/" . $controlador . '/css/';
        } else {
            $this->_rutas["view"] = ROOT . "views" . DS . $controlador . DS;
            $this->_rutas["js"] = BASE_URL . "/views/" . $controlador . '/js/';
            $this->_rutas["css"] = BASE_URL . "/views/" . $controlador . '/css/';
        }
    }
    public static function getViewId()
    {
        return self::$_item;
    }
    public static function getSubViewId()
    {
        return self::$_subitem;
    }
    public function renderizar($vista, $item = false, $subitem = false, $noLayout = false)
    {
        if ($item) {
            self::$_item = $item;
        }
        if ($subitem) {
            self::$_subitem = $subitem;
        }
        $this->template_dir = ROOT . "views" . DS . "layout" . DS . $this->_template . DS;
        $this->config_dir = ROOT . "views" . DS . "layout" . DS . $this->_template . DS . "configs" . DS;
        $this->cache_dir = ROOT . "tmp" . DS . "cahe" . DS;
        $this->compile_dir = ROOT . "tmp" . DS . "template" . DS;
        $js = array();
        if (count($this->_js)) {
            $js = $this->_js;
        }
        $css = array();
        if (count($this->_css)) {
            $css = $this->_css;
        }
        $params = array(
            'ruta_css' => BASE_URL . 'views/layout/' . $this->_template . '/css/',
            'ruta_js' => BASE_URL . 'views/layout/' . $this->_template . '/js/',
            'ruta_file' => BASE_URL . 'views/layout/' . $this->_template . '/file/',
            'ruta_img' => BASE_URL . 'views/layout/' . $this->_template . '/img/',
            'ruta_assets' => BASE_URL . 'views/layout/' . $this->_template . '/assets/',
            'ruta_dist' => BASE_URL . 'views/layout/' . $this->_template . '/dist/',
            'ruta_puglins' => BASE_URL . 'views/layout/' . $this->_template . '/plugins/',
            'js' => $js,
            'css' => $css,
            'jsPlugin' => $this->_jsPlugin,
            'cssPlugin' => $this->_cssPlugin,
            'root' => BASE_URL,
            'configs' => array(
                'app_name' => APP_NAME,
                'app_slogan' => APP_SLOGAN,
                'app_company' => APP_COMPANY,
            ),
        );
        if (is_readable($this->_rutas["view"] . $vista . ".tpl")) {
            if ($noLayout) {
                $this->assign("_layoutParams", $params);
                $this->assign("_acl", $this->_acl);
                $this->template_dir = $this->_rutas["view"];
                $this->display($this->_rutas["view"] . $vista . ".tpl");
                exit;
            }

            $this->assign("_contenido", $this->_rutas["view"] . $vista . ".tpl");
        } else {
            throw new Exception("Error dela vista");
        }
        $this->assign("widgets", $this->getWidgets());
        $this->assign("_acl", $this->_acl);
        $this->assign("_layoutParams", $params);
        $this->display("template.tpl");
    }
    public function setJs($js)
    {

        if (is_array($js) && count($js)) {
            for ($i = 0; $i < count($js); $i++) {
                $this->_js[] = $this->_rutas["js"] . $js[$i] . '.js';
            }
        } else {
            throw new Exception("Error el parametro enviado no es un array");
        }
    }
    public function setCss($css)
    {

        if (is_array($css) && count($css)) {
            for ($i = 0; $i < count($css); $i++) {
                $this->_css[] = $this->_rutas["css"] . $css[$i] . '.css';
            }
        } else {
            throw new Exception("Error el parametro enviado no es un array");
            exit;
        }

    }
    public function setTemplate($template)
    {
        $this->_template = (string) $template;
    }
    public function setJsPlugin(array $js)
    {
        if (is_array($js) && count($js)) {
            for ($i = 0; $i < count($js); $i++) {
                $this->_jsPlugin[] = BASE_URL . "public/js/" . $js[$i] . ".js";
            }
        } else {
            throw new Exception("Error de js plugin");
        }
    }
    public function setCssPlugin(array $css)
    {
        if (is_array($css) && count($css)) {
            for ($i = 0; $i < count($css); $i++) {
                $this->_cssPlugin[] = BASE_URL . "public/css/" . $js[$i] . ".css";
            }
        } else {
            throw new Exception("El dato enviado no es un array");
        }
    }

    public function widget($widget, $method, $options = array())
    {
        if (!is_array($options)) {
            $options = array($options);
        }
        if (is_readable(ROOT . "widgets" . DS . $widget . ".php")) {
            include_once ROOT . "widgets" . DS . $widget . ".php";

            $widgetClass = $widget . "Widget";

            if (!class_exists($widgetClass)) {
                throw new Exception("Error clase widget");
            }

            if (is_callable($widgetClass, $method)) {
                if (count($options)) {
                    return call_user_func_array(array(new $widgetClass, $method), $options);
                } else {
                    return call_user_func(array(new $widgetClass, $method));
                }
            }
            throw new Exception("Error metodo widget");
        }
        throw new Exception("Error de widget");
    }
    //OBTENEMOS EL ARCHIVO DONDE SE ENCUENTRA LA CONFIGURACION DE LOS LAYOUT E INCLUIREMOS
    //ESTE ARCHIVO PARA OCUPARLA EN LA CLASE
    public function getLayoutPosition()
    {
        if (is_readable(ROOT . "views" . DS . "layout" . DS . $this->_template . DS . "configs.php")) {
            include_once ROOT . "views" . DS . "layout" . DS . $this->_template . DS . "configs.php";
            return get_layout_positions();
        }
        throw new Exception("Error configuracion layout");
    }
    //DEVOLVERA LOS WIDGES CONFIGURADOS
    public function getWidgets()
    {
        $widgets = array(
            "menu-top" => array(
                "config" => $this->widget("menu", "getConfigs", array("top")),
                "content" => array("menu", "getMenu", array("top", "top")),
            ),
            "menu-sidenav" => array(
                "config" => $this->widget("menu", "getConfigs", array("sidenav")),
                "content" => array("menu", "getMenu", array("sidenav", "sidenav")),
            ),
            "footer" => array(
                "config" => $this->widget("footer", "getConfigs", array("footer")),
                "content" => array("footer", "getFooter", array("footer", "footer")),
            ),
        );

        $position = $this->getLayoutPosition();
        $keys = array_keys($widgets);
        foreach ($keys as $k) {
            // VRTIFICAR SI LA POSICION DEL WIDGET ESTA PRESENTE
            if (isset($position[$widgets[$k]["config"]["position"]])) {
                //VERIFICAR SI ESTA HABILITADO PARA LA VISTA
                if (!isset($widgets[$k]["config"]["hide"]) || !in_array(self::$_item, $widgets[$k]["config"]["hide"])) {
                    //VERIFICAR SI ESTA HABILITADO A LA VISTA
                    if ($widgets[$k]["config"]["show"] === "all" || in_array(self::$_item, $widgets[$k]["config"]["show"])) {
                        //LLENA LA POSICION DEL LAYOUT
                        if (isset($this->_widget[$k])) {
                            $widgets[$k]["content"][2] = $this->_widget[$k];
                        }
                        $position[$widgets[$k]["config"]["position"]][] = $this->getWidgetConent($widgets[$k]["content"]);
                    }
                }
            }
        }
        return $position;
    }
    //VERIFICA SI SE ESTA ENVIANDO EL WIDGET Y EL METODO
    public function getWidgetConent(array $content)
    {
        if (!isset($content[0]) || !isset($content[1])) {
            throw new Exception("Error contenido widget");
            return;
        }
        if (!isset($content[2])) {
            $content[2] = array();
        }
        return $this->widget($content[0], $content[1], $content[2]);
    }

    public function setWidgetOptions($key, $option)
    {
        $this->_widget[$key] = $option;
    }

}
