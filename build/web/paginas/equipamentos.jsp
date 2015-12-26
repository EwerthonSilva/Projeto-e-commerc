<%-- 
    Document   : equipamentos
    Created on : 18/05/2015, 12:42:05
    Author     : Thon
--%>

<%@page import="database.Produto"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="database.Conexao" %>
<%@page import="java.util.List"%>

<div class='page-header text-center'>
    <h1>Catálogo de Equipamentos</h1>
</div>
<div class="row">


    <%
        //Estabelece a conexão
        Connection con = Conexao.abrirConexao("clientedb");
        //Grava a conexão no atributo com a classe usuários
        Produto.con = con;
        //criar um arraylist - acionar método lista
        List<Produto> produtos = Produto.lista();
        //laço de repetição percorrendo o arraylist para
        //geração da linha dinâmica
        //Parâmetro 1: Usuários = Classe dos objetos
        //Parâmetro 2: usuario - variável temporária contendo o usuário da vez
        //Parâmetro 3: usuarios = arraylist que contém os usuários retornados
        for (Produto produto : produtos) {

            if (produto.id_categoria == 1) {
                String idP = String.valueOf(produto.id_produto);
                String img = produto.imagem_produto;
                String preco = String.valueOf(produto.preco_produto) + '0';
                String nome = produto.nome_produto;

    %>

    <div  class="col-sm-6 col-md-3">
        <div id="produto" class="thumbnail">
            <h5 class="hide" ><%=idP%></h4>
            <img src="<%=img%>"> 
            <div class="caption">
                <h4><%=nome%></h4>
                <h3 style="text-align: right; color: blue">R$ <%=preco%></h3>
                <p>
                    <a  class="btn btn-primary" role="button">
                        Adicionar ao Carrinho
                    </a> 
                </p>
            </div>
        </div>
    </div>

    <%
            }

        }
    %>

</div>
