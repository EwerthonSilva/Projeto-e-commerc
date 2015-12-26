<%-- 
    Document   : index
    Created on : 06/05/2015, 13:00:43
    Author     : Thon
--%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <title>WE Informatica</title>
        <link rel="shortcut icon" type="image/ico" href="imagens/we_logo.jpg">

        <!-- Bootstrap -->
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/font-awesome.css" rel="stylesheet" >

        <!-- <link href='http://fonts.googleapis.com/css?family=Roboto:400,700' rel='stylesheet' type='text/css'> -->
        <link href="css/meucss.css" rel="stylesheet">
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body style="font-family: fontawesomeregular" >

        <!--Inicio do banner-->
        <div class="banner" >

            <a id="Inicio" href="#Inicio" data-url="paginas/inicial.jsp" >
                <img src="imagens/banner.jpg" alt="" > 

            </a>
        </div>
        <!--Fim do banner-->

        <!--Inicio do menu de navegação-->
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navig  ation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">

                        <li>
                            <a id="Inicio" href="#Inicio" data-url="paginas/inicial.jsp"  data-push-breadcrumb="0" >
                                <span class="fa fa-home" > </span>
                                Inicio
                            </a>
                        </li>
                        <li>
                            <a id="Equipamentos" href="#Equipamentos" data-url="paginas/equipamentos.jsp" data-push-breadcrumb="1" >
                                <span class="fa fa-laptop" > </span>
                                Equipamentos
                            </a>
                        </li>

                        <li>
                            <a id="Hardwares" href="#Hardwares" data-url="paginas/hardware.jsp" data-push-breadcrumb="1">
                                <span class="fa fa-hdd-o"></span>
                                Hardwares
                            </a>
                        </li>
                        <li>
                            <a id="Softwares" href="#Softwares" data-url="paginas/softwares.jsp" data-push-breadcrumb="1">
                                <span class="fa fa-windows"></span>
                                Softwares
                            </a>
                        </li>
                        
                        <li>
                            <a class="" id="Item" href="#Item" data-url="paginas/selectItem.jsp" >
                                <span class="fa fa-wrench"></span>
                                Item
                            </a>
                        </li>

                        <form class="navbar-form navbar-left" role="search">
                            <div class="input-group">
                                <input id="nomeP" name="nomeP" type="text" class="form-control" placeholder="Olá, posso lhe ajudar? ">
                                <span class="input-group-btn">
                                    <button id="pesquisar_produto" class="btn btn-default" type="button"><span class="glyphicon glyphicon-search" </button>
                                </span>
                            </div><!-- /input-group -->
                        </form>
                        <li>
                            <a id="Fale_Conosco" href="#Fale_Conosco" data-url="paginas/fale_conosco.jsp" data-push-breadcrumb="1">
                                <span class="fa fa-phone"></span>
                                Fale Conosco
                            </a>
                        </li>
                        <li>
                            <a id="Quem_Somos" href="#Quem_Somos" data-url="paginas/quem_somos.jsp" data-push-breadcrumb="1">
                                <span class="fa fa-building"></span>
                                Quem Somos
                            </a>
                        </li>

                        <li >
                            <a id="Entrar" href="#Entrar" data-toggle="modal" data-target="#modalLogin">
                                <span class="fa fa-user" ></span> 
                                Entrar

                            </a>
                        </li>

                        <li >
                            <a id="Carrinho_de_Compras" href="#Carrinho_de_Compras" data-url="paginas/carrinho_de_compra.jsp" data-push-breadcrumb="1">
                                <span class='fa fa-shopping-cart'></span>
                                Carrinho de Compras
                            </a>
                        </li>

                        <li class="menu_cliente hide"><a id="link_sair" href="#" >Sair</a></li>

                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>

        <ol id="navegabilidade" class="breadcrumb">
            <li> 
                <a id="Inicio" href="#Inicio" data-url="paginas/inicial.jsp"  data-push-breadcrumb="0" >
                    <span class="fa fa-home" > </span>
                    Inicio
                </a>
            </li>
        </ol>

    </div>
    <div id="box_alertas" class="col-md-8 col-md-offset-2 text-center"></div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-12" id="conteudo">

                <!-- Div do conteúdo principal -->
                <jsp:include page="paginas/inicial.jsp" />

                <!-- fim da Div do conteúdo principal -->
            </div>
        </div>
        <footer>

            <p class="pull-right"><a href="#">Back to top</a></p>
            <p>&copy; 2014 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
        </footer>
    </div>    

    <!-- Inicio do Modal de Login-->
    <div class="modal fade" id="modalLogin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Entrar</h4>
                </div>
                <div class="modal-body">

                    <div id="box_alertas_cad_usuario" class="text-center"></div>
                    <form id="form_log_usuario" class="form-horizontal" method="post" action="Autentica" data-ajax="1" data-saida-sucesso="#box_alertas" data-saida-erro="#box_alertas">

                        <div class="form-group">
                            <label class="col-md-4 control-label" for="user">E-Mail:</label>  
                            <div class="col-md-6">
                                <input id="user" name="user" placeholder="Digite seu E-Mail" class="form-control input-md" required="" type="email">

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="pass">Senha:</label>
                            <div class="col-md-6">
                                <input id="pass" name="pass" placeholder="Digite sua senha" class="form-control input-md" required="" type="password" pattern="^.{6,10}$" title="A senha deve possuir entre 6 e 10 dígitos" oninput="validaSenha(this, senha2)">

                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" value="Submit" class="btn btn-primary">Entrar</button>

                            <div  style="float: left">

                                <a id="Cadastrar" href="#Cadastrar" data-url='paginas/cad_cliente.jsp'>

                                    Não sou cadastrado!
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery-2.1.3.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.js"></script>
    <!-- funções personalizadas do site -->
    <script src="js/funcoes_home.js"></script>
    <!-- funções personalizadas do site -->
    <script src="js/verifica_autenticado.js"></script>
    <!-- formulário ajax -->
    <script src="js/form_ajax.js"></script>
    <script src="js/bootbox.min.js"></script>
    <script src="js/jquery.maskedinput.js" type="text/javascript"></script>
</body>
</html>