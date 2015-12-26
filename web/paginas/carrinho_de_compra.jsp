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
        <th>Preço</th>
        <th>Opções</th>
    </tr>

    <%
        //Estabelece a conexão
        //Connection con = Conexao.abrirConexao("clientedb");
        //Grava a conexão no atributo com a classe usuários
        //Produto.con = con;
        //criar um arraylist - acionar método lista
        List<CarrinhodeCompra> carrinhos = CarrinhodeCompra.listaCompras();
        //laço de repetição percorrendo o arraylist para
        //geração da linha dinâmica
        //Parâmetro 1: Usuários = Classe dos objetos
        //Parâmetro 2: usuario - variável temporária contendo o usuário da vez
        //Parâmetro 3: usuarios = arraylist que contém os usuários retornados
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