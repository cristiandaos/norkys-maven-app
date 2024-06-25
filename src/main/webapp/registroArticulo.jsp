<%-- 
    Document   : registroArticulo
    Created on : 27/05/2024, 01:00:18 AM
    Author     : qmarc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
    <jsp:include page="components/navegacion.jsp" />
    <br><br>

    <form action="ProductoControlador" method="post" style="display: flex; align-content: center; justify-content: center;">
        <div style="width: 40%; align-items: center; background-color: yellow; padding: 5%; border-radius: 50px">
            <center><h1>Registrar Alimentos</h1><br></center> 
            <br>
            <div class="form-group">
                <label for="exampleInputNombre">Nombre del Combo</label>
                <input type="text" name="nombre" class="form-control" id="exampleInputNombre" aria-describedby="nombreHelp" placeholder="Ingrese el nombre del Combo">
            </div><br>
            <div class="form-group">
                <label for="exampleInputPrecio">Precio</label>
                <input type="text" name="precio" class="form-control" id="exampleInputPrecio" aria-describedby="precioHelp" placeholder="Ingrese el Precio">
            </div><br>
            <div class="form-group">
                <label for="exampleInputCopy">Orden Completa</label>
                <textarea name="copy" class="form-control" id="exampleInputCopy" aria-describedby="copyHelp" placeholder="Ingresa los Platillos" rows="4"></textarea>
            </div><br>
            <input type="hidden" name="accion" value="registrarProducto">
            <div class="d-flex justify-content-between align-items-center">
                <button type="submit" class="btn btn-primary">Registrar</button>
            </div>
        </div>
    </form>

    <br>
</body>
</html>
