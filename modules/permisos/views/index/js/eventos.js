$(document).ready(function () {
  $('[data-toggle="datepicker"]').datepicker({
    autoHide: true,
    zIndex: 2048
  });

  $('#inp-salida-ins').on('change', function () {
    let s = $(this).val();
    verificarHoraFecha(s);
  })
  $('#inp-llegada-ins').on('change', function () {
    let l = $(this).val();
    verificarHoraFecha(l);
  })
})

function verificarHoraFecha(text) {
  let val = $("input[name=rd_tipo]:checked").val();
  if (val === 'D') {
    let fecha = text;
    validarFecha(fecha);
  } else if (val === 'H') {
    let hora = text;
    validarHora(hora);
  }
}

function validarHora(hora) {
  let patron = /^(0[1-9]|1\d|2[0-3]):([0-5]\d)$/;
  if (patron.test(hora)) {
    return true;
  } else 
    alert('Hora inválida: * La hora debe tener el formato: HH:MM (hora:minutos)');
    return false;
}

function validarFecha(fecha) {
  // La longitud de la fecha debe tener exactamente 10 caracteres
  if (fecha.length !== 10)
    error = true;

  // Primero verifica el patron
  if (!/^\d{1,2}\/\d{1,2}\/\d{4}$/.test(fecha))
    error = true;

  // Mediante el delimitador "/" separa dia, mes y año
  var fecha = fecha.split("/");
  var day = parseInt(fecha[0]);
  var month = parseInt(fecha[1]);
  var year = parseInt(fecha[2]);

  // Verifica que dia, mes, año, solo sean numeros
  error = (isNaN(day) || isNaN(month) || isNaN(year));

  // Lista de dias en los meses, por defecto no es año bisiesto
  var ListofDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  if (month === 1 || month > 2)
    if (day > ListofDays[month - 1] || day < 0 || ListofDays[month - 1] === undefined)
      error = true;

  // Detecta si es año bisiesto y asigna a febrero 29 dias
  if (month === 2) {
    var lyear = ((!(year % 4) && year % 100) || !(year % 400));
    if (lyear === false && day >= 29)
      error = true;
    if (lyear === true && day > 29)
      error = true;
  }

  if (error === true) {
    alert("Fecha Inválida: * La Fecha debe tener el formato: dd/mm/aaaa (dia/mes/año).\n");
    return false;
  } else

    return true;
}