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
import javax.servlet.http.HttpSession;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import manejoDatos.Usuarios;

/**
 *
 * @author Toxico
 */
@WebServlet(name = "Servlet", urlPatterns = {"/Session.lo"})
public class Servlet extends HttpServlet {
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
            out.println("<title>Servlet Servlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Servlet at " + request.getContextPath() + "</h1>");
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
                if("Cerrar Session".equals(request.getParameter("cerrar"))){
            HttpSession session = request.getSession();
            session.invalidate();
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        if("Registrarse".equals(request.getParameter("registrar"))){
            request.getRequestDispatcher("Registrar.jsp").forward(request, response);
            }
                
        String user = request.getParameter("user".trim());
        String pass = request.getParameter("pass").trim();
        Connection cn;
        Statement stmt = null;
        ResultSet rs;
        
        try {  
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch (ClassNotFoundException ex) {
            Logger.getLogger(Servlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try {
            cn = DriverManager.getConnection(url,usuario,clave);
            stmt = cn.createStatement();
            rs =  stmt.executeQuery(
                    "select * from usuarios where usuario ='"+user
                            +"' and pssw = '" + pass + "'" );
            if(rs.next()){
                Usuarios usuarios = new Usuarios(user, pass);
                HttpSession session = request.getSession();
                session.setAttribute("usuario", usuarios);
                request.setAttribute("usuarios", usuarios);
                request.setAttribute("user", user);
                request.getRequestDispatcher("logueo.jsp").forward(request, response);
            }
            else{
                System.out.print("<h1>Datos incorrectos</h1>");
                request.getRequestDispatcher("incorrecto.lo").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Servlet.class.getName()).log(Level.SEVERE, null, ex);
            System.out.print("<h1>No se pudo conectar</h1>");
        request.getRequestDispatcher("incorrecto.lo").forward(request, response);
        }
        //processRequest(request, response);
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
