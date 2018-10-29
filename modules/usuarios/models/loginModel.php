<?php

class loginModel extends Model{
    public function __construct() {
        parent::__construct();
    }
    //FUNCION DE ACCESO A LA APLICACION (LOGIN)
    public function getUser($user,$pass){
        $pass = Cifrado::getHash("sha1", $pass, HASH_KEY);
        $sql = "
        SELECT a.id, a.role, b.role AS rol_name, a.usuario, a.apellidos,' ',a.nombres, a.img
        FROM usuarios a, roles b
        WHERE a.role = b.id_role
        AND (a.usuario = :user OR a.email = :user)
        AND a.pass = :pass;
        ";
        $rows = $this->_db->prepare($sql);
        $rows->bindParam(':user',$user, PDO::PARAM_STR);
        $rows->bindParam(':pass',$pass , PDO::PARAM_STR);
        $rows->execute();
        return $rows->fetch();
    }
}