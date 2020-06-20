<%-- 
    Document   : editarUsuario
    Created on : 19-jun-2020, 16:03:10
    Author     : Eddie-Perez
--%>
<%@page import="java.lang.Exception"%>
<%@page import="com.mysql.cj.exceptions.*"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <%
    Connection conexion = null;
    PreparedStatement stnt = null;
    ResultSet rs = null;
    try{
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios","root","");
        stnt = conexion.prepareStatement("UPDATE usuario SET usuario=? WHERE id_usuario=?");
        stnt.setString(1, request.getParameter("usuario"));
        stnt.setInt(2, Integer.parseInt(request.getParameter("id_usuario")));
        stnt.executeUpdate();
        
                    
                
        
%>     
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Editar Usuario</title>
    </head>
    <body>

          <%if(stnt.executeUpdate()==0){%><h1>Error</h1><%}%>      
                
                
    <td><a class="btn btn-success btn-block" href="index.jsp">Regresar al Inicio</a></td>
    <%
}
    catch(SQLSyntaxErrorException e){
                System.out.println("d"+e.getMessage());
            }
    catch(NullPointerException d){
        System.out.println("Error al actualizar");
    }
    
   
    catch(SQLIntegrityConstraintViolationException d){
        System.out.println("Error al actualizar");
    }
    catch(SQLException e){
        System.out.println(e.getMessage());
    }
%>
    <br>
    <% if(stnt.executeUpdate()!=0){%>
                <h1>Dato actualizado</h1><br><% } %>

</body>
</html>
