$(function(){
    $("#formPerfil").validate({
        rules:{
            email:{
                required:true,
                email:true,
            },
            name:"required",
            user:"required",
        },
        messages:{
            email:{
                required:"Porfavor ingrese su email",
                email:"El email que ingreso es invalido"
            },
            name:{
              required:"Porfavor ingrese su nombre"  
            },
            user:{
                required:"Porfavor ingrese el usuario"
            },
        }
    });
    
    
});