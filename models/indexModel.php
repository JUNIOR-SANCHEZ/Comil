<?php
class indexModel extends Model
{
    public function __construct()
    {
        parent::__construct();
    }

    public function lista()
    {
       $stmt =  $this->_db->query("SELECT * FROM departamentos")->fetchAll(PDO::FETCH_OBJ);
        $list = array();
        foreach ($stmt as $dato) {
            $p = new Proveedor;
            $p->setNombre($dato->nombre_departamento);
            $p->setDescripcion($dato->descripcion_departamento);
            array_push($list,$p);
        }
        return $list;
    }
}
