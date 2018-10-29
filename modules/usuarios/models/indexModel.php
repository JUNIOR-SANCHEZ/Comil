<?php

class indexModel extends Model
{
    public function __construct()
    {
        parent::__construct();
    }
    
    public function getUsuarios($dato)
    {
        $usuarios = $this->_db->prepare(
                "select u.*,r.role from usuarios u, roles r ".
                "where u.role = r.id_role "
                . " AND u.usuario Like :nombre;"
                );
         $usuarios->execute(array(
            ":nombre"=>"%$dato%"
        ));
        $resp = $usuarios->fetchAll(PDO::FETCH_ASSOC);
        return $resp;
    }
    
    public function getUsuario($usuarioID)
    {
         $usuarios = $this->_db->query(
                "select u.usuario,r.role from usuarios u, roles r ".
                "where u.role = r.id_role and u.id = $usuarioID"
                );
        return $usuarios->fetch();
    }
    
    public function getPermisosUsuario($usuarioID)
    {
        $acl = new ACL($usuarioID);
        return $acl->getPermisos();
    }
    
    public function getPermisosRole($usuarioID)
    {
        $acl = new ACL($usuarioID);
        return $acl->getPermisosRole();
    }
    
    public function eliminarPermiso($usuarioID, $permisoID)
    {
        $this->_db->query(
                "delete from permisos_usuario where ".
                "usuario = $usuarioID and permiso = $permisoID"
                );
    }
    
    public function editarPermiso($usuarioID, $permisoID, $valor)
    {
        $this->_db->query(
                "replace into permisos_usuario set ".
                "usuario = $usuarioID , permiso = $permisoID, valor ='$valor'"
                );
    }
    public function eliminarUsuario($id){
        $this->_db->query("CALL eliminarUsuario($id);");
    }
}

?>
