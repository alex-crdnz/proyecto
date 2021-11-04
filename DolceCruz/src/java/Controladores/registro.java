/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Toxico
 */
@WebServlet(name = "registro", urlPatterns = {"/registro.lo"})
public class registro extends HttpServlet {
    
    private final String url = "jdbc:mysql://localhost:3306/dolcecruzdb";
    private final String clave = "Toxico3.";
    private final String usuario = "root";

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet registro</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet registro at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        //processRequest(request, response);
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
       // processRequest(request, response);
        if("Cancelar".equals(request.getParameter("cerrar"))){
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
       String nombre = request.getParameter("nombre");
       String user = request.getParameter("usuario".trim());
       String password = request.getParameter("pssw".trim());
       
       Connection cn;
       Statement stmt;
       ResultSet rs;
       String sql;
       PreparedStatement ps;
       
       
       try {  
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch (ClassNotFoundException ex) {
            Logger.getLogger(Servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
       try{
           sql = "INSERT INTO `dolcecruzdb`.`usuarios` (`usuario`, `pssw`, `nombre`) VALUES (?,?,?)";
           try {
               if (nombre.isEmpty() || user.isEmpty() || password.isEmpty()){
                   request.setAttribute("result", "Ingrese Correctamente los Datos");
                   request.getRequestDispatcher("Registrar.jsp").forward(request, response);
               }
           }catch (NumberFormatException e){
                   request.setAttribute("result", "Ingrese Correctamente los Datos");
                   request.getRequestDispatcher("Registrar.jsp").forward(request, response);
                   }
           cn = DriverManager.getConnection(url,usuario,clave);
           try{
               cn = DriverManager.getConnection(url,usuario,clave);
               stmt = cn.createStatement();
               rs =  stmt.executeQuery(
                    "select * from usuarios where usuario ='"+user+"'" );
               if(rs.next()){
                   request.setAttribute("result", "Este Usuario ya existe");
                   request.getRequestDispatcher("Registrar.jsp").forward(request, response);
            }
           }catch (SQLException ex){
               Logger.getLogger(Servlet.class.getName()).log(Level.SEVERE, null, ex);
               System.out.print("<h1>No se pudo conectar</h1>");
               request.getRequestDispatcher("incorrecto.lo").forward(request, response);
           }
           ps = cn.prepareStatement(sql);
           ps.setString(1, user);
           ps.setString(2, password);
           ps.setString(3, nombre);
           int execute = ps.executeUpdate();
           if (execute > 0){
               cn.close();
               request.setAttribute("result", "Se Registro Correctamente");
               request.getRequestDispatcher("index.jsp").forward(request, response);
           }
           else {
               cn.close();
               request.setAttribute("result", "No se pudo generar el registro llene correctamente los datos");
               request.getRequestDispatcher("index.jsp").forward(request, response);
           }
           
           /*sql = "INSERT INTO `evidencia`.`registro` (`usuario`, `pssw`, `nombre`, `edad`, `sexo`, `estatura`) \n" +
                    "    VALUES ('"+ user +"','"+ password +"','"+ nombre +"','"+ edad +"','"+ sexo +"','"+ estatura +"')";*/
           
       }catch(SQLException ex){
            Logger.getLogger(Servlet.class.getName()).log(Level.SEVERE, null, ex);
            System.out.print("<h1>No se pudo generar el registro llene correctamente los datos</h1>");
            request.getRequestDispatcher("incorrecto.lo").forward(request, response);
       }
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
