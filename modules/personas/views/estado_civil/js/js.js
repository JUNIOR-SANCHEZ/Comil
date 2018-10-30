$(document).ready(function() {
  function paginacion(dato) {
    $.post(_root_ + "/personas/estado_civil/consulta_ajax", dato, function(
      response
    ) {
      $("#contenedor").html("");
      $("#contenedor").html(response);
    });
  }

  $(document).delegate(".pagina", "click", function() {
    var pag = "pagina=" + $(this).attr("pagina");
    paginacion(pag);
  });

  $("#btn-ins").on("click", function(e) {
    e.preventDefault();
    var formData = new FormData(document.getElementById("form-ins"));
    var ruta = $("#form-ins").attr("action");
    $.ajax({
      url: ruta,
      data: formData,
      processData: false,
      contentType: false,
      type: "POST",
      success: function(data) {
        $("#modal-ins").modal("hide");
        swal("En hora buena!", data, "success");
        $("#form-ins")[0].reset();
        var pag = "pagina=" + 1;
        paginacion(pag);
      }
    });
  });

  $(document).delegate(".btn-id", "click", function(e) {
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

  $("#btn-mod").on("click", function(e) {
    e.preventDefault();
    var formData = new FormData(document.getElementById("form-mod"));
    var ruta = $("#form-mod").attr("action");
    $.ajax({
      url: ruta,
      data: formData,
      processData: false,
      contentType: false,
      type: "POST",
      success: function(data) {
        $(".modal-mod").modal("hide");
        swal("En hora buena!", data, "success");
        $("#form-mod")[0].reset();
        var pag = "pagina=" + 1;
        paginacion(pag);
      }
    });
  });

  $(document).delegate(".btn-del", "click", function(e) {
    e.preventDefault();
    var formData = new FormData();
    formData.append("txtid", $(this).attr("data-id"));
    var ruta = _root_ + "personas/estado_civil/eliminar_ajax";
    $.ajax({
      url: ruta,
      data: formData,
      processData: false,
      contentType: false,
      type: "POST",
      success: function(data) {
        swal("En hora buena!", data, "success");
        $("#form-mod")[0].reset();
        var pag = "pagina=" + 1;
        paginacion(pag);
      }
    });
  });

  $("#txtdescripcion").autocomplete({
    source: function(request, response) {
      var ruta = _root_ + "personas/estado_civil/autocomplete_ajax";
      $.ajax({
        url: ruta,
        dataType: "json",
        data: { q: request.term },
        success: function(data) {
          response(data);
        }
      });
    },
    minLength: 3,
    select: function(event, ui) {
      // alert("selecciono: "+ui.item.label);
    }
  });
});
