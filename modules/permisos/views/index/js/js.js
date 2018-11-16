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

  $("#form-ins").on("submit", function (e) {
    e.preventDefault();
    let formData = new FormData(document.getElementById("form-ins"));
    let ruta = $(this).attr("action");
    let rd = $("input[name=rd_tipo]:checked", this).val();
    //se agrega campos para enviar con el formulario
    if (rd === "D") {
      let s = new Date($("#inp-salida-d-ins").val());
      let ent = new Date($("#inp-llegada-d-ins").val());
      let salida = s.getFullYear() + '-' + (s.getMonth() + 1) + '-' + s.getDate();
      formData.append("txtsalida", salida);
      if ($("#inp-llegada-d-ins").val() == '') {
        formData.append("txtllegada", '');
      } else {
        let llegada = ent.getFullYear() + '-' + (ent.getMonth() + 1) + '-' + ent.getDate();
        formData.append("txtllegada", llegada);
      }

    } else {
      let salida = $("#inp-salida-h-ins").val();
      let llegada = $("#inp-llegada-h-ins").val();
      formData.append("txtsalida", salida);
      formData.append("txtllegada", llegada);
    }
    $.ajax({
      url: ruta,
      dataType: "JSON",
      data: formData,
      processData: false,
      contentType: false,
      type: "POST",
      success: function (data) {
        console.log(data);

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
});