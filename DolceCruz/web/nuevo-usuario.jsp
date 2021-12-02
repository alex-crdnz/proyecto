<%-- 
    Document   : nuevo-usuario
    Created on : 29 nov 2021, 21:49:40
    Author     : Toxico
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Usuario</title>
    </head>
    <body>
        <a href="administrar.jsp">
            <img src = "iconos/regresar.png" width="30" height="30"></a>
        <%
             Connection cn;
             String url = "jdbc:mysql://localhost:3306/DolceCruzDB";
             String clave = "Toxico3.";
             String usuario = "root";
             String driver = "com.mysql.cj.jdbc.Driver";
             Statement stmt = null;
             ResultSet rs;
            %>
        <h1 style="text-align: center">Registro de Usuarios</h1>
        <form action="">
            <table border="1" width="250" align="center">
                <tr>
                    <td>Usuario: </td>
                    <td><input type="text" name="usuario"></td>
                </tr>
                <tr>
                    <td>Contraseña: </td>
                    <td><input type="text" name="pssw"></td>
                </tr>
                <tr>
                    <td>Nombre: </td>
                    <td><input type="text" name="nombre"></td>
                </tr>
                <th colspan="2"><input type="submit" name="newuser" value="Registrar Usuario"></td>
            </table>
        </form>
        <%
            if(request.getParameter("newuser")!=null){
                String id = "";
                String nombre = "";
                String user ="";
                String pssw = "";
                try{
                    user = request.getParameter("usuario");
                    pssw = request.getParameter("pssw");
                    nombre = request.getParameter("nombre");
                    }catch(NumberFormatException e){
                request.getRequestDispatcher("inventario.jsp").forward(request, response);
            }
                try{
                    Class.forName(driver);
                    cn = DriverManager.getConnection(url,usuario,clave);
                    stmt = cn.createStatement();
                    rs =  stmt.executeQuery(
                    "select * from usuarios");
                    while(rs.next()){
                        id = rs.getString(1);
                    }
                    stmt.executeUpdate(
                    "INSERT INTO `usuarios` VALUES ('"+Integer.parseInt(id)+1+"', '"+user+
                            "', '"+pssw+"', '"+nombre+"')");
                    cn.close();
                    stmt.close();
                    rs.close();
                    request.getRequestDispatcher("administrar.jsp").forward(request, response);
                }catch(Exception e){out.print(e+"");}
            }
            %>
    </body>
</html>
