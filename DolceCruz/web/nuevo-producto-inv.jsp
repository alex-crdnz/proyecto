<%-- 
    Document   : construccion
    Created on : 2 nov 2021, 20:19:21
    Author     : Toxico
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="">
        <title>Registro de Productos de Inventario</title>
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
             ResultSet rs;
            %>
        <h1 style="text-align: center">Registro de Productos</h1>
        <form action="">
            <table border="1" width="250" align="center">
                <tr>
                    <td>Nombre: </td>
                    <td><input type="text" name="nombre"></td>
                </tr>
                <tr>
                    <td>Tipo de Unidad: </td>
                    <td><input type="text" name="unidad"></td>
                </tr>
                <tr>
                    <td>Cantidad: </td>
                    <td><input type="text" name="cantidad"></td>
                </tr>
                <th colspan="2"><input type="submit" name="newproduct" value="Registrar Producto"></td>
            </table>
        </form>
        <%
            if(request.getParameter("newproduct")!=null){
                String nombre = "";
                String unidad = "";
                float cantidad = 0;
                try{
                    
                    nombre = request.getParameter("nombre");
                    unidad = request.getParameter("unidad");
                    cantidad = Float.parseFloat(request.getParameter("cantidad"));
                    }catch(NumberFormatException e){
                request.getRequestDispatcher("inventario.jsp").forward(request, response);
            }
                    try{
                        Class.forName(driver);
                        cn = DriverManager.getConnection(url,usuario,clave);
                        stmt = cn.createStatement();
                        stmt.executeUpdate(
                        "INSERT INTO `productos` (`NOMBRE`, `tipo_unidad`, `cantidad`, `usuario`, `tipo_inv`) VALUES ('"+nombre+"', '"+unidad+
                                "', '"+cantidad+"', '"+getServletContext().getAttribute("user")+"', 'INVENTARIO')");
                        cn.close();
                        stmt.close();
                        request.getRequestDispatcher("inventario.jsp").forward(request, response);
                    }catch(Exception e){out.print("Ingrese los datos correctamente");}
            }
            %>
    </body>
</html>
