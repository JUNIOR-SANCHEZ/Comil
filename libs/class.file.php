<?php

class file
{
    private $_formatos_soportados = ['image/png', 'image/jpg', 'image/jpeg', 'image/gif'];
    private $_formatos_soportados_doc = ['application/msword','application/pdf','application/vnd.openxmlformats-officedocument.wordprocessingml.document'];
    private $extension;
    private $file;
    public $error;
    public $uploaded = false;
    public $file_new_name_body;
    public $file_name_body; 
    public $processed = false;
    public function __construct($file)
    {
        $this->file = $file;
        $this->extension = $this->extension();
        $this->file_name_body = $file['name'];
        if (empty($this->file['name']) || !isset($this->file['name'])) {
            $this->processed = false;
            $this->error = "No contiene ingun archivo";
        } else {
            $this->uploaded = true;
        }

    } 
    public function process_img($ruta)
    {
        if (is_array($this->file)) {
            if (in_array($this->file["type"], $this->_formatos_soportados)) {
                if (!empty($this->file_new_name_body)) {
                    move_uploaded_file($this->file["tmp_name"], $ruta . $this->file_new_name_body . $this->extension);
                    $this->file_name_body = $this->file_new_name_body . $this->extension;
                } else {
                    move_uploaded_file($this->file["tmp_name"], $ruta . $this->file["name"]);
                }
                $this->processed = true;
            } else {
                $this->error = "Extension no permitida";
                $this->processed = false;
            }
        } else {
            $this->error = "File no contiene ningun archivo";
            $this->processed = false;
        }
        
    }
   
    public function process_doc($ruta)
    {
        if (is_array($this->file)) {
            if (in_array($this->file["type"], $this->_formatos_soportados_doc)) {
                if (!empty($this->file_new_name_body)) {
                    move_uploaded_file($this->file["tmp_name"], $ruta . $this->file_new_name_body . $this->extension);
                    $this->file_name_body = $this->file_new_name_body . $this->extension;
                } else {
                    move_uploaded_file($this->file["tmp_name"], $ruta . $this->file["name"]);
                }
                $this->processed = true;
            } else {
                $this->error = "Extension no permitida";
                $this->processed = false;
            }
        } else {
            $this->error = "File no contiene ningun archivo";
            $this->processed = false;
        }
        
    }
    private function extension()
    {
        if (is_array($this->file)) {
            $ext = explode('.', $this->file['name']);
            $ext = $ext[count($ext)-1];
            return "." . $ext;
        }
    }

}
