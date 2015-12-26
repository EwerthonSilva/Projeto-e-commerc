function alerta(sucesso, html, destino) {
    if (sucesso) { // ou if (sucesso==true)
        tipoalerta = "alert-success";
    }
    else {
        tipoalerta = "alert-danger";
    }

    destino.html("<div id=\"alerta_principal\" class='alert " + tipoalerta + " alert-dismissible' role='alert'>"
            + "<button type = 'button' class='close' data-dismiss='alert'> <span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span></button>"
            + html
            + "</div>");

    setTimeout(function () {
        $('#alerta_principal').slideUp();

    }, 10000);






}

function validaSenha(s1, s2) {
    if (s1.value != s2.value) {
        s1.setCustomValidity("Senhas precisam ser iguais");
        s2.setCustomValidity("Senhas precisam ser iguais");
    }
    else {
        s1.setCustomValidity("");
        s2.setCustomValidity("");
    }
}

function loadAjax(e) {
    // DESMARCAR O ACTIVE DE TODAS AS LI'S

    $("li").each(function (index) {
        $(this).removeClass("active");
    });

    // FAZ UMA REQUISIÇÃO AJAX
    $.ajax({
        // ESPECIFICA A URL DA REQUISIÇÃO
        url: $(e).attr("data-url"),
        // SE OBTIVER SUCESSO, ARMAZENA O CONTEUDO ENCONTRADO NA VARIÁVEL "htmlretorno"
        success: function (htmlretorno) {
            $("#conteudo").html(htmlretorno);
            // CARREGA O CONTEÚDO DA VARIÁVEL "htmlretorno" COMO CONTEÚDO DA DIV "conteudo"
        }
    })
    // MARCA O LINK CLICADO COMO ATIVO
    $(e).parent().addClass("active");

}

// AGUARDA O CARREGAMENTO DA PÁGINA E JQUERY
$(document).ready(function () {
    // SE ENCONTRAR ALGUMA HASH, RECARREGA PAGINA ESPECIFICA

    if (window.location.hash != "") {
        //var stringHash = window.location.hash.replace("#", "");
        var stringHash = window.location.hash;
        loadAjax(stringHash);
    }

    // LISTENER - EECUTA O CÓDIGO PARA CADA VEZ QUE QUALQUER LINK FOR CLICADO
    $("a").click(function () {
        // verifica se a propriedade "data-url" foi especificada
        if ($(this).attr("data-url") != null) {
            loadAjax("#" + $(this).attr("id"));
        }
        // fecha o listener   
    });

    $(document).on('click', '[data-push-breadcrumb]', function () {
        var posicaoAtual = $(this).attr('data-push-breadcrumb');
        var elementos = $('#navegabilidade li');
        console.log(elementos);

        var tamTotal = elementos.length - 1;


        for (i = tamTotal; i >= 0; i--) {
            if (i >= posicaoAtual) {
                elementos[i].remove();

            }
        }
        $('#navegabilidade').append('<li>' + $(this).clone().prop('outerHTML') + '</li>');


    });

// fecha o ready    
});

