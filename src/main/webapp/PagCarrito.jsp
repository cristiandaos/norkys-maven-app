<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Norkys</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="icon" type="image/png" href="./assets/img/logo_norkys.png">
    </head>
    <body>
        <jsp:include page="components/navegacion.jsp" />

        <div class="container-fluid mt-3">
            <h4>Carrito</h4>
            <hr />

           <div class="row " style="height: 100vh;">
                <div class="col-sm-9">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped text-center align-middle">
                                    <thead style="background-color: #264334;">
                                        <tr>
                                            <th>Imagen</th>
                                            <th>Producto</th>
                                            <th>Descripción</th>
                                            <th>Precio (S/.)</th>
                                            <th>Cantidad</th>
                                            <th>Importe (S/.)</th>
                                            <th>Acción</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <c:forEach items="${carrito}" var="items" varStatus="loop">
                                            <tr>
                                                <td>
                                                    <img src="assets/productos/${items.producto.imagen}" width="100%" height="60" alt="${items.producto.nombre}"/>
                                                </td>
                                                <td>${items.producto.nombre}</td>
                                                <td>${items.producto.copy}</td>
                                                <td>${items.producto.precio}</td>
                                                <td>
                                                    <!--Incrementar la cantidad del producto -->
                                                    <div class="col-sm-6 mt-1 d-flex justify-content-between align-items-center text-center ms-10">
                                                        <form action="CarritoControlador" method="get">
                                                            <input type="hidden" name="accion" value="AumentarCantidad">
                                                            <input type="hidden" name="id" value="${items.producto.idProd}">
                                                            <div class="d-flex justify-content-between align-items-center ">
                                                                <button type="submit" class="btn btn-sm text-center" style="background-color: greenyellow; margin-left: 60%;">
                                                                     <i class="fa-solid fa-plus"></i>
                                                                </button>
                                                            </div>
                                                        </form>
                                                    </div>

                                                    <span>${items.cantidad}</span><!--Muestra la cantidad de productos en el carrito -->

                                                    <!--Quitar 1 a la cantidad del producto -->
                                                    <div class="col-sm-3 mt-1 d-flex justify-content-between align-items-center text-center">
                                                        <form action="CarritoControlador" method="get">
                                                            <input type="hidden" name="accion" value="DisminuirCantidad">
                                                            <input type="hidden" name="id" value="${items.producto.idProd}">

                                                            <div class="d-flex justify-content-between align-items-center">
                                                                <button type="submit" class="btn btn-sm " style="background-color: greenyellow; margin-left: 60%;">
                                                                   <i class="fa-solid fa-minus"></i>
                                                                </button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </td>

                                                <td>
                                                    <span>${items.Importe()}</span>
                                                </td>
                                                <td>
                                                    <a href="CarritoControlador?accion=eliminar&indice=${loop.index}" title="Eliminar" class="btn btn-danger btn-sm" onclick="return confirmDeletion(event);">
                                                        <i class="fa fa-trash-alt"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <c:if test="${!(carrito != null && carrito.size() > 0)}">
                                            <tr class="text-center">
                                                <td colspan="7" style="background-color: azure; font-size: 20px;"><i class="fas fa-circle-info"></i> ¡El carrito está vacío!</td>
                                            </tr>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <h4 style="text-align: center">RESÚMEN DE COMPRA</h4>
                                <hr/>
                                <div class="d-flex justify-content-between mb-4">
                                    <p class="mb-2">Total</p>
                                    <p class="mb-2 total">S/.${total}</p>
                                </div>
                                <form action="pago.jsp" method="get">
                                    <input type="hidden" name="accion" value="procesar">
                                    <button type="submit" class="btn btn-block btn-lg" style="background-color: #AEB453; border-radius: 30px;">
                                        <div class="justify-content-between">
                                            <span style="font-weight: bold"><i class="fa fa-credit-card"></i> PROCESAR</span>
                                        </div>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
                              
        <jsp:include page="components/footer.jsp" />

        <script>
            function confirmDeletion(event) {
                event.preventDefault();
                var userConfirmed = confirm("¿Estás seguro de que deseas eliminar este producto?");
                if (userConfirmed) {
                    window.location.href = event.target.closest('a').href;
                }
            }
        </script>

          <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-KyZXEAg3QhqLMpG8r+Knujsl5+5hb7d1f1MDl4JX58vbR51JbUmlLCw5VUN8pq8X" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-NKPpDEAdFlBZa4lh2Sm1Hw8bPOEVX/zi6uFD3eDbm+kgFj4OHy5g7Lb2O+lmiyD1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        
    </body>
</html>
