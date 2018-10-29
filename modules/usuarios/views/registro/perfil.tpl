<br><br>
<div class="container">
    <form id="formPerfil" class="form-horizontal" method="POST" action="{$_layoutParams.root}usuarios/registro/perfil" enctype="multipart/form-data">
        <input type="hidden" name="guardar" value="1"/>
        <fieldset>
            <center><legend>DATOS DEL USUARIO</legend></center>
            <br>
        <div class="row">
            <div class="col-md-8">

                    <div class="form-group">
                        <label for="name" class="col-md-4">Nombres y Apellidos</label>
                        <div class="col-md-8">
                            <input type="text" id="name" name="name" class="form-control" placeholder="Cu&aacute;l es tu nombre" value="{$usuario.nombre}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="user" class="col-md-4">Usuario</label>
                        <div class="col-md-8">
                            <input type="text" id="user" name="user" class="form-control" placeholder="Cu&aacute;l es tu usuario" value="{$usuario.usuario}"/>
                         </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-md-4">Email</label>
                        <div class="col-md-8">
                            <input type="text" id="email" name="email" class="form-control" placeholder="Cu&aacute;l es tu email" value="{$usuario.email}"/>
                         </div>
                    </div>   
                    <div class="form-group">
                        <label for="phone" class="col-md-4">Telefono</label>
                        <div class="col-md-8">
                            <input type="text" id="phone" name="phone" class="form-control" placeholder="&iquest;Cu&aacute;l es tu telefono &quest;" value="{$usuario.phone}"/>
                         </div>
                    </div>
                    <div class="form-group">
                        <label for="sex" class="col-md-4">Sexo</label>
                        <div class="col-md-8">
                            <select id="sex" name="sexo" class="form-control">
                                <option  value="void" selected>Seleccionar</option>
                                <option {if $usuario.sexo == "hombre"} selected {/if} value="hombre">Masculino</option>
                                <option {if $usuario.sexo == "mujer"} selected {/if} value="mujer">Femenino</option>
                            </select>
                         </div>
                    </div>
                    <div class="form-group">
                        <label for="estado" class="col-md-4">Estado Civil</label>
                        <div class="col-md-8">
                            <select id="estado" name="estado" class="form-control">
                                <option selected value="void" >Seleccionar</option>
                                <option {if $usuario.estadoCivil == "Soltero(a)"} selected {/if}>Soltero(a)</option>
                                <option {if $usuario.estadoCivil == "Casado(a)"} selected {/if} >Casado(a)</option>
                                <option {if $usuario.estadoCivil == "Divorsiado(a)"} selected {/if}>Divorsiado(a)</option>
                                <option {if $usuario.estadoCivil == "Otros"}  selected {/if} >Otros</option>
                            </select>
                         </div>
                    </div>
                    <div class="form-group">
                        <label for="ocupacion" class="col-md-4">Ocupaci&oacute;n</label>
                        <div class="col-md-8">
                            <input type="text" id="phone" name="ocupacion" class="form-control" placeholder="En que trabajas" value="{$usuario.ocupacion}"/>
                         </div>
                    </div>

            </div>
            <div class="col-md-4">
                <center>
                    <div class="form-group" >
                        <div class="col-md-12" id="contenedorImg">
                            <img class="text-center" style="width:100%;height:280px;" src="{$_layoutParams.root}public/img/user/{$usuario.imagen}" alt="nose encuentra la imagen"/>
                        </div>
                    </div>
                    
                    
                    <div class="form-group"> 
                    <label class="btn btn-primary btn-lg btn-block" for="my-file-selector">
                        <input id="my-file-selector" name="imagen" type="file" style="display:none;">
                        <input type="hidden" name="rutaImagen" value="{$usuario.imagen}"/>
                         IMAGEN
                    </label>
                </div>
                </center>
            </div>
        </div>
         <div class="row">
             <div class="col-md-4 col-md-offset-8">
                 <input type="submit" class="btn btn-orange pull-right" value="Guardar Cambios">
             </div>
         </div>
         </fieldset>
     </form>
</div>