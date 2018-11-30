$(document).ready(function () {
  var pagina = 1;

  function paginacion(dato) {
    $.post(_root_ + "permisos/index/consulta_ajax", dato, function (response) {
      $("#contenedor").html("");
      $("#contenedor").html(response);
    });
  }
  $(document).delegate(".pagina", "click", function () {
    var pag = "pagina=" + $(this).attr("pagina");
    pagina = pag;
    paginacion(pag);
  });
  $(document).delegate('.btn-select', 'click', function () {
    let ruta = $(this).attr('data-ruta');
    $("#form-mod")[0].reset();
    $.get(ruta, function (data) {
      $(`#cb-persona-mod option[value="${data.id_per}"]`).attr('selected', true);
      $(`#cb-motivo-mod option[value="${data.id_mot}"]`).attr('selected', true);
      $('#inp-fecha-mod').val(data.fecha);
      $('#inp-salida-mod').val(data.exit);
      $('#inp-llegada-mod').val(data.arrival);
      $('#tar-descripcion-mod').val(data.description);
      $("#inp-id-mod").val(data.id);
      if (data.inputable == 1) {
        $('#rd-noinputable-mod').attr('checked', false);
        $('#rd-inputable-mod').attr('checked', true);
      }
      if (data.inputable == 0) {
        $('#rd-inputable-mod').attr('checked', false);
        $('#rd-noimputable-mod').attr('checked', true);
      }
      if (data.tipo == 'D') {
        $('#rd-hora-mod').attr('checked', false);
        $('#rd-dia-mod').attr('checked', true);
      }
      if (data.tipo == 'H') {
        $('#rd-dia-mod').attr('checked', false);
        $('#rd-hora-mod').attr('checked', true);
      }
    }, 'JSON');
  });

  $("#form-ins").on("submit", function (e) {
    e.preventDefault();
    let formData = new FormData(document.getElementById("form-ins"));
    let ruta = $(this).attr("action");
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
          $("#modal-ins").modal("hide");
          paginacion(pagina);
          swal("En hora buena!", data, "success");
          $("#form-ins")[0].reset();
        }
      }
    });
  });
  $("#form-mod").on("submit", function (e) {
    e.preventDefault();
    let formData = new FormData(document.getElementById("form-mod"));
    let ruta = $(this).attr("action");
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
          paginacion(pagina);
          swal("En hora buena!", data, "success");
          $("#form-mod")[0].reset();
        }
      }
    });
  });

  
});