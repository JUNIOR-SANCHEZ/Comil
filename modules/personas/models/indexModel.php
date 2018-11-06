<?php
class indexModel extends Model{
    public function __construct() {
        parent::__construct();
    }
    public function consulta(){
        try{
            $sql = "CALL personal_proc('consulta',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);";
            $stmt = $this->_db->query($sql)->fetchAll(PDO::FETCH_ASSOC);
            return $stmt;
        }catch(PDOException $e){
            $error = $e->getMessage();
            return $error;
        }
    }
    public function consultaid($id)
    {
        try{
            $sql = "CALL personal_proc('consultaid',:id,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);";
            $stmt = $this->_db->prepare($sql);
            $stmt->execute(array(":id"=>$id));
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
            return $result;
        }catch(PDOException $e){
            $error = $e->getMessage();
            return $error;
        }
    }
    public function civilstatus()
    {
        try{
            $sql = "CALL estados_civil_proc('activos',null,null,null);";
            $stmt = $this->_db->query($sql)->fetchAll(PDO::FETCH_ASSOC);
            return $stmt;
        }catch(PDOException $e){
            echo $e->getMessage();
            return null;
        }
    }
    public function blood()
    {
        try{
            $sql = "CALL tipos_sangre_proc('activos',NULL,NULL,NULL);";
            $stmt = $this->_db->query($sql)->fetchAll(PDO::FETCH_ASSOC);
            return $stmt;

        }catch(PDOException $e){
            echo $e->getMessage();
            return null;
        }
    }
    public function gender()
    {
        try{
            $sql = "CALL generos_proc('activos',NULL,NULL,NULL);";
            $stmt = $this->_db->query($sql)->fetchAll(PDO::FETCH_ASSOC);
            return $stmt;

        }catch(PDOException $e){
            echo $e->getMessage();
            return null;
        }
    }
    public function insertar(array $dato){
        try{
            $sql = "CALL personal_proc('insertar',NULL,:name,:lastname,:card,:address,:email1,:email2,:phone,:birthdate,:blood,:gender,:civil,NULL);";
            $stmt = $this->_db->prepare($sql);
            $result = $stmt->execute(array(
                ":name"=>$dato[0],
                ":lastname"=>$dato[1],
                ":card"=>$dato[2],
                ":address"=>$dato[3],
                ":email1"=>$dato[4],
                ":email2"=>$dato[5],
                ":phone"=>$dato[6],
                ":birthdate"=>$dato[7],
                ":blood"=>$dato[8],
                ":gender"=>$dato[9],
                ":civil"=>$dato[10]
            ));
            return $result;
        }catch(PDOException $e){
            $error = $e->getMessage();
            return $error;
        }
    }
    public function modificar(array $dato){
        try{
            $sql = "CALL personal_proc('modificar',:id,:name,:lastname,:card,:address,:email1,:email2,:phone,:birthdate,:blood,:gender,:civil,NULL);";
            $stmt = $this->_db->prepare($sql);
            $result = $stmt->execute(array(
                ":name"=>$dato[0],
                ":lastname"=>$dato[1],
                ":card"=>$dato[2],
                ":address"=>$dato[3],
                ":email1"=>$dato[4],
                ":email2"=>$dato[5],
                ":phone"=>$dato[6],
                ":birthdate"=>$dato[7],
                ":blood"=>$dato[8],
                ":gender"=>$dato[9],
                ":civil"=>$dato[10],
                ":id"=>$dato[11]
            ));
            return $result;
        }catch(PDOException $e){
            $error = $e->getMessage();
            return $error;
        }
    }
    public function eliminar($id){
        try{
            $sql = "CALL personal_proc('consulta',:id,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);";
            $stmt = $this->_db->prepare($sql);
            $result = $stmt->execute(array(
                ":id"=>$id
            ));
            return $result;
        }catch(PDOException $e){
            $error = $e->getMessage();
            return $error;
        }
    }
}