<%-- 
    Document   : eliminar-producto-list
    Created on : 30 nov 2021, 19:19:30
    Author     : Toxico
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Producto</title>
    </head>
    <body>
                 <%
             Connection cn;
             String url = "jdbc:mysql://localhost:3306/DolceCruzDB";
             String clave = "Toxico3.";
             String usuario = "root";
             String driver = "com.mysql.cj.jdbc.Driver";
             Statement stmt = null;
             String id = request.getParameter("id");
             try{
                    Class.forName(driver);
                    cn = DriverManager.getConnection(url,usuario,clave);
                    stmt = cn.createStatement();
                    stmt.executeUpdate(
                        "delete from productos where id = '"+id+"'");
                    cn.close();
                    stmt.close();
                    request.getRequestDispatcher("lista-compras.jsp").forward(request, response);

            }catch(Exception e){out.print("Ingrese los datos correctamente");}
            %>
    </body>
</html>
