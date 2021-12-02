<%-- 
    Document   : editar-inv
    Created on : 30 nov 2021, 21:11:23
    Author     : Toxico
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar</title>
    </head>
    <body>
        <a href="inventario.jsp">
            <img src = "iconos/regresar.png" width="30" height="30"></a>
        <h1 style="text-align: center">Editar Productos</h1>
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
                    "select * from productos where id = '"+id+"'");
                    while(rs.next()){
                       
            %>
        <form action="">
            <table border="1" width="250" align="center">
                <tr>
                    <td>Nombre: </td>
                    <td><input type="text" name="nombre" value="<%=rs.getString(2)%>"></td>
                </tr>
                <tr>
                    <td>Tipo de Unidad: </td>
                    <td><input type="text" name="unidad" value="<%=rs.getString(3)%>"></td>
                </tr>
                <tr>
                    <td>Cantidad: </td>
                    <td><input type="text" name="cantidad" value="<%=rs.getString(4)%>"></td>
                </tr>
                <th colspan="2"><input type="submit" name="editproduct" value="Editar Producto"></td>
            </table>
        </form>
                <%
                    }
                    cn.close();
                    stmt.close();
                    rs.close();
                }catch(Exception e){}

                if(request.getParameter("editproduct")!= null){
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
                         stmt.executeUpdate("update productos set nombre = '"+nombre+"', tipo_unidad ='"+unidad+
                        "', cantidad ='"+cantidad+"' where id ='"+getServletContext().getAttribute("id")+"'");
                        cn.close();
                        stmt.close();
                        request.getRequestDispatcher("inventario.jsp").forward(request, response);
                    }catch(Exception e){out.print(e+" "+nombre+" "+ unidad+" "+cantidad+" "+getServletContext().getAttribute("id"));}
                }
                    %>
    </body>
</html>
