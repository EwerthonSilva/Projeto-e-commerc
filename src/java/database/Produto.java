/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author darnos
 */
public class Produto {

    public int ID;
    public int id_produto;
    public double preco_produto;
    public int id_categoria;
    public String descricao_produto;
    public String imagem_produto;
    public String nome_produto;

    public static Connection con;

    //método Lista retorna um arraylist contendo todos os usuários do banco de dados
    public static List<Produto> lista() {

        try {
            String sql = "select id_produto, preco_produto, id_categoria, descricao_produto, imagem_produto, nome_produto from produtos order by id_produto";
            //criar arrayList
            List<Produto> listaProdutos = new ArrayList<Produto>();
            //prepara o comando para ser executado
            PreparedStatement ps = con.prepareStatement(sql);
            //executa o comando SQL e armazena o resultado na variável
            ResultSet rs = ps.executeQuery();
            //verifica se existe algum resultado retornado pelo BD
            if (rs != null) {
                //cria o laço de repetição para percorrer o resultset
                //alimentando o arraylist
                while (rs.next()) {
                    //cria o objeto do usuário para alimentar o arraylist
                    //dentro da variável usuários
                    Produto produtos = new Produto();
                    //grava os valores nos atributos do objeto
                    produtos.id_produto = rs.getInt(1);
                    produtos.preco_produto = rs.getDouble(2);
                    produtos.id_categoria = rs.getInt(3);
                    produtos.descricao_produto = rs.getString(4);
                    produtos.imagem_produto = rs.getString(5);
                    produtos.nome_produto = rs.getString(6);
                    listaProdutos.add(produtos);

                }
                return listaProdutos;
            } //caso o retorno do resultset for em branco
            else {
                return null;
            }
        } //em caso de erro
        catch (Exception e) {
            //grava mensagem de erro no log do servidor
            e.printStackTrace(System.out);
            return null;

        }

    }

    //metodo que seleciona o produto pelo id_produto
    public static List<Produto> selecionarProduto(int nome) {
        try {
            PreparedStatement sql = (PreparedStatement) con.prepareStatement("select id_produto, preco_produto, id_categoria, descricao_produto, imagem_produto, nome_produto from produtos where id_produto = " + nome);
            ResultSet rs = sql.executeQuery();
            //CRIA OBJHETOS LISTA PRODUTOS DO TIPO LIST RESPONSAVEL POR,
            //ARMAZENAR TODOS OS REGISTROS QUE FOREM SELECIONADOS NO LIKE.
            List<Produto> listaProduto = new ArrayList<Produto>();
            while (rs.next()) {
                //cria objeto temporario funcionario
                Produto produtos = new Produto();
                //grava os valores nos atributos do objeto
                produtos.id_produto = rs.getInt(1);
                produtos.preco_produto = rs.getDouble(2);
                produtos.id_categoria = rs.getInt(3);
                produtos.descricao_produto = rs.getString(4);
                produtos.imagem_produto = rs.getString(5);
                produtos.nome_produto = rs.getString(6);
                listaProduto.add(produtos);

            }
            //rs.close();
            //sql.close();
            return listaProduto;
        } //em caso de erro
        catch (Exception e) {
            //grava mensagem de erro no log do servidor
            e.printStackTrace(System.out);
            return null;

        }
    }

    //metodo que seleciona o produto pelo id_categoria
    public static List selecionarCategoria(int idCategoria) {
        try {
            PreparedStatement sql = (PreparedStatement) con.prepareStatement("select * from produtos where id_categoria = " + idCategoria);
            ResultSet rs = sql.executeQuery();
            //CRIA OBJETOS LISTA PRODUTOS DO TIPO LIST RESPONSAVEL POR,
            //ARMAZENAR TODOS OS REGISTROS QUE FOREM SELECIONADOS NO LIKE.
            List<Produto> listaProduto = new ArrayList<Produto>();
            while (rs.next()) {
                //cria objeto temporario funcionario
                Produto produtos = new Produto();
                //grava os valores nos atributos do objeto
                produtos.id_produto = rs.getInt(1);
                produtos.preco_produto = rs.getDouble(2);
                produtos.id_categoria = rs.getInt(3);
                produtos.descricao_produto = rs.getString(4);
                produtos.imagem_produto = rs.getString(5);
                produtos.nome_produto = rs.getString(6);

                listaProduto.add(produtos);

            }
            rs.close();
            sql.close();
            return listaProduto;
        } //em caso de erro
        catch (Exception e) {
            //grava mensagem de erro no log do servidor
            e.printStackTrace(System.out);
            return null;

        }
    }

}
