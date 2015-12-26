package database;

import java.sql.*;
import java.util.*;

public class Cliente {

    public int id;
    public String nome;
    public String email;
    public String cpf;
    public String endereco;
    public String numero;
    public String complemento;
    public String cep;
    public String cidade;
    public String uf;
    public String telefone;
    public String senha;
    public static Connection con;

    public static List<Cliente> lista() {
        // TENTA EXECUTAR OS COMANDOS NO BD
        try {
            String sql = "select id, nome, email, cpf, endereco, numero, complemento, cep, cidade, uf, telefone from cliente order by nome";
            List<Cliente> listaClientes = new ArrayList<Cliente>();
            // prepara o comando para execução, indicando que haverá "?" a substituir
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            // se retornou algum usuário
            if (rs != null) {
                // while percorrerá todos os registros de usuario na resultset
                while (rs.next()) {
                    // instancia uma variável do tipo Cliente chamada usuario
                    Cliente clientes = new Cliente();
                    // grava valores do banco de dados nos atributos dos objetos
                    clientes.id = rs.getInt(1);
                    clientes.nome = rs.getString(2);
                    clientes.email = rs.getString(3);
                    clientes.cpf = rs.getString(4);
                    clientes.endereco = rs.getString(5);
                    clientes.numero = rs.getString(6);
                    clientes.complemento = rs.getString(7);
                    clientes.cep = rs.getString(8);
                    clientes.cidade = rs.getString(9);
                    clientes.uf = rs.getString(10);
                    clientes.telefone = rs.getString(11);
                    // adiciona o usuário retornado ao arraylist
                    listaClientes.add(clientes);
                }
                return listaClientes;
            } // caso não encontre nenhum usuário
            else {
                return null;
            }
        } catch (Exception e) {
            // grava a mensagem de erro em um log no servidor
            e.printStackTrace(System.out);
            return null;
        }
    }

    public static int insere( Cliente cliente) {

        // TENTA EXECUTAR OS COMANDOS NO BD
        try {

            // prepara o statement para execução de um novo comaando
            Statement st = con.createStatement();
            // cria o comando SQL para ser executado
            String sql = "insert into cliente(nome, email, cpf, endereco, numero, complemento, cep, cidade, uf, telefone,  senha) values(?,?,?,?,?,?,?,?,?,?,password(?))";
            // prepara o comando para execução, indicando que haverá "?" a substituir
            PreparedStatement ps = con.prepareStatement(sql);
            // substitui os "?" pelos respectivos valores
            ps.setString(1, cliente.nome);
            ps.setString(2, cliente.email);
            ps.setString(3, cliente.cpf);
            ps.setString(4, cliente.endereco);
            ps.setString(5, cliente.numero);
            ps.setString(6, cliente.complemento);
            ps.setString(7, cliente.cep);
            ps.setString(8, cliente.cidade);
            ps.setString(9, cliente.uf);
            ps.setString(10, cliente.telefone);
            ps.setString(11, cliente.senha);
            // executa o comando sql armazenando o resultado. 0 = erro. 1 = sucesso
            int status = ps.executeUpdate();
            // verifica se houve erro
            if (status == 0) {
                return 0;
            } else {
                return 1;
            }
        } // CASO HAJA UMA EXCEÇÃO, MOSTRA ERRO NA TELA
        catch (Exception e) {
            // grava a mensagem de erro em um log no servidor
            e.printStackTrace(System.out);
            if (e.toString().contains("Duplicate")) {
                return 2;
            } else {
                return 0;
            }
        }
    }

    public static boolean exclui(int id) {

        // TENTA EXECUTAR OS COMANDOS NO BD
        try {

            // prepara o statement para execução de um novo comaando
            Statement st = con.createStatement();
            // cria o comando SQL para ser executado
            String sql = "delete from cliente where id=?";
            // prepara o comando para execução, indicando que haverá "?" a substituir
            PreparedStatement ps = con.prepareStatement(sql);
            // substitui os "?" pelos respectivos valores
            ps.setInt(1, id);
            // executa o comando sql armazenando o resultado. 0 = erro. 1 = sucesso
            int status = ps.executeUpdate();
            // verifica se houve erro
            if (status == 0) {
                return false;
            } else {
                return true;
            }
        } // CASO HAJA UMA EXCEÇÃO, MOSTRA ERRO NA TELA
        catch (Exception e) {
            // grava a mensagem de erro em um log no servidor
            e.printStackTrace(System.out);
            return false;
            
        }
    }
    
     public static boolean autentica(Cliente cliente) {

        try {
            String sql = "select id from cliente where email=? and senha=password(?)";
            
            //prepara o comando para ser executado
            PreparedStatement ps = con.prepareStatement(sql);
            
            //substitui os ? pelas variaveis
            ps.setString(1, cliente.email);
            ps.setString(2, cliente.senha);
            //executa o comando SQL e armazena o resultado na variável
            ResultSet rs = ps.executeQuery();
            //verifica se existe algum resultado retornado pelo BD
            if (rs != null) {
                //verificando se possui um resultado
                //(autenticação válida)
                if(rs.next()){
                    return true;
                }
                //se a autenticação é inválida
                else{
                    return false;
                }
                
            } //caso o retorno do resultset for em branco
            else {
                return false;
            }
        } //em caso de erro
        catch (Exception e) {
            //grava mensagem de erro no log do servidor
            e.printStackTrace(System.out);
            return false;


        }


    }
}
