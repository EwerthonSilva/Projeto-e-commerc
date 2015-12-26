<%-- 
    Document   : carrinho_de_compra
    Created on : 17/06/2015, 20:10:27
    Author     : Thon
--%>


<%@page import="database.CarrinhodeCompra"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="database.Conexao" %>
<%@page import="java.util.List"%>

<div class='page-header text-center'>
    <h1>Carrinho de Compras</h1>
</div>
<table class="table table-bordered table-hover table-striped">
    <tr>
        <th>Codigo</th>
        <th>Nome</th>
        <th>Pre�o</th>
        <th>Op��es</th>
    </tr>

    <%
        //Estabelece a conex�o
        //Connection con = Conexao.abrirConexao("clientedb");
        //Grava a conex�o no atributo com a classe usu�rios
        //Produto.con = con;
        //criar um arraylist - acionar m�todo lista
        List<CarrinhodeCompra> carrinhos = CarrinhodeCompra.listaCompras();
        //la�o de repeti��o percorrendo o arraylist para
        //gera��o da linha din�mica
        //Par�metro 1: Usu�rios = Classe dos objetos
        //Par�metro 2: usuario - vari�vel tempor�ria contendo o usu�rio da vez
        //Par�metro 3: usuarios = arraylist que cont�m os usu�rios retornados
        if (carrinhos != null) {

            for (CarrinhodeCompra carrinho : carrinhos) {


    %>

    <tr>
        <th><%=carrinho.id_produto%></th>
        <th><%=carrinho.nome%></th>
        <th><%=carrinho.preco%></th>
        <th class="text-center">

            <a href="#link_gerencia_usuario" class="alterar_usuario">
                <span class="glyphicon glyphicon-edit"></span></a>
            <a href="#link_gerencia_usuario" class="excluir_usuario">
                <span class="glyphicon glyphicon-remove"></span></a>


        </th>
    </tr>

    <%
            }

        }
    %>


</table>