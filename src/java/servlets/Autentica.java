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
//import static java.lang.System.out;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author darnos
 */
public class Autentica extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
              /* TODO output your page here. You may use following sample code. */
            String email = request.getParameter("user");
            String senha = request.getParameter("pass");
            // instancia conexão
            Conexao c = new Conexao();
            // estabelece a conexão
            Connection con = c.abrirConexao("clientedb");

            Cliente.con = con;
            //cria um objeto da classe Usuarios
            Cliente cliente = new Cliente();
            //define os atributos do objeto
            cliente.email = email;
            cliente.senha = senha;
            //executa o metodo autentica passando o objeto
            boolean status = Cliente.autentica(cliente);

            //se a exclusao for realizada com sucesso
            if (status == true) {
                //habilita o uso de sessão
                HttpSession sessao = request.getSession(true);
                //cria uma variavel de sessão 'usuario'
                sessao.setAttribute("usuario", email);
                
                out.println("{\"success\":   true, \"msg\":   \"Login realizado com sucesso!\"   }");
                //out.println("Exclusão realizada com sucesso!");

            } else {
                out.println("{\"success\":   false, \"msg\":   \"Usuário ou Senha inválidos\"   }");
                //out.println("Erro ao efetuar a exclusão!");
            }
        } finally {
            out.close();
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
