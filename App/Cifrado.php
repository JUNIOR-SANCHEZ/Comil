<?php

class Cifrado{
    
    public static function getHash($algoritmo,$data,$key){
        
        $hash = hash_init($algoritmo,HASH_HMAC,$key);
        hash_update($hash, $data);
        
        return hash_final($hash);
    }
    
    public static function encryption($string) {
        $output = FALSE;
        $key = hash('sha256', SECRET_KEY);
        $iv = substr(hash('sha256', SECRET_IV), 0, 16);
        $output = openssl_encrypt($string, METHOD, $key, 0, $iv);
        $output = base64_encode($output);
        return $output;
    }

    public static function decryption($string) {
        $key = hash('sha256', SECRET_KEY);
        $iv = substr(hash('sha256', SECRET_IV), 0, 16);
        $output = openssl_decrypt(base64_decode($string), METHOD, $key, 0, $iv);
        return $output;
    }
}
