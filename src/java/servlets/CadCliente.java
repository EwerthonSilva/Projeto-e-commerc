/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import database.Cliente;
import database.Conexao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Thon
 */
public class CadCliente extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            /* TODO output your page here. You may use following sample code. */
            int idCliente = 0;
            if (!request.getParameter("id").equals("")) {
                idCliente = Integer.parseInt(request.getParameter("id"));
            }

            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String cpf = request.getParameter("cpf");
            String endereco = request.getParameter("endereco");
            String numero = request.getParameter("numero");
            String complemento = request.getParameter("complemento");
            String cep = request.getParameter("cep");
            String cidade = request.getParameter("cidade");
            String uf = request.getParameter("uf");
            String tel = request.getParameter("ddd" + "-" + "tel");
            String senha = request.getParameter("senha1");

            // instancia conexão
            Conexao c = new Conexao();
            // estabelece a conexão
            Connection con = c.abrirConexao("clientedb");

            Cliente.con = con;

            Cliente cliente = new Cliente();

            cliente.nome = nome;
            cliente.email = email;
            cliente.cpf = cpf;
            cliente.endereco = endereco;
            cliente.numero = numero;
            cliente.complemento = complemento;
            cliente.cep = cep;
            cliente.cidade = cidade;
            cliente.uf = uf;
            cliente.telefone = tel;
            cliente.senha = senha;

            if (idCliente == 0) {
                int status = Cliente.insere(cliente);

                if (status == 1) {
                    out.println("{\"success\":   true, \"msg\":   \"" + nome + " Cadastro realizado com sucesso!\"   }");

                } else if (status == 2) {
                    out.println("{\"success\":   false, \"msg\":   \"O E-Mail informado (" + email + ") já existe na base!\"   }");

                } else {
                    out.println("{\"success\":   false, \"msg\":   \"Erro ao efetuar o cadastro de " + nome + "!\"   }");
                }

            }
            else{
                /*cliente.id = idCliente;
                boolean status = Cliente.altera(cliente);
                
                */
            }
            
        }
    }

        // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
        /**
         * Handles the HTTP <code>GET</code> method.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific error occurs
         * @throws IOException if an I/O error occurs
         */
        @Override
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Handles the HTTP <code>POST</code> method.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific error occurs
         * @throws IOException if an I/O error occurs
         */
        @Override
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
