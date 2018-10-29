<?php

class registroModel extends Model {

    public function __construct() {
        parent::__construct();
    }
    //FUNCION QUE PERMITE VERIFICAR SI EL EMAIL YA EXISTE
    public function checkEmail($email) {
        $result = $this->_db->prepare("SELECT * FROM usuarios WHERE email = :email;");
        $result->bindParam(":email", $email, PDO::PARAM_STR);
        $result->execute();
        if ($result->fetch()) {
            return true;
        }

        return false;
    }
    //FUNCION QUE PERMITE VERIFICAR SI EL NOMBRE DE USUARIO YA EXISTE
    public function checkUser($user) {
        $result = $this->_db->prepare("SELECT * FROM usuarios WHERE usuario = :user;");
        $result->bindParam(":user", $user, PDO::PARAM_STR);
        $result->execute();
        if ($result->fetch()) {
            return true;
        }

        return false;
    }
    //FUNCIÓN QUE PERMITE LA INSERCIÓN DE NUEVOS USUARIOS A LA PÁGINA
    public function addUser(
        $nombres,
        $apellidos,
        $usuario,
        $password,
        $email,
        $cedula,
        $role,
        $img
    ) {
    
       $this->table("usuarios");
       $this->executeSql(array(
        $nombres,
        $apellidos,
        $usuario,
        Cifrado::getHash("sha1", $password, HASH_KEY),
        $email,
        $cedula,
        $role,
        $img,
        0,
        uniqid(),
       ));
    }
    //FUNCIÓN QUE PERMITE EDITAR LOS USUARIOS REGISTRADOS EN LA PÁGINA
    public function editUser($img,$name, $user, $email, $phone, $sexo, $estado,$ocupacion, $id = false) {
        if (!$id) {
            $id = Session::get("id");
        }
        $statement = $this->_db->prepare("CALL modificarUsuario(:img,:name,:user,:email,:phone,:sexo,:estadoCivil,:ocupacion,:id);");
        $statement->bindParam(":name", $name, PDO::PARAM_STR);
        $statement->bindParam(":user", $user, PDO::PARAM_STR);
        $statement->bindParam(":img", $img, PDO::PARAM_STR);
        $statement->bindParam(":email", $email, PDO::PARAM_STR);
        $statement->bindParam(":ocupacion", $ocupacion, PDO::PARAM_STR);
        $statement->bindParam(":phone", $phone, PDO::PARAM_STR);
        $statement->bindParam(":sexo", $sexo, PDO::PARAM_STR);
        $statement->bindParam(":estadoCivil", $estado, PDO::PARAM_STR);
        $statement->bindParam(":id", $id, PDO::PARAM_INT);
        

        $statement->execute();
    }
    //FUNCIÓN QUE PERMITE OBTENER LOS REGISTROS DE UN USUARIO A TRAVES DE UN ID
    public function getUserById($id) {
        $strt = $this->_db->prepare("SELECT * FROM usuarios WHERE id = :id");
        $strt->bindParam(":id", $id, PDO::PARAM_STR);
        $strt->execute();
        $result = $strt->fetch(PDO::FETCH_ASSOC);
        return $result;
    }
    public function getcargos(Type $var = null)
    {
        $stmt = $this->_db->query("SELECT * FROM roles;");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

}
