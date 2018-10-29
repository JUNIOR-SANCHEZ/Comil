$(function(){

    $("#formLogin").validate({
        rules:{
            user:"required",
            password:"required"
        },
        messages:{
            user:{
                required:"Porfavor ingrese su usuario"
            },
            password:{
                required:"Porfavor ingrese su contraseña"
            }
        }
    });
});