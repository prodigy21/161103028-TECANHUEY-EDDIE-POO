<%-- 
    Document   : newjsp
    Created on : 06-jun-2020, 21:02:15
    Author     : Eddie-Perez
--%>

<%@page import="com.mysql.cj.jdbc.exceptions.CommunicationsException"%>
<%@page import="com.mysql.cj.exceptions.*"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Usuarios</title>
            
    </head>
    <body>
        <h1>Los registros de la Base de Datos son:</h1>
            <tr>
                <td colspan="2"><h2>Usuarios</h2></td>
                <td><a class="btn btn-success btn-block" href="formularioUsuario.jsp">Agregar Usuario</a></td>
            </tr>
<%
    Connection conexion = null;
    PreparedStatement stnt = null;
    ResultSet rs = null;
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios","root","");
        stnt = conexion.prepareStatement("select * from usuario");
        rs = stnt.executeQuery();
        %>
    <style>table, th, td{border: 1px solid black; padding: 5px}
    </style>
    <table align="center" style="white-space: 10%">
            <tr>
              <th>Id</th>
              <th>Usuario</th>
              <th>Contraseña</th>
            </tr>
<%
        while(rs.next()){
        %><tr>
            <td><%out.print(rs.getString("id_usuario"));%></td>
            <td><%out.print(rs.getString("usuario"));%></td>
            <td><%out.print(rs.getString("password"));%></tr><%
        }%>
        </table>
<%
    }
    
    catch (IOException d){
        d.getMessage();
    }
  
    catch(SQLSyntaxErrorException e){
        out.print("No existe en la Base de ,Datos");
    }

    catch(ClassNotFoundException e){
        out.print("Falta el jdbc.Driver o hay un problema de escritura");
    }

    catch(NullPointerException e){
        out.println("El servidor está desactivado");
    }
    
    catch(CommunicationsException e){
        out.println("El controlador no ha recibido ningún paquete del servidor.");
    }
    
    finally{%><br><br><%
        out.println("Fin del programa");    
    }
%>
    </body>
</html>