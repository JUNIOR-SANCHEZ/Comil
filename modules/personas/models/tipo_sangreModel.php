<?php
class tipo_sangreModel extends Model{
    public function __construct() {
        parent::__construct();
    }
    public function consulta()
    {
        try{
            $sql = "CALL tipos_sangre_consulta_proc();";
            $stmt = $this->_db->query($sql)->fetchAll(PDO::FETCH_ASSOC);
            return $stmt;

        }catch(PDOException $e){
            echo $e->getMessage();
            return null;
        }
    }
    public function insertar($dato)
    {
        try{
            $sql = "CALL tipos_sangre_insertar_proc(:desc)";
            $stmt = $this->_db->prepare($sql);
            $result = $stmt->execute(array(":desc"=>$dato));
            return $result;
        }catch(PDOException $e){
            echo $e->getMessage();
            return 0;
        }
    }
    public function modificar($dato)
    {
        try{
            $sql = "CALL tipos_sangre_modificar(:id,:des);";
            $stmt = $this->_db->prepare($sql);
            $result = $stmt->execute(array(":id"=>$dato[0],":des"=>$dato[1]));
            return $result;
        }catch(PDOException $e){
            echo $e->getMessage()."<br>";
            return 0;
        }
    }
    public function eliminar($id)
    {
        try{
            $sql = "CALL tipos_sangre_eliminar(:id);";
            $stmt = $this->_db->prepare($sql);
            $result = $stmt->execute(array(":id"=>$id));
            return $result;
        }catch(PDOException $e){
            echo $e->getMessage();
            return 0;
        }
    }
}