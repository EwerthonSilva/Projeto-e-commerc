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
    <h1>Cat�logo de Equipamentos</h1>
</div>
<div class="row">


    <%
        //Estabelece a conex�o
        Connection con = Conexao.abrirConexao("clientedb");
        //Grava a conex�o no atributo com a classe usu�rios
        Produto.con = con;
        //criar um arraylist - acionar m�todo lista
        List<Produto> produtos = Produto.lista();
        //la�o de repeti��o percorrendo o arraylist para
        //gera��o da linha din�mica
        //Par�metro 1: Usu�rios = Classe dos objetos
        //Par�metro 2: usuario - vari�vel tempor�ria contendo o usu�rio da vez
        //Par�metro 3: usuarios = arraylist que cont�m os usu�rios retornados
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
