<%-- 
    Document   : logueo
    Created on : 13 abr. 2021, 20:42:11
    Author     : Toxico
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="manejoDatos.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="principal.css">
        <title>DolceCruz</title>
    </head>
    <body>
            <form method="post" action="Session.lo">
                <input style ="font-size: 25px; background-color: black; color: red" type="submit" name="cerrar" value="Cerrar Session" >
            </form>
            <h1>
                Bienvenido             
                <% 
                    Usuarios usuarios;
                    String user;
                    try{
                         usuarios = (Usuarios)request.getAttribute("usuarios");
                         user = (String)request.getAttribute("user");
                         out.print(usuarios.getNombre());
                         getServletContext().setAttribute("user",user);
                         out.print(usuarios.getNombre());
                    }catch(NullPointerException e){
                        out.print(getServletContext().getAttribute("user"));
                    }
                
                %>
            </h1>
            <h2 style="text-align: center">Control de inventario DolceCruz</h2>
            <%
                Connection cn;
                String url = "jdbc:mysql://localhost:3306/DolceCruzDB";
                String clave = "Toxico3.";
                String usuario = "root";
                String driver = "com.mysql.cj.jdbc.Driver";
                Class.forName(driver);
                cn = DriverManager.getConnection(url,usuario,clave);
                PreparedStatement ps;
                //ResultSet rs;
                //ps = cn.prepareStatement("Select * from imc where usuario = '"+ getServletContext().getAttribute("user") + "'");
                //rs = ps.executeQuery();
                %>
                <div style="text-align: center">
                    <!--
                    <form method="post" action="inventario.jsp">
                        <input type="submit" name="inv" value="inventario" >
                        <input type="submit" name="list" value="Lista Compras" >
                        <input type="submit" name="adm" value="Administrar" >
                    </form>
                    -->
                    <a href="inventario.jsp">
            <img src = "images/inv.png" width="300" height="300"></a>
                    <a href="lista-compras.jsp">_____
            <img src = "images/lista.png" width="300" height="300"></a>
                    <a href="administrar.jsp">_____
            <img src = "images/admin.png" width="300" height="300"></a>
                </div>
    </body>
</html>
