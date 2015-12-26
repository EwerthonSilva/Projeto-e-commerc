$.ajax({
    type: 'post', //busca a informação do atributo method no formulário
    url: 'VerificaAutenticado', //busca a informação do atributo action no formulário
    cache: false,
    //caso obtenha alguma resposta do servidor
    success: function(data) {
        //converte string da resposta em json
        var json = $.parseJSON(data);
        //verifica se está logado
        if (json.success) {
            $('.menu_cliente').removeClass('hide');
        }
        //se nao esta logado
        else {
            $('.menu_cliente').addClass('hide');
        }
    }
});