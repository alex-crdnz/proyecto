<%-- 
    Document   : eliminar-producto
    Created on : 30 nov 2021, 19:18:58
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
        <a href="inventario.jsp">
            <img src = "iconos/regresar.png" width="30" height="30"></a>
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
                    request.getRequestDispatcher("inventario.jsp").forward(request, response);

            }catch(Exception e){out.print("Ingrese los datos correctamente");}
            %>
    </body>
</html>
