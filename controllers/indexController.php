<?php

class indexController extends Controller
{
    
    public function __construct()
    {
        parent::__construct();
        
    }
    public function index()
    {
        $this->_view->assign("title","Bienvenidos");
        $this->_view->renderizar("index","index");
    }
}