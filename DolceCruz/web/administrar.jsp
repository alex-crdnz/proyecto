<%-- 
    Document   : administrar
    Created on : 30 nov 2021, 19:34:52
    Author     : Toxico
--%>

<%@page import="manejoDatos.Usuarios"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="principal.css">
        <title>DolceCuuz</title>
    </head>
    <body>
        <a href="logueo.jsp">
            <img src = "iconos/regresar.png" width="30" height="30"></a>
        <%
             Connection cn;
             Connection cn2;
             String url = "jdbc:mysql://localhost:3306/DolceCruzDB";
             String clave = "Toxico3.";
             String usuario = "root";
             String driver = "com.mysql.cj.jdbc.Driver";
             Statement stmt = null;
             Statement stmt2 = null;
             ResultSet rs;
             ResultSet rs2;
             %>
            <h1 align = "center" >Usuarios</h1>
            <table border="1" width="600" align = "center" >
                <tr bgcolor ="skyblue">
                    <th colspan="4">Registrar Usuario</th>
                    <th colspan="2"><a href="nuevo-usuario.jsp"><img src = "iconos/add-user.png" width="30" height="30"></a></th>
                </tr>
                <tr bgcolor="skyblue">
                    <th>ID</th><th>Usuario</th>
                    <th>Password</th><th>Nombre</th>
                    <th colspan="2">Accion</th>
                </tr>
            
            <%
                
                try{
                    int cont = 0;
                    Class.forName(driver);
                    cn = DriverManager.getConnection(url,usuario,clave);
                    stmt = cn.createStatement();
                    rs =  stmt.executeQuery(
                    "select id,usuario,acceso,nombre from usuarios");
                    
                    while(rs.next()){
                    %>
               
    <tr>
        <th><%=rs.getString(1)%></th>
        <th><%=rs.getString(2)%></th>
        <th><%=rs.getString(3)%></th>
        <th><%=rs.getString(4)%></th>
        <th colspan="2">
            <%
                cont ++;
                if(cont != 1){
                %>
            <a href="eliminar-user.jsp?id=<%=rs.getString(1)%>">
            <img src = "iconos/elim.png" width="30" height="30"></a>
            <%
                }
            %>
            
        </th>
    </tr>
    
    
    
    
   
                    <%
                    }
                    cn.close();
                    stmt.close();
                    rs.close();
                }catch(Exception e){}
                
                %>
     </table>
    </body>
</html>