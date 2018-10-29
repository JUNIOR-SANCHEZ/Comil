
$(function(){
    $.validator.methods.strongPasword=function(value,element){
        return this.optional(element)
        || value.length >=8 
        && /\d/.test(value)
        && /[a-z]/i.test(value);
    };

    $("#formRegister").validate({
        rules:{
            email:{
                required:true,
                email:true,
            },
            name:"required",
            user:"required",
            password:{
               required:true,
               strongPassword:true
            },
            password2:{
                required: true,
                equalTo:"#password"
            }
        },
        messages:{
            email:{
                required:"Porfavor ingrese un email",
                email:"El email que ingreso es invalido"
            },
            name:{
              required:"Porfavor ingrese un nombre"  
            },
            user:{
                required:"Porfavor ingrese el usuario"
            },
            password:{
                required:"Porfavor ingrese una contraseña"
            },
            password2:{
                equalTo:"Las contrseñas no coinciden",
                required:"Porfavor ingrese de nuevo su contraseña"
            }

            
        }
    });

});