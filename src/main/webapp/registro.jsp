<%-- 
    Document   : registro
    Created on : 22 may. 2024, 13:11:21
    Author     : LUIS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="icon" type="image/png" href="./assets/img/logo_norkys.png">
    </head>
    <body>
         <jsp:include page="components/navegacion.jsp" />
         <br><br>
        
            
        <form action="ClienteControlador" method="post" style="display: flex; align-content: center; justify-content: center;">

            <div style="width: 40%;  align-items: center;  background-color: yellow; padding: 5%; border-radius: 50px">
                <center><h1>REGISTRAR</h1><br></center> 
                <br>
                <div class="form-group">
                    <label for="exampleInputNombres">Nombres</label>
                    <input type="text" name="nombres" class="form-control" id="exampleInputNombres" aria-describedby="nombresHelp" placeholder="Ingrese nombres">
                </div><br>
                <div class="form-group">
                    <label for="exampleInputApellifos">Apellidos</label>
                    <input type="text" name="apellidos" class="form-control" id="exampleInputApellidos" aria-describedby="apellidosHelp" placeholder="Ingrese apellidos">
                </div><br>
                <div class="form-group">
                    <label for="exampleInputTelefono">Telfono</label>
                    <input type="text" name="telefono" class="form-control" id="exampleInputTelefono" aria-describedby="nombresHelp" placeholder="Telefono">
                </div><br>
                <div class="form-group">
                    <label for="exampleInputEmail1">Correo electronico</label>
                    <input type="email" name="correo" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                </div><br>
                <div class="form-group">
                    <label for="exampleInputPassword1">Contraseña</label>
                    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Contraseña">
                </div><br>
                <br>
                <input type="hidden" name="accion" value="registrarCliente">
                <div class="d-flex justify-content-between align-items-center">
                    <button type="submit" class="btn btn btn-primary">Registrar</button>
                </div>
            </div>

        </form>
        <br>
                <jsp:include page="components/footer.jsp" />
    </body>
</html>
