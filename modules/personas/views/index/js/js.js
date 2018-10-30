$(document).ready(function () {
  
  $("#example2").DataTable({
    "ajax": _root_+"personas/index/consultar_ajax",
    "columns": [
      { "data": "name" },
      { "data": "id" }
    ]
  });
});
