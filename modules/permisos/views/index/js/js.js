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
    $.get(ruta, function (data) {
      console.log(data);
      $(`#cb-persona-mod option[value="${data.id_per}"]`).attr('selected', true);
      $(`#cb-motivo-mod option[value="${data.id_mot}"]`).attr('selected', true);
      $('#inp-fecha-mod').val(data.fecha);
      if (data.tipo == 'D') {
        $('#rd-dia').attr('checked', true);
        $('#dia-mod').css({ display: "block" });
        $('#inp-salida-d-mod').val(data.exit);
        $('#inp-llegada-d-mod').val(data.arrival);
      }else if (data.tipo == 'H') {
        $('#rd-hora').attr('checked', true);
        $('#hora-mod').css({ display: "block" });
        $('#inp-salida-h-mod').val(data.exit);
        $('#inp-llegada-h-mod').val(data.arrival);
      }
      $('#tar-descripcion-mod').val(data.description);
      if (data.inputable == 1) {
        $('#rd-inputable').attr('checked', true);
        
      } else if(data.inputable == 0){
        $('#rd-noinputable').attr('checked', true);
      }
      $("#inp-id-mod").val(data.id);
    },'JSON');
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

  $("#form-mod").on("submit", function (e) {
    e.preventDefault();
    let formData = new FormData(document.getElementById("form-ins"));
    let ruta = $(this).attr("action");
    let rd = $("input[name=rd_tipo]:checked", this).val();
    //se agrega campos para enviar con el formulario
    if (rd === "D") {
      let s = new Date($("#inp-salida-d-mod").val());
      let ent = new Date($("#inp-llegada-d-mod").val());
      let salida = s.getFullYear() + '-' + (s.getMonth() + 1) + '-' + s.getDate();
      formData.append("txtsalida", salida);
      if ($("#inp-llegada-d-mod").val() == '') {
        formData.append("txtllegada", '');
      } else {
        let llegada = ent.getFullYear() + '-' + (ent.getMonth() + 1) + '-' + ent.getDate();
        formData.append("txtllegada", llegada);
      }

    } else {
      let salida = $("#inp-salida-h-mod").val();
      let llegada = $("#inp-llegada-h-mod").val();
      formData.append("txtsalida", salida);
      formData.append("txtllegada", llegada);
    }
    $.ajax({
      url: ruta,
      // dataType: "JSON",
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