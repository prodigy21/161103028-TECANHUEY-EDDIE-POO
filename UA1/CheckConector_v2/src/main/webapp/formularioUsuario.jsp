<%-- 
    Document   : formularioUsuario
    Created on : 12-jun-2020, 8:52:00
    Author     : Eddie-Perez
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String titulo="Agregar Usuario", usuario="", action="agregarUsuario.jsp";
    int id=0;
    if(request.getParameter("id")!=null){
        id=Integer.parseInt(request.getParameter("id"));
        titulo="Editar Usuario";
        action="editarUsuario.jsp";
        Connection conexion=null;
        PreparedStatement stnt = null;
        ResultSet rs = null;
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost/usuarios","root","");
            stnt = conexion.prepareStatement("SELECT * FROM usuario WHERE id_usuario=?");
            stnt.setInt(1, id);
            rs = stnt.executeQuery();
            rs.next();
            usuario=rs.getString("usuario");
            if(usuario!=null){
                System.out.println("Usuario agregado exitosamente");
            }
            
            //out.print(rs.getString("password"));
        } 
        catch(Exception x){
            out.print(x.getMessage());
        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/b01b6c5c54.js" crossorigin="anonymous"></script>
        <title>Formulario Usuario</title>
    </head>
    <body>
        <h1><%=titulo%></h1>
        <div class="container"> 
            <form action="<%=action%>" method="GET">
                    <div class="form-row">
                        <% if(id!=0) {%><%--Cuando edita un Us, no se muestra la contraseña--%>
                        <div class="col">
                            <input type="hidden" class="form-control" name="id_usuario" value="<%=id%>" />
                        </div>
                        <% } %>
                        <div class="col">
                            <input type="text" value="<%=usuario%>" class="form-control" placeHolder="Nombre" name="usuario" required/>
                        </div>
                        <%if(id==0){ %><%--Cuando agrega un Us, muestra la contraseña--%>
                        <div class="col">
                            <input type="password" class="form-control" placeholder="Contraseña" name="password" required/>
                        <% } %>    
                        </div>
                        <div class="col">
                            <input type="submit" class="form-control" value="Enviar" />
                        </div>
                    </div>
                </form>
        </div>
    </body>
</html>
