$(document).ready(function() {
  var css = { display: "none" };
  $("#hora").css(css);
  $('[data-toggle="datepicker"]').datepicker({
    autoHide: true,
    zIndex: 2048
  });

  $("#modal-ins").modal("show");
  $(".timepicker").timepicker({
    showInputs: false
  });

  $("input[name=rd_tipo]").on("click", function() {
    var val = $(this).val();
    let view = { display: "block" };
    if (val === "D") {
      $("#dia").css(view);
      $("#hora").css(css);
    } else {
      $("#dia").css(css);
      $("#hora").css(view);
    }
  });

  $("#btn-ins").on("click", function(e) {
    let formData = new FormData(document.getElementById("form-ins"));
    let ruta = $("#form-ins").attr("action");
    let rd = $("input[name=rd_tipo]:checked", "#form-ins").val();
    //se agrega campos para enviarcon el formulario
    if (rd === "D") {
      let salida = $("#inp-salida-d-ins").val();
      let llegada = $("#inp-llegada-d-ins").val();
      formData.append("txtsalida", salida);
      formData.append("txtllegada", llegada);
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
      success: function(data) {
        if (data.error) {
          swal(
            "Lo sentimos ha ocurrido un error inesperado",
            data.error,
            "error"
          );
        } else {
          $("#modal-mod").modal("hide");
          $.each(data, function(index, value) {
            console.log(index + "(" + value + ")");
          });
          //   paginacion(pagina);
          //   swal("En hora buena!", data, "success");
          $("#form-ins")[0].reset();
        }
      }
    });
  });
});
