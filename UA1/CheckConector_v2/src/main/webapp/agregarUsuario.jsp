<%-- 
    Document   : agregarUsuario
    Created on : 13-jun-2020, 0:34:25
    Author     : Eddie-Perez
--%>

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<!DOCTYPE html>
<%
    
    Connection conexion = null;
    PreparedStatement stnt = null;
    ResultSet rs = null;
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios","root","");
        //stnt = conexion.prepareStatement("INSERT INTO usuario SET usuario=?, password=?");
        stnt = conexion.prepareStatement("INSERT INTO usuario(usuario, password) VALUES(? ,MD5(?))");
        stnt.setString(1,request.getParameter("usuario"));
        stnt.setString(2,request.getParameter("password"));
        stnt.executeUpdate();
        
        
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Usuario</title>
    </head>
    <body>
        <h1>Usuario agregado satisfactoriamente </h1>
        <form action="index.jsp" method="POST"/>
            <div class="form-row">
                <div class="col">
                    <input type="submit" class="btn btn-success btn-block" value="Regresar al Inicio"/>
                </div>
            </div>
        </form>
    </body>
</html>
<%
    }
    
    catch(Exception e){
        out.print("erro"+e.getMessage());}
%>
