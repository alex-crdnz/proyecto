<%-- 
    Document   : Registrar
    Created on : 23 may 2021, 14:50:56
    Author     : Toxico
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="diseñologin.css">
        <title>Nuevo Usuario</title>
    </head>
    <body>
        <h1>Ingrese los siguientes campos</h1>
        <% 
            String result = (String)request.getAttribute("result");
            if (result != null)
                out.print(result);
        %>
        <form action="registro.lo" style="color: black" align="center" method="post">
            Nombre <input type="text" name="nombre" placeholder="nombre"/><br/><br/>
            Usuario <input type="text" name="usuario" placeholder="Usuario"/><br/><br/>
            Contraseña <input type="text" name="pssw" placeholder="Contraseña"/><br/><br/>
            <input type="submit" name="registro" value="Confirmar"/>
            <input type="submit" name="cerrar" value="Cancelar"/><br/>
        </form>
    </body>
</html>
