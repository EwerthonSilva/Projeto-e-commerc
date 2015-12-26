package database;
import java.sql.*;
/**
 * @author SOTTO
 */
public class Conexao {
    
    public static Connection abrirConexao(String database) {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            String url = "jdbc:mysql://127.0.0.1/"+database+"?user=root&password=";
            con = DriverManager.getConnection(url);        
            System.out.println("Conexão aberta.");
        }
        catch(Exception e) {
            System.out.println(e.getMessage());
        }
        
        return con;
    }
    public static void fecharConexao(Connection con) {
        try {
            con.close();
            System.out.println("Conexão Encerrada.");
        }
        catch (Exception e) {
             System.out.println(e.getMessage());
        }
    }
    
}
