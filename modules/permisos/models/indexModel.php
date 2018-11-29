<?php
class indexModel extends Model
{
    public function __construct()
    {
        parent::__construct();
    }
    public function consulta()
    {
        try {
            $sql = "CALL permisos_personas_proc('consultasdia',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);";
            $stmt = $this->_db->query($sql)->fetchAll(PDO::FETCH_ASSOC);
            return $stmt;
        } catch (PDOException $e) {
            echo $e->getMessage();
            return null;
        }
    } 
    public function consulta_id($id)
    {
        try {
            $sql = "CALL permisos_personas_proc('consultaid',:id,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);";
            $stmt = $this->_db->prepare($sql);
            $stmt->execute(array(':id' => $id));
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
            return $result;
        } catch (PDOException $e) {
            echo $e->getMessage();
            return null;
        }
    }
    public function motivos()
    {
        try {
            $sql = 'CALL motivos_proc("consultas",NULL,NULL,NULL);';
            $stmt = $this->_db->query($sql)->fetchAll(PDO::FETCH_ASSOC);
            return $stmt;
        } catch (PDOException $e) {
            echo $e->getMessage();
            return null;
        }
    }
    public function personas(){
        try{
            $sql = "CALL personal_proc('consulta',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);";
            $stmt = $this->_db->query($sql)->fetchAll(PDO::FETCH_ASSOC);
            return $stmt;
        }catch(PDOException $e){
            $error = $e->getMessage();
            return $error;
        }
    }
    public function insertar($dato)
    {
        try {
            $sql = "CALL permisos_personas_proc('insertar',NULL,:id_pers,:id_mot,:fecha,:salida,:llegada,:inputable,NUll,:tipo,:detalle);";
            $stmt = $this->_db->prepare($sql);
            $result = $stmt->execute(array(
                ':id_pers'=> $dato[0],
                ':id_mot'=> $dato[1],
                ':fecha'=> $dato[2],
                ':salida'=> $dato[3],
                ':llegada'=> $dato[4],
                ':inputable'=> $dato[5],
                ':tipo'=> $dato[6],
                ':detalle'=> $dato[7]
                
            ));
            return $result;
        } catch (PDOException $e) {
            echo $e->getMessage();
            return 0;
        }
    }
    public function modificar($dato)
    {
        try {
            $sql = "CALL permisos_personas_proc('modificar',:id,:id_pers,:id_mot,:fecha,:salida,:llegada,:inputable,NUll,:tipo,:detalle);";
            $stmt = $this->_db->prepare($sql);
            $result = $stmt->execute(array(
                ':id_pers'=> $dato[0],
                ':id_mot'=> $dato[1],
                ':fecha'=> $dato[2],
                ':salida'=> $dato[3],
                ':llegada'=> $dato[4],
                ':inputable'=> $dato[5],
                ':tipo'=> $dato[6],
                ':detalle'=> $dato[7],
                ':id'=>$dato[8]
            ));
            return $result;
        } catch (PDOException $e) {
            echo $e->getMessage();
            return 0;
        }
    }
    public function eliminar($id)
    {
        try {
            $sql = "";
            $stmt = $this->_db->prepare($sql);
            $result = $stmt->execute(array());
            return $result;
        } catch (PDOException $e) {
            echo $e->getMessage();
            return 0;
        }
    }
}
