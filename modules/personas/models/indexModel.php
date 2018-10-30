<?php
class indexModel extends Model{
    public function __construct() {
        parent::__construct();
    }
    public function consulta(){
        try{
            $sql = "CALL personal_consulta_proc();";
            $stmt = $this->_db->query($sql)->fetchAll(PDO::FETCH_ASSOC);
            return $stmt;
        }catch(PDOException $e){
            echo $e->getMessage();
            return null;
        }
    }
    public function insertar($dato){
        try{
            $sql = "";
            $stmt = $this->_db->prepare($sql);
            $result = $stmt->execute(array(""));
            return $result;
        }catch(PDOException $e){
            echo $e->getMessage();
            return 0;
        }
    }
    public function modificar($dato){
        try{
            $sql = "";
            $stmt = $this->_db->prepare($sql);
            $result = $stmt->execute(array());
            return $result;
        }catch(PDOException $e){
            echo $e->getMessage();
            return 0;
        }
    }
    public function eliminar($id){
        try{
            $sql = "";
            $stmt = $this->_db->prepare($sql);
            $result = $stmt->execute(array());
            return $result;
        }catch(PDOException $e){
            echo $e->getMessage();
            return 0;
        }
    }
}