<%-- 
    Document   : editar-user
    Created on : 30 nov 2021, 21:14:19
    Author     : Toxico
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="principal_1.css">
        <title>Editar</title>
    </head>
    <body>
        <a href="administrar.jsp">
            <img src = "iconos/regresar.png" width="30" height="30"></a>
        <h1 style="text-align: center">Editar Usuarios</h1>
        <%
             String id = request.getParameter("id");
             Connection cn;
             String url = "jdbc:mysql://localhost:3306/DolceCruzDB";
             String clave = "Toxico3.";
             String usuario = "root";
             String driver = "com.mysql.cj.jdbc.Driver";
             Statement stmt = null;
             ResultSet rs;
             try{
                    Class.forName(driver);
                    cn = DriverManager.getConnection(url,usuario,clave);
                    stmt = cn.createStatement();
                    rs =  stmt.executeQuery(
                    "select id,usuario,acceso from usuarios where id = '"+id+"'");
                    while(rs.next()){
                       
            %>
        <form action="">
            <table border="1" width="250" align="center">
                <tr>
                    <td>Usuario: </td>
                    <td><input type="text" name="usuario" value="<%=rs.getString(2)%>" readonly="readonly"></td>
                </tr>
                <tr>
                    <td>Contraseña: </td>
                    <td><input type="text" name="acceso" value="<%=rs.getString(3)%>"></td>
                </tr>
                <th colspan="2"><input type="submit" name="edituser" value="Editar Usuario"></td>
            </table>
        </form>
        <%
                    }
                    cn.close();
                    stmt.close();
                    rs.close();
                }catch(Exception e){out.print(e);}

                if(request.getParameter("edituser")!= null){
                    String acceso = "";
                    try{
                        acceso = request.getParameter("acceso");
                    }catch(NumberFormatException e){out.print(e);                        }

                     try{
                        Class.forName(driver);
                        cn = DriverManager.getConnection(url,usuario,clave);
                        stmt = cn.createStatement();
                         stmt.executeUpdate("update usuarios set  acceso = '"+acceso+
                            "' where id ='"+getServletContext().getAttribute("id")+"'");
                        cn.close();
                        stmt.close();
                        request.getRequestDispatcher("administrar.jsp").forward(request, response);
                    }catch(Exception e){out.print(e+" "+ acceso+" "+getServletContext().getAttribute("id"));}
                }
                    %>
    </body>
</html>
