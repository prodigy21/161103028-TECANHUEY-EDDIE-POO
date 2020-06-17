<%-- 
    Document   : formularioUsuario
    Created on : 12-jun-2020, 8:52:00
    Author     : Eddie-Perez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <title>Agregar Usuario</title>
    </head>
    <body>
        <div class="container"> 
            <h1 align="center">Agregar Usuario</h1>
                <form action="agregarUsuario.jsp" method="POST">
                    <div class="form-row">
                        <div class="col">
                            <input type="text" class="form-control" placeHolder="Nombre" name="usuario" id="usuario" required/>
                        </div>
                        <div class="col">
                            <input type="password" class="form-control" placeholder="Contraseña" name="password" id="password" required/>
                        </div>
                        <div class="col">
                            <input type="submit" class="btn btn-success btn-block" value="Enviar" />
                        </div>
                    </div>
                </form>
        </div>
    </body>
</html>
