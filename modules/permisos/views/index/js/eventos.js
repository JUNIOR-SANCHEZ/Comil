$(document).ready(function () {
    var css = {
        display: "none"
    };
    let fechaAcual = new Date();
    let fechaAct = (fechaAcual.getMonth() + 1) + '/' + fechaAcual.getDate() + '/' + fechaAcual.getFullYear()
    $("#inp-salida-d-ins").val(fechaAct);
    $("#hora").css(css);
    $('[data-toggle="datepicker"]').datepicker({
        autoHide: true,
        zIndex: 2048
    });
    $(".timepicker").timepicker({
        showInputs: false
    });
    $("input[name=rd_tipo]").on("click", function () {
        var val = $(this).val();
        let view = {
          display: "block"
        };
        if (val === "D") {
          $("#dia").css(view);
          $("#hora").css(css);
        } else {
          $("#dia").css(css);
          $("#hora").css(view);
        }
      });
})