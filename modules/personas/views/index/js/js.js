/**
 * TODO: METODO PRINCIPALES PARA GESTIONAR EL MODULO DE PERSONAS
 */

$(document).ready(function() {
  function paginacion(dato) {
    $.post(_root_ + "personas/index/consultar_ajax", dato, function(response) {
      $("#contenedor").html("");
      $("#contenedor").html(response);
    });
  }
  $(document).delegate(".pagina", "click", function() {
    var pag = "pagina=" + $(this).attr("pagina");
    paginacion(pag);
  });
  //FIXME: DESACTIVAR Y ACTIVAR LOS ESTADOS
  $(document).delegate(".btn-estado", "click", function(e) {});
  //FIXME:  CARGAR DATOS AL FORMULARIO
  $(document).delegate(".btn-per", "click", function (e) {
    e.preventDefault();
    var ruta = $(this).attr("data-ruta");
    $.get(ruta, function (data) {
      $("#name-mod").val(data.name);
    },"JSON")

   });
  
  $("#btn-ins").on("click", function (e) {
    e.preventDefault();
    var formData = new FormData(document.getElementById("form-ins"));
    var ruta = $("#form-ins").attr("action");
    $.ajax({
      url: ruta,
      dataType: "JSON",
      data: formData,
      processData: false,
      contentType: false,
      type:"POST",
      success: function (data) {
        if (data.error) {
          swal("Lo sentimos ha ocurrido un error inesperado", data.error, "error");
        } else {
          swal("En hora buena!", data, "success");
          $("#form-ins")[0].reset();
        }
      }
    });  
  });
  //FIXME: ACTUALIZAR DATOS DE UNA PERSONA
  $("#btn-mod").on("click", function(e) {});
});
