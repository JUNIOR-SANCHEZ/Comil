$(document).ready(function() {
  function paginacion(dato) {
    $.post(
      _root_ + "compras/proveedores/consulta_paginacion_ajax",
      dato,
      function(response) {
        $("#contenedor").html("");
        $("#contenedor").html(response);
      }
    );
  }
  $(document).delegate(".pagina", "click", function() {
    var pag = "pagina=" + $(this).attr("pagina");
    paginacion(pag);
  });
});
