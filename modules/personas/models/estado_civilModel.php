<?php
class estado_civilModel extends Model{
    public function __construct() {
        parent::__construct();
    }
    public function consulta(){
        try{
            $sql = "CALL estados_civil_proc('consulta',null,null,null);";
            $stmt = $this->_db->query($sql)->fetchAll(PDO::FETCH_ASSOC);
            return $stmt;
        }catch(PDOException $e){
            echo $e->getMessage();
            return null;
        }
    }
    public function insertar($description){
        try{
            $sql = "CALL estados_civil_proc('insertar',null,:description,null);";
            $stmt = $this->_db->prepare($sql);
            $result = $stmt->execute(array(":description"=>$description));
            return $result;
        }catch(PDOException $e){
            return $e->getMessage();
        }
    }
    public function modificar($dato){
        try{
            $sql = "CALL estados_civil_proc('modificar',:id,:description,null);";
            $stmt = $this->_db->prepare($sql);
            $result = $stmt->execute(array(":id"=>$dato[0],":description"=>$dato[1]));
            return $result;
        }catch(PDOException $e){
            echo $e->getMessage();
            return 0;
        }
    }
    public function estado($id){
        try{
            $sql = "CALL estados_civil_proc('estado',:id,null,null);";
            $stmt = $this->_db->prepare($sql);
            $result = $stmt->execute(array(":id"=>$id));
            return $result;
        }catch(PDOException $e){
            echo $e->getMessage();
            return 0;
        }
    }
    public function autocomplete($dato){
        try{
            $sql = "CALL estados_civil_autocomplete_proc(:data)";
            $stmt = $this->_db->prepare($sql);
            $stmt->execute(array(":data"=>$dato));
            $result = $stmt->fetchAll(PDO::FETCH_NUM);
            $array = array();
            foreach($result as $row){
                $array[] = $row[0];
            }
            return $array;
        }catch(PDOException $e){
            echo $e->getMessage();
            return null;
        }
    }
}