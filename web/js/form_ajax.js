$('body').on('click', '#link_sair', function (e) {
    $.ajax({
        type: 'post', //busca a informação do atributo method no formulário
        url: 'Sair', //busca a informação do atributo action no formulário
        cache: false,
        //caso obtenha alguma resposta do servidor
        success: function (data) {
//converte string da resposta em json
            var json = $.parseJSON(data);
            if (json.success) {
                $('.menu_cliente').addClass('hide');
                alerta(json.success, json.msg, $('#box_alertas')); //tipo de mensagem, mensagem e onde ela vai aparecer
            }
            else {

            }
        }
    });
});

$('body').on('click', '#Cadastrar', function (e) {
    $('#modalLogin').modal('hide');
});

$('body').on('submit', '#form_log_usuario', function (e) {
    $form = $(this);
    $form.find(":submit").button('loading');
    //impede o redirecionamento depágina do formulário tradicional
    e.preventDefault();
    //faz a requisição ajax
    $.ajax({
        type: $form.attr('method'), //busca a informação do atributo method no formulário
        url: $form.attr('action'), //busca a informação do atributo action no formulário
        data: $form.serialize(), // busca automaticamente as inputs serializa-as
        cache: false,
        //caso obtenha alguma resposta do servidor
        success: function (data) {
//converte string da resposta em json
            var json = $.parseJSON(data);
            //alert(json.msg);
            //mostra a mensagem de alerta
            //verificando se retornou sucesso
            if (json.success) {
//reseta o formulário em caso de sucesso
                $form[0].reset();
                $('#modalLogin').modal('hide');
                alerta(json.success, json.msg, $($form.attr("data-saida-sucesso"))); //tipo de mensagem, mensagem e onde ela vai aparecer
                $('.menu_cliente').removeClass('hide');
            }
//houve erro no cadastro
            else {
                alerta(json.success, json.msg, $($form.attr("data-saida-erro"))); //tipo de mensagem, mensagem e onde ela vai aparecer
            }

//volta o botão para o estado normal
            $form.find(":submit").button('reset');
        },
        error: function (data) {
            alerta(false, "Erro ao comunicar-se com o servidor.", $($form.attr("data-saida-erro")));
            //$form[0].reset();
        }
    });
});

//listener do link pesquisar produto
$('body').on('click', '#pesquisar_produto', function (e) {
    //alert("clicou no excluir");  
    // alert($(this).parent().parent().children(':first-child').html);
    //armazena o ID do usuário a ser escolhido
    $id = $(this).parent().parent().children(':first-child').val();
     alert($id);
    //mostra mensagem de confirmação
    $.ajax({
        type: 'post',
        url: 'ProdutosServlet',
        data: {idProduto: $id},
        cache: false,
        //caso obtenha alguma resposta do servidor
        success: function (data) {
            //converte string da resposta em json
            var json = $.parseJSON(data);
            //verifica se a exclusão foi feita com sucesso
            if (json.success) {
                //recarrega a tabela
                alerta(json.success, json.msg, $('#box_alertas'));

            } else {
                alerta(json.success, json.msg, $('#box_alertas'));
            }
        },
        error: function (data) {
            alerta(false, "Erro ao comunicar-se com o servidor.", $('#box_alertas'));
        }
    });
});

//listener do link excluir newsletter
$('body').on('click', '#produto', function (e) {
//alert($nome);
// alert($(this).parent().parent().children(':first-child').html);
//armazena o ID do usuário a ser escolhido
    $id = $(this).children(':first-child').html();
    $nome = $(this).children(':first-child').next().next().children(':first-child').html();
    $preco = $(this).children(':first-child').next().next().children(':first-child').next().html();
    alert($nome + " foi Adicionado ao carrinho");

    //mostra mensagem de confirmação
    $.ajax({
        type: 'post',
        url: 'InserirItemC',
        data: {idProduto: $id, nomeProd: $nome, precoProd: $preco},
        //data: {idProduto: $id},
        cache: false

    });
});

// listener para ser acionado quando tentar enviar um formulário
$('body').on('submit', 'form', function (e) {

//armazena o id do formulário
    $form = $(this);
    //verifica se o formulário é ajax, através da propriedade data-ajax="1"
    if ($form.attr("data-ajax") == "1") {
//trava o botão submit(enviar)
        $form.find(":submit").button('loading');
        //impede o redirecionamento depágina do formulário tradicional
        e.preventDefault();
        //faz a requisição ajax
        $.ajax({
            type: $form.attr('method'), //busca a informação do atributo method no formulário
            url: $form.attr('action'), //busca a informação do atributo action no formulário
            data: $form.serialize(), // busca automaticamente as inputs serializa-as
            cache: false,
            //caso obtenha alguma resposta do servidor
            success: function (data) {
//converte string da resposta em json
                var json = $.parseJSON(data);
                //alert(json.msg);
                //mostra a mensagem de alerta
                //verificando se retornou sucesso
                if (json.success) {
//reseta o formulário em caso de sucesso
                    $form[0].reset();
                    var stringHash = window.location.hash;
                    loadAjax(stringHash);
                    alerta(json.success, json.msg, $($form.attr("data-saida-sucesso"))); //tipo de mensagem, mensagem e onde ela vai aparecer

                }
//houve erro no cadastro
                else {
                    alerta(json.success, json.msg, $($form.attr("data-saida-erro"))); //tipo de mensagem, mensagem e onde ela vai aparecer
                }

//volta o botão para o estado normal
                $form.find(":submit").button('reset');
            },
            error: function (data) {
                alerta(false, "Erro ao comunicar-se com o servidor.", $($form.attr("data-saida-erro")));
                //$form[0].reset();
            }
        });
    }
});