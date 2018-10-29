$(document).ready(function () {
    $.fn.serializeFormJSON = function () {

        var o = {};
        var a = this.serializeArray();
        $.each(a, function () {
            if (o[this.name]) {
                if (!o[this.name].push) {
                    o[this.name] = [o[this.name]];
                }
                o[this.name].push(this.value || '');
            } else {
                o[this.name] = this.value || '';
            }
        });
        return o;
    };

    $.fn.validarCampoVacio = function () {
        var text = this.val();
        var texto = this.parent().parent().children("label").text();
        if (text == null || text.length == 0 || /^\s+$/.test(text)) {
            this.parent().parent().attr("class", "form-group has-error");
            this.parent().parent().children("span").text("Este campo debe ser llenado").show();
            this.parent().parent().children("label").text("");
            this.parent().parent().children("label").append(`<i class="fa fa-times-circle-o"></i> ${texto}`);
            return false;
        } else {
            this.parent().parent().attr("class", "form-group has-success");
            this.parent().parent().children("label").text("");
            this.parent().parent().children("label").append(`<i class="fa fa-check"></i> ${texto}`);
            this.parent().parent().children("span").text("").hide();
            return true;
        }
    }

    $.fn.validarCedula = function () {
        var cad = this.val().trim();
        var total = 0;
        var longitud = cad.length;
        var longcheck = longitud - 1;
        var texto = this.parent().parent().children("label").text();
        if (isNaN(cad)) {
            this.parent().parent().attr("class", "form-group has-error");
            this.parent().parent().children("span").text("El campo solo acepta numeros").show();
            this.parent().parent().children("label").text("");
            this.parent().parent().children("label").append(`<i class="fa fa-times-circle-o"></i> ${texto}`);
            return false;
        }
        if (cad == null || cad.length == 0 || /^\s+$/.test(cad)) {
            this.parent().parent().attr("class", "form-group has-error");
            this.parent().parent().children("span").text("El campo debe ser llenado").show();
            this.parent().parent().children("label").text("");
            this.parent().parent().children("label").append(`<i class="fa fa-times-circle-o"></i> ${texto}`);
            return false;
        }

        if (cad !== "" && longitud === 10) {
            for (i = 0; i < longcheck; i++) {
                if (i % 2 === 0) {
                    var aux = cad.charAt(i) * 2;
                    if (aux > 9) aux -= 9;
                    total += aux;
                } else {
                    total += parseInt(cad.charAt(i)); // parseInt o concatenará en lugar de sumar
                }
            }
            total = total % 10 ? 10 - total % 10 : 0;
            if (cad.charAt(longitud - 1) == total) {
                this.parent().parent().attr("class", "form-group has-success");
                this.parent().parent().children("label").text("");
                this.parent().parent().children("label").append(`<i class="fa fa-check"></i> ${texto}`);
                this.parent().parent().children("span").text("").hide();
                return true;
            } else {
                this.parent().parent().attr("class", "form-group has-error");
                this.parent().parent().children("span").text("El numero que ingreso no es valido").show();
                this.parent().parent().children("label").text("");
                this.parent().parent().children("label").append(`<i class="fa fa-times-circle-o"></i> ${texto}`);
                return false;
            }
        } else {
            this.parent().parent().attr("class", "form-group has-error");
            this.parent().parent().children("span").text("El numero que ingreso no es valido").show();
            this.parent().parent().children("label").text("");
            this.parent().parent().children("label").append(`<i class="fa fa-times-circle-o"></i> ${texto}`);
            return false;
        }


    }
    $.fn.validarCampoTelefono = function () {
        var texto = this.parent().parent().children("label").text();
        if (!(/^\d{9}$/.test(this.val()))) {
            this.parent().parent().attr("class", "form-group has-error");
            this.parent().parent().children("span").text("El numero no es valido").show();
            this.parent().parent().children("label").text("");
            this.parent().parent().children("label").append(`<i class="fa fa-times-circle-o"></i> ${texto}`);
            return false;
        } else {
            this.parent().parent().attr("class", "form-group has-success");
            this.parent().parent().children("label").text("");
            this.parent().parent().children("label").append(`<i class="fa fa-check"></i> ${texto}`);
            this.parent().parent().children("span").text("").hide();
            return true;
        }
    }

    $.fn.validarCampoLetra = function () {
        var texto = this.parent().parent().children("label").text();
        if (/^[a-z][a-z]*/.test(this.val()) == false) {
            this.parent().parent().attr("class", "form-group has-error");
            this.parent().parent().children("span").text("Solo letras y espacios").show();
            this.parent().parent().children("label").text("");
            this.parent().parent().children("label").append(`<i class="fa fa-times-circle-o"></i> ${texto}`);
            return false;
        } else {
            this.parent().parent().attr("class", "form-group has-success");
            this.parent().parent().children("span").text("").hide();
            this.parent().parent().children("label").text("");
            this.parent().parent().children("label").append(`<i class="fa fa-check"></i> ${texto}`);
            return true;
        }
    }

    $.fn.validarCampoSelect = function (){
        indice = this.val();
        var texto = this.parent().parent().children("label").text();
        if( indice == null || indice == 0 ) {
            this.parent().parent().attr("class", "form-group has-error");
            this.parent().parent().children("span").text("Solo letras y ").show();
            this.parent().parent().children("label").text("");
            this.parent().parent().children("label").append(`<i class="fa fa-times-circle-o"></i> ${texto}`);
            return false;
          }
          this.parent().parent().attr("class", "form-group has-success");
            this.parent().parent().children("span").text("").hide();
            this.parent().parent().children("label").text("");
            this.parent().parent().children("label").append(`<i class="fa fa-check"></i> ${texto}`);
            return true; 
         
    }

});