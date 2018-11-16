$(document).ready(function () {
  function paginacion(dato) {
    $.post(_root_ + "/personas/estado_civil/consulta_ajax", dato, function (
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
//FIXME: CAMBIAR EL PROSESO POR UNA PETICION REQUEST
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
    var ruta = $("#form-ins").attr("action");
    $.ajax({
      url: ruta,
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
          $("#modal-ins").modal("hide");
          $("#form-ins")[0].reset();
          swal("En hora buena!", data, "success");
          var pag = "pagina=" + 1;
          paginacion(pag);
        }
      }
    });
  });

  $("#btn-mod").on("click", function (e) {
    e.preventDefault();
    var formData = new FormData(document.getElementById("form-mod"));
    var ruta = $("#form-mod").attr("action");
    $.ajax({
      url: ruta,
      data: formData,
      processData: false,
      contentType: false,
      type: "POST",
      success: function (data) {
        $(".modal-mod").modal("hide");
        swal("En hora buena!", data, "success");
        $("#form-mod")[0].reset();
        var pag = "pagina=" + 1;
        paginacion(pag);
      }
    });
  });
});