<%-- 
    Document   : pago
    Created on : 01/07/2024, 04:17:49 PM
    Author     : qmarc
--%>

<!-- pago.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pago</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <jsp:include page="components/navegacion.jsp" />
        <div class="container mt-5">
            <h2>Datos de Pago</h2>
            <form action="PagoControlador" method="post">
                <div class="mb-3">
                    <label for="numeroTarjeta" class="form-label">Número de tarjeta</label>
                    <input type="text" class="form-control" id="numeroTarjeta" name="numeroTarjeta" required>
                </div>
                <div class="mb-3">
                    <label for="mesExpiracion" class="form-label">Mes de expiración</label>
                    <input type="text" class="form-control" id="mesExpiracion" name="mesExpiracion" required>
                </div>
                <div class="mb-3">
                    <label for="anioExpiracion" class="form-label">Año de expiración</label>
                    <input type="text" class="form-control" id="anioExpiracion" name="anioExpiracion" required>
                </div>
                <div class="mb-3">
                    <label for="cvv" class="form-label">CVV</label>
                    <input type="text" class="form-control" id="cvv" name="cvv" required>
                </div>
                <button type="submit" class="btn btn-primary">Realizar Pago</button>
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    </body>
</html>


