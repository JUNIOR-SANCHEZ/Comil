<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <link rel="icon" type="image/png" href="{$_layoutParams.root}public/img/images/escudo.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>{$titulo|default:""}</title>

    <link rel="stylesheet" href="{$_layoutParams.bootstrap_css}">
    <link rel="stylesheet" href="{$_layoutParams.fontAwesome_css}">
    <link rel="stylesheet" href="{$_layoutParams.ionicons_css}">
    <link rel="stylesheet" href="{$_layoutParams.AdminLTE_css}">
    <link rel="stylesheet" href="{$_layoutParams.blue_css}">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    <!-- RUTAS AUTOMATICAS CSS -->
    {if isset($_layoutParams.css) && count($_layoutParams.css)} {foreach item=css from=$_layoutParams.css}
    <link href="{$css}" rel="stylesheet"> {/foreach} {/if}
</head>
<style>
    .fondo{
        background: url('{$_layoutParams.root}public/img/fondo.jpg') no-repeat center center fixed; 
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
        width: 100%;
        height: 100%;
        position: absolute;
        /* position: absolute; */
    }
    .login-box{
        margin-top: 200px;
    }
</style>

<body class="hold-transition login-page ">
   <div class="fondo">
        <div class="login-box">
            <div class="login-box-body">
                <p class="login-box-msg">Inicio de sesion</p>
       
                {if isset($_error)}
                <div class="alert alert-danger alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <strong>Error!</strong> {$_error}
                </div>
                {/if}
                <!-- CUERPO DE LA APLICACION -->
                {include file=$_contenido}
                <a href="register.html" class="text-center">Olvidé mi contraseña</a>
            </div>
        </div>
   </div>

    <!-- VARIABLES GLOBALES -->
    <script type="text/javascript">
        var _root_ = '{$_layoutParams.root}';
    </script>


    <script src="{$_layoutParams.jquery_js}"></script>
    <script src="{$_layoutParams.bootstrap_js}"></script>
    <script src="{$_layoutParams.AdminLTE_js}"></script>
    <script src="{$_layoutParams.icheck_js}"></script>




    <!-- RUTAS AUTOMATICAS DE LIBRERIAS JS QUE NECESITEMOS EN LA APLICACION -->
    {if isset($_layoutParams.jsPlugin) && count($_layoutParams.jsPlugin)} {foreach item=js
    from=$_layoutParams.jsPlugin}
    <script src="{$js}" type="text/javascript"></script> {/foreach} {/if}
    <!-- RUTAS AUTOMATICAS DE ARCHIVO JS CREADOS -->
    {if isset($_layoutParams.js) && count($_layoutParams.js)} {foreach item=js from=$_layoutParams.js}
    <script src="{$js}" type="text/javascript"></script> {/foreach} {/if}

</body>

</html>