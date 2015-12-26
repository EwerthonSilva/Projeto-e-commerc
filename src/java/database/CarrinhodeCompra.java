/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.util.List;
import java.util.ArrayList;

/**
 *
 * @author Thon
 */
public class CarrinhodeCompra {

    public int id_produto;
    public String nome;
    public String preco;

    public static List<CarrinhodeCompra> listaProduto = new ArrayList<CarrinhodeCompra>();

    public static void InserirItem(int id, String nome, String preco) {
    //public static void InserirItem(int id) {

        CarrinhodeCompra carrinho = new CarrinhodeCompra();
        carrinho.id_produto = id;
        carrinho.nome = nome;
        carrinho.preco = preco;

        listaProduto.add(carrinho);

    }

    public static List<CarrinhodeCompra> listaCompras() {

        return listaProduto;
    }

}
