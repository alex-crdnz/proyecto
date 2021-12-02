<%-- 
    Document   : inventario
    Created on : 3 nov 2021, 22:57:21
    Author     : Toxico
--%>
<%@page import="manejoDatos.Usuarios"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DolceCuuz</title>
    </head>
    <body>
        <a href="logueo.jsp">
            <img src = "iconos/regresar.png" width="30" height="30"></a>
        <%
            if("Administrar".equals(request.getParameter("adm")))
                    request.getRequestDispatcher("administrar.jsp").forward(request, response);

            if("Lista Compras".equals(request.getParameter("list")))
                    request.getRequestDispatcher("lista-compras.jsp").forward(request, response);
            
            

             Connection cn;
             String url = "jdbc:mysql://localhost:3306/DolceCruzDB";
             String clave = "Toxico3.";
             String usuario = "root";
             String driver = "com.mysql.cj.jdbc.Driver";
             Statement stmt = null;
             ResultSet rs;
                         %>
            <h1 align = "center">Inventario</h1>
            <table border="1" width="600" align = "center">
                <tr bgcolor ="skyblue">
                    <th colspan="4">Registrar Productos</th>
                    <th colspan="2"> <a href="nuevo-producto-inv.jsp"><img src = "iconos/add.png" width="30" height="30"></a></th>
                </tr>
                <tr bgcolor="skyblue">
                    <th>ID</th><th>Nombre</th>
                    <th>Tipo Unidad</th><th>Cantidad</th>
                    <th colspan="2">Accion</th>
                </tr>
            
            <%
                
                try{
                    Class.forName(driver);
                    cn = DriverManager.getConnection(url,usuario,clave);
                    stmt = cn.createStatement();
                    rs =  stmt.executeQuery(
                    "select id,nombre,tipo_unidad,cantidad from productos where tipo_inv = 'INVENTARIO' and usuario = '"
                            +getServletContext().getAttribute("user")+"'");
                    while(rs.next()){
                    %>
               
    <tr>
        <th><%=rs.getString(1)%></th>
        <th><%=rs.getString(2)%></th>
        <th><%=rs.getString(3)%></th>
        <th><%=rs.getString(4)%></th>
        <th>
            <a href="editar-inv.jsp?id=<%=rs.getString(1)%>">
            <img src = "iconos/edit.png" width="30" height="30"></a>
        </th>
        <th>
            <a href="eliminar-producto-inv.jsp?id=<%=rs.getString(1)%>">
            <img src = "iconos/elim.png" width="30" height="30"></a>
        </th>
    </tr>
   
                    <%
                        getServletContext().setAttribute("id",rs.getString(1));
                    }
                    cn.close();
                    stmt.close();
                    rs.close();
                }catch(Exception e){}
                
                %>
     </table>
    </body>
</html>
