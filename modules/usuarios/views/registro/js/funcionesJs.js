
(function(){
    function filePreview(input){
     if(input.files && input.files[0]){
         var reader = new FileReader();
         
         reader.onload = function(e){
             $("#contenedorImg").html('');
             $("#contenedorImg").html('<center><img class="text-center" src="'+e.target.result+'" style="width:100%;height:280px;"></center>');
         };
         reader.readAsDataURL(input.files[0]);
     }   
    }
    $("#my-file-selector").change(function(){
        filePreview(this);
    }); 
})();