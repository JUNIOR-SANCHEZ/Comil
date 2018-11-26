/**
 * TODO: METODO PRINCIPALES PARA GESTIONAR EL MODULO DE PERSONAS
 */

$(document).ready(function () {
  var pagina = 1;
  $('input[type="radio"].flat-red').iCheck({
    checkboxClass: 'icheckbox_flat-green',
    radioClass: 'iradio_flat-green'
  });
  function paginacion(dato) {
    $.post(_root_ + "personas/index/consultar_ajax", dato, function(response) {
      $("#contenedor").html("");
      $("#contenedor").html(response);
    });
  }
  $(document).delegate(".pagina", "click", function() {
    var pag = "pagina=" + $(this).attr("pagina");
    pagina = pag;
    paginacion(pag);
  });
  //FIXME: DESACTIVAR Y ACTIVAR LOS ESTADOS
  $(document).delegate(".btn-estado", "click", function(e) {});
  //FIXME:  CARGAR DATOS AL FORMULARIO
  $(document).delegate(".btn-per", "click", function(e) {
    e.preventDefault();
    var ruta = $(this).attr("data-ruta");
    $.get(
      ruta,
      function (data) {
        $("#name-mod").val(data.name);
        $("#lastname-mod").val(data.lastname);
        $("#birthdate-mod").val(data.birthdate);
        $("#card-mod").val(data.card);
        $("#address-mod").val(data.address);
        $("#email1-mod").val(data.email);
        $("#email2-mod").val(data.email2);
        $("#phone-mod").val(data.phone);
        $("#id").val(data.id);
        $(`#civil-mod option[value="${data.civil}"]`).attr("selected", true);
        $(`#blood-mod option[value="${data.blood}"]`).attr("selected", true);
        if (data.gender == "H") {
          $(`#rd-gender1-mod`).attr("checked",true);
        } else {
          $(`#rd-gender2-mod`).attr("checked",true);
        }
        console.log(data.gender);
        
      },
      "JSON"
    );
  });

  $("#btn-ins").on("click", function(e) {
    e.preventDefault();
    var formData = new FormData(document.getElementById("form-ins"));
    var ruta = $("#form-ins").attr("action");
    $.ajax({
      url: ruta,
      dataType: "JSON",
      data: formData,
      processData: false,
      contentType: false,
      type: "POST",
      success: function(data) {
        if (data.error) {
          swal(
            "Lo sentimos ha ocurrido un error inesperado",
            data.error,
            "error"
          );
        } else {
          swal("En hora buena!", data, "success");
          $("#form-ins")[0].reset();
        }
      }
    });
  });
  //FIXME: ACTUALIZAR DATOS DE UNA PERSONA
  $("#btn-mod").on("click", function(e) {
    e.preventDefault();
    var formData = new FormData(document.getElementById("form-mod"));
    var ruta = $("#form-mod").attr("action");
    $.ajax({
      url: ruta,
      dataType: "JSON",
      data: formData,
      processData: false,
      contentType: false,
      type: "POST",
      success: function(data) {
        if (data.error) {
          swal(
            "Lo sentimos ha ocurrido un error inesperado",
            data.error,
            "error"
          );
        } else {
          $('#modal-mod').modal('hide');
          paginacion(pagina);
          swal("En hora buena!", data, "success");
          $("#form-ins")[0].reset();
        }
      }
    });
  });

});
