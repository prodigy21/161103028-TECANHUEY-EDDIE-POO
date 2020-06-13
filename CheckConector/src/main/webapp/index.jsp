<%-- 
    Document   : newjsp
    Created on : 06-jun-2020, 21:02:15
    Author     : Eddie-Perez
--%>

<%@page import="java.io.IOException"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Conexión a la Base de Datos</title>
    </head>
    <body>
        <h1>Conexión a la Base de Datos</h1>
<%
    Connection conexion = null;
        Statement stnt = null;
        ResultSet rs = null;
    try{
        Class.forName("com.mysql.jdbc.Dridver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios","root","");
        stnt = conexion.createStatement();
        rs = stnt.executeQuery("select * from usuario");
        %>
    <style>table, th, td{border: 1px solid black; padding: 5px}
    </style>
        <table style="white-space: 10%">
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
