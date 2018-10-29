<?php
class ACL
{
    //DECLARACION DE ATRIBUTOS DE LA CLASE ACL 
    private $_regitry;
    private $_db;
    private $_id;
    private $_role;
    private $_permisos;
    // EL METODO CONSTRUCTOR RECIBIRA UN PARAMETRO EN CASO DE QUE QUERAMOS TRABAJAR 
    // CON UN USUARIO EN PARTICULAR
    public function __construct($id = false)
    {
        // VALIDAMOS SI SE A ENVIADO EL ID DEL USUARIO MEDIANTE LA INSTANCIA DE LA
        // LA CLASE Y LE ASIGNAMOS AL ATRIBUTO _id
        if($id){
            $this->_id = (int) $id;
        }
        else{
        //SI NO VERIFICAMOS SI UN USUARIO A INICIADO SESSION Y OBTENEMOS SU ID DE USUARIO
        // Y LE ASIGNAMOS AL ATRIBUTO _id 
            if(Session::get('id')){
                $this->_id = Session::get('id');
            }
        // SI NO SE A ENVIADO EL ID POR LA CLASE O EL USUARIO NO A INICIADO SESSION 
        // ENTONCE EL ATRIBUTO _id PERMANECERA EN 0 LA CUAL SIGNIFICA QUE EL ACCESO
        // ESTARA RESTRINGIDO
            else{
                $this->_id = 0;
            }
        }
        // INICIALIZAMOS EL RESTO DE LOS ATRIBUTOS
        $this->_regitry = Registry::getInstancia();
        $this->_db = $this->_regitry->_db;
        $this->_role = $this->getRole();
        $this->_permisos = $this->getPermisosRole();
        $this->compilarAcl();
    }
    //ESTA FUNCION COMBINARA LOS PERMISOS DE ROL Y LOS PERMISOS DE USUARIO
    public function compilarAcl()
    {
        $this->_permisos = array_merge(
                $this->_permisos,
                $this->getPermisosUsuario()
                );
    }
    //EN ESTA FUNCION OBTENDREMOS EL ROL DEL USUARIO MEDIANTE EL _id QUE SE HAYA 
    //INICIALIZADO 
    public function getRole()
    {
        $role = $this->_db->query(
                "select role from usuarios " .
                "where id = {$this->_id}"
                );
                
        $role = $role->fetch();
        return $role['role'];
    }
    //EN ESTA FUNCION OBTENDREMOS TODOS LOS PERMISOS QUE TRAIGA EL _role QUE SE HAYA
    //INICIALIZADO Y LO DEVOLVEREMOS EN UN ARREGLO INDEXADO
    public function getPermisosRoleId()
    {
        $ids = $this->_db->query(
                "select permiso from permisos_role " .
                "where role = '{$this->_role}'"
                );
        $ids = $ids->fetchAll(PDO::FETCH_ASSOC);
        $id = array();
        for($i = 0; $i < count($ids); $i++){
            $id[] = $ids[$i]['permiso'];
        }
        return $id;
    }
    //ESTA FUNCION DEVOLVERA LOS PERMISO DEL ROL YA PROCESADOS MEDIANTE UN ARREGLO  
    //QUE DARA LA INFORMACION DE LOS PERMISO DE SU VALOR SI ESTA HABILITADO, SI ES
    //HEREDADO, ETC.
    public function getPermisosRole()
    {
        $permisos = $this->_db->query(
                "select * from permisos_role " .
                "where role = '{$this->_role}'"
                );
                
        $permisos = $permisos->fetchAll(PDO::FETCH_ASSOC);
        
        $data = array();
        
        for($i = 0; $i < count($permisos); $i++){
            $key = $this->getPermisoKey($permisos[$i]['permiso']);
            if($key == ''){continue;}
            
            if($permisos[$i]['valor'] == 1){
                $v = true;
            }
            else{
                $v = false;
            }
            
            $data[$key] = array(
                'key' => $key,
                'permiso' => $this->getPermisoNombre($permisos[$i]['permiso']),
                'valor' => $v,
                'heredado' => true,
                'id' => $permisos[$i]['permiso']
            );
        }
        
        return $data;
    }
    //ESTA FUNCION RECIBIRA UN PARAMETRO EL CUAL ES EL ID DE PERMISOS Y DEVOLVERA LA LLAVE 
    //DE LOS PERMISOS
    public function getPermisoKey($permisoID)
    {
        $permisoID = (int) $permisoID;
        
        $key = $this->_db->query(
                "select `key` from permisos " .
                "where id_permiso = {$permisoID}"
                );
                
        $key = $key->fetch();
        return $key['key'];
    }
    //ESTA FUNCION RECIBIRA UN PARAMETRO EL CUAL ES EL ID DE PERMISOS Y DEVOLVERA EL NOMBRE 
    //DE LOS PERMISOS
    public function getPermisoNombre($permisoID)
    {
        $permisoID = (int) $permisoID;
        
        $key = $this->_db->query(
                "select `permiso` from permisos " .
                "where id_permiso = {$permisoID}"
                );
                
        $key = $key->fetch();
        return $key['permiso'];
    }
    //ESTA FUNCION DEVOLVERA LOS PERMISO DEL USUARIO YA PROCESADOS MEDIANTE UN ARREGLO  
    //QUE DARA LA INFORMACION DE LOS PERMISO DE SU VALOR SI ESTA HABILITADO, SI ES
    //HEREDADO, ETC.
    public function getPermisosUsuario()
    {
        $ids = $this->getPermisosRoleId();
        
        if(count($ids)){
            $permisos = $this->_db->query(
                    "select * from permisos_usuario " .
                    "where usuario = {$this->_id} " .
                    "and permiso in (" . implode(",", $ids) . ")"
                    );

            $permisos = $permisos->fetchAll(PDO::FETCH_ASSOC);
        }
        else{
            $permisos = array();
        }
        
        $data = array();
        
        for($i = 0; $i < count($permisos); $i++){
            $key = $this->getPermisoKey($permisos[$i]['permiso']);
            if($key == ''){continue;}
            
            if($permisos[$i]['valor'] == 1){
                $v = true;
            }
            else{
                $v = false;
            }
            
            $data[$key] = array(
                'key' => $key,
                'permiso' => $this->getPermisoNombre($permisos[$i]['permiso']),
                'valor' => $v,
                'heredado' => false,
                'id' => $permisos[$i]['permiso']
            );
        }
        
        return $data;
    }
    //ESTA FUNCION DEVOLVERA LOS PERMISOS DEL USUARIO
    public function getPermisos()
    {
        if(isset($this->_permisos) && count($this->_permisos))
            return $this->_permisos;
    }
    public function permiso($key)
    {
        if(array_key_exists($key, $this->_permisos)){
            if($this->_permisos[$key]['valor'] == true || $this->_permisos[$key]['valor'] == 1){
                return true;
            }
        }
        return false;
    }
    public function acceso($key)
    {   
        if($this->permiso($key)){
            Session::tiempo();
            return;
        }
        header("location:" . BASE_URL . "error/access/5050");
        exit;
    }
}
?>