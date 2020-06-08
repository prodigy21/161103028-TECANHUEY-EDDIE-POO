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
         Class.forName("com.mysql.jdbc.Driver");
         conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios","root","");
         stnt = conexion.createStatement();
         rs = stnt.executeQuery("select * from usuario");
         while(rs.next()){
            out.print(rs.getString(1));
            out.print(rs.getString(2));
         }
    }
    catch(IOException e){
        out.print(e.getMessage());
    }
    catch(SQLSyntaxErrorException e){
        out.print("No existe la Base de Datos");
    }
    
    catch(Exception e){
        out.print("Es de tipo: "+ e.getMessage());
        
    }
    finally{%><br><%
        out.println("Fin del programa");
    }
%>
    </body>
</html>
