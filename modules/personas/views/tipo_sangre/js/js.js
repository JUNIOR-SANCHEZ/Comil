$(document).ready(function () {
  function paginacion(dato) {
    $.post(_root_ + "/personas/tipo_sangre/consulta_ajax", dato, function (
      response
    ) {
      $("#contenedor").html("");
      $("#contenedor").html(response);
    });
  }
  $(document).delegate(".pagina", "click", function () {
    var pag = "pagina=" + $(this).attr("pagina");
    paginacion(pag);
  });
  $(document).delegate(".btn-id", "click", function (e) {
    e.preventDefault();
    var id = $(this).attr("data-id");
    var des = $(this)
      .parent()
      .parent()
      .children(".td-descripcion")
      .text();
    $("#txtid-mod").val(id);
    $("#txtdescripcion-mod").val(des);
  });
  $("#form-ins").on("submit", function (e) {
    e.preventDefault();
    var formData = new FormData(document.getElementById("form-ins"));
    var ruta = $(this).attr("action");
    $.ajax({
      url: ruta,
      dataType: "JSON",
      data: formData,
      processData: false,
      contentType: false,
      type: "POST",
      success: function (data) {
        if (data.error) {
          swal(
            "Lo sentimos ha ocurrido un error inesperado",
            data.error,
            "error"
          );
        } else {
          $('#modal-ins').modal('hide');
          $("#form-ins")[0].reset();
          swal("En hora buena!", data, "success");
          var pag = "pagina=" + 1;
          paginacion(pag);
        }
      }
    });
  });
  $("#form-mod").on("submit", function (e) {
    e.preventDefault();
    var formData = new FormData(document.getElementById("form-mod"));
    var ruta = $(this).attr("action");
    $.ajax({
      url: ruta,
      dataType: "JSON",
      data: formData,
      processData: false,
      contentType: false,
      type: "POST",
      success: function (data) {
        if (data.error) {
          swal(
            "Lo sentimos ha ocurrido un error inesperado",
            data.error,
            "error"
          );
        } else {
          $("#modal-mod").modal("hide");
          $("#form-mod")[0].reset();
          swal("En hora buena!", data, "success");
          var pag = "pagina=" + 1;
          paginacion(pag);
        }
      }
    });
  });


});