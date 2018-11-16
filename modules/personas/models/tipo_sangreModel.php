<?php
class tipo_sangreModel extends Model{
    public function __construct() {
        parent::__construct();
    }
    /**
     * TODO: CRUD PARA EL REGISTRO DEL TIPO DE SANGRE DE LA PERSONA 
     */
    public function consulta()
    {
        try{
            $sql = "CALL tipos_sangre_proc('consulta',NULL,NULL,NULL);";
            $stmt = $this->_db->query($sql)->fetchAll(PDO::FETCH_ASSOC);
            return $stmt;

        }catch(PDOException $e){
            return $e->getMessage();
        }
    }
    public function insertar($description)
    {
        try{
            $sql = "CALL tipos_sangre_proc('insertar',NULL,:description,NULL);"; 
            $stmt = $this->_db->prepare($sql);
            $result = $stmt->execute(array(":description"=>$description));
            return $result;
        }catch(PDOException $e){
            return $e->getMessage();
        }
    }
    public function modificar($dato)
    {
        try{
            $sql = "CALL tipos_sangre_proc('modificar',:id,:description,NULL);";
            $stmt = $this->_db->prepare($sql);
            $result = $stmt->execute(array(":id"=>$dato[0],":description"=>$dato[1]));
            return $result;
        }catch(PDOException $e){
            return $e->getMessage();
        }
    }
    public function eliminar($id)
    {
        try{
            $sql = "CALL tipos_sangre_proc('estado',:id,NULL,NULL);";
            $stmt = $this->_db->prepare($sql);
            $result = $stmt->execute(array(":id"=>$id));
            return $result;
        }catch(PDOException $e){
            echo $e->getMessage();
            return 0;
        }
    }

    /**
     * FIXME: ELIMINAR FUNCION NO SE VA A UTILIZAR
     */
    public function autocomplete($dato){
        try{
            $sql = "CALL tipos_sangre_autocomplete_proc(:data)";
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