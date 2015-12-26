<%-- 
    Document   : selectItem
    Created on : 19/06/2015, 16:52:14
    Author     : Thon
--%>


<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="database.*" %>
<%@page import="java.util.List"%>


<div class='page-header text-center'>
    <h1>Catálogo de Itens</h1>
</div>
<div class="row">


    <%
        //Estabelece a conexão
        Connection con = Conexao.abrirConexao("clientedb");
        //Grava a conexão no atributo com a classe usuários
        Produto.con = con;
        
//        Produto prod = new Produto();
  //      prod.ID = Integer.parseInt(request.getParameter("nomeP"));
        
        //criar um arraylist - acionar método lista
        List<Produto> produtos = Produto.selecionarProduto(Integer.parseInt(request.getParameter("nomeP")));
        //laço de repetição percorrendo o arraylist para
        //geração da linha dinâmica
        //Parâmetro 1: Usuários = Classe dos objetos
        //Parâmetro 2: usuario - variável temporária contendo o usuário da vez
        //Parâmetro 3: usuarios = arraylist que contém os usuários retornados
        for (Produto produto : produtos) {
            String img = produto.imagem_produto;
            String preco = String.valueOf(produto.preco_produto) + '0';
            String nome = produto.nome_produto;

    %>

    <div id="produto" class="col-sm-6 col-md-3">
        <div class="thumbnail">

            <img src="<%=img%>"> 
            <div class="caption">
                <h4><%=nome%></h4>
                <h3 style="text-align: right; color: blue">R$ <%=preco%></h3>
                <p>
                    <a id="Comprar" href="#Comprar" data-url="paginas/fale_conosco" class="btn btn-primary" role="button">
                        Adicionar ao Carrinho
                    </a> 
                </p>
            </div>
        </div>
    </div>

    <%

        }
    %>

</div>
