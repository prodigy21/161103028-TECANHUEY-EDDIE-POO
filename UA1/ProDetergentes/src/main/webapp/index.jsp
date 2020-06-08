<%-- 
    Document   : index
    Created on : 05-jun-2020, 0:35:34
    Author     : Eddie-Perez
--%>

<%@page import="java.io.IOException"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MuestraDatos </title>
    </head>
    <body>
        <h1>Mostrar datos</h1><br>
        <label>Muestra la marca del producto y la corporacion a la que pertenecen</label>
        <br>
        
    </body>
</html>
<%
    Connection conexion = null;
        Statement stnt = null;
        ResultSet rs = null;
        
        
        try{
         Class.forName("com.mysql.jdbc.Driver");
         conexion = DriverManager.getConnection("jdbc:mysql://localhost/detergentes","root","");
         stnt = conexion.createStatement();
         
         rs = stnt.executeQuery("select producto.marca,corporacion.nombre from producto join corporacion on producto.idCorp=corporacion.idCorp");
         %>
         <style>table, th, td{border: 1px solid black; padding: 5px} 
         </style>
            <table style="white-space: 10%">
                <tr>
                    <th>Marca</th>
                    <th>Corporación</th>                   
                </tr>
                <%
         while(rs.next()){%>
         <tr>
             <td><%out.print(rs.getString(1));%></td>
             <td><%out.print(rs.getString(2));%></td></tr><%
         }%>
            </table>
         <%
    }
    catch(SQLSyntaxErrorException e){
        out.println("La base de datos no existe");
    }
    catch(IOException d){
        out.println(d.getMessage());
    }
        
    finally{%><br><%
        out.println("Fin del programa");
    }
    
%>
