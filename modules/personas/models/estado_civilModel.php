<?php
class tipo_sangreModel extends Model{
    public function __construct() {
        parent::__construct();
    }
    public function consulta(){
        try{
            $sql = "";
            $stmt = $this->_db->query($sql)->fetchAll(PDO::FETCH_ASSOC);
            return stmt;
        }catch(PDOException $e){
            echo $e->getMessage();
            return null;
        }
    }
    public function insertar($dato){
        try{
        }catch(PDOException $e){
            echo $e->getMessage();
            return 0;
        }
    }
    public function modificar($dato){
        try{
        }catch(PDOException $e){
            echo $e->getMessage();
            return 0;
        }
    }
    public function eliminar($id){
        try{
        }catch(PDOException $e){
            echo $e->getMessage();
            return 0;
        }
    }
}