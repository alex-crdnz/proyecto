<%-- 
    Document   : index
    Created on : 13 abr. 2021, 20:41:59
    Author     : Toxico
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="diseñologin.css">
        <title>JSP Page</title>
    <body style="color: black">
        <h1>Login</h1>
        <form action="Session.lo" method="post">
            <input type="text" name="user" placeholder="Usuario"/><br/>
            <input type="password" name="pass" placeholder="Contraseña"/><br/><br/>
            <input style="WIDTH: 140px; HEIGHT: 40px" type="submit" name="iniciar" value="Iniciar Sesión" >
            <input style="WIDTH: 140px; HEIGHT: 40px" type="submit" name="registrar" value="Registrarse" >
        </form>
        <% 
            String result = (String)request.getAttribute("result");
            if (result != null)
                out.print(result);
        %>
    </body>
</html>
