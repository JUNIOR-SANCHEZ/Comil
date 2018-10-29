
<style>

</style>


<div class="my-content" >
        <div class="container" > 
            <div class="row">
                <div class="col-sm-12" >
                  <h1><strong>Comil</strong> Formulario de Registro</h1>
                  <div class="mydescription">
                    <p> </p>
                  </div>
                </div>
            </div>
            <div class="row">
              <div class="col-sm-6 offset-sm-3 myform-cont" >
                    <div class="myform-top">
                        <div class="myform-top-left">
                          <h3>Regístro de Usuarios .</h3>
                            <p>Por favor ingresar los datos:</p>
                        </div>
                        <div class="myform-top-right">
                          <i class="fa fa-user"></i>
                        </div>
                    </div>
                    <div class="myform-bottom">
                      <form role="form" action="{$_layoutParams.root}usuarios/registro" method="post" class="">
                      <input type="hidden" name="registro" value="1">
                        <div class="form-group">
                            <input type="text" name="user" class="form-control" id="inputUser" placeholder="Ingrese el Usuario" value="{$datos.user|default:""}">
                        </div>
                        <div class="form-group">
                            <input type="email" name="email" class="form-control" id="inputEmail" aria-describedby="emailHelp" placeholder="Ingrese el email"  value="{$datos.email|default:""}">
                        </div>
                        <div class="form-group">
                            <input type="password" name="password" class="form-control" id="inputPassword" placeholder="Ingrese una contraseña" value="{$datos.password|default:""}">
                        </div>
                        <div class="form-group">
                            <input type="password" name="confirmPassword" class="form-control" id="inputConfirmPassword" placeholder="Confirme la contraseña" value="{$datos.confirmPassword|default:""}">
                        </div>
                        <input type="submit" class="mybtn " value="Registrar">
                      </form>
                    </div>
              </div>
            </div>
           
        </div>
      </div>