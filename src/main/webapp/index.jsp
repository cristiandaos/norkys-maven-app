<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.utp.edu.norkys.config.Conexion" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Norkys</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            .carousel-container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh; 
            }
            .carousel-inner img {
                margin: auto; 
            }
        </style>
    </head>
    <body>
        <jsp:include page="components/navegacion.jsp" />

        <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="assets/img/carrusel1.png" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="assets/img/carrusel2.png" class="d-block w-100" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="assets/productos/PROD000002.png" class="d-block w-50" alt="...">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <div class="container-fluid mt-2">
            <h4>Catálogo de Productos</h4>
            <hr />

            <div class="row">
                <c:forEach items="${productos}" var="item">
                    <div class="col-sm-3 mt-1">
                        <form action="CarritoControlador" method="get">
                            <div class="card">
                                <img src="assets/productos/${item.imagen}" widht="100%" alt="${item.nombre}"/>
                                <div class="card-body">
                                    <p class="fw-bold">${item.nombre}</p>
                                    <p>${item.copy}</p>
                                    <input type="hidden" name="accion" value="agregar">
                                    <input type="hidden" name="id" value="${item.idProd}">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <button type="submit" class="btn btn-sm btn-primaty" style="background-color: greenyellow;">
                                            <i class="fa fa-shopping-cart"></i> Añadir al carrito
                                        </button>
                                        <small class="fw-bold">S/${item.precio}</small>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </c:forEach>
            </div>
        </div>
        <br><br>
        <jsp:include page="components/footer.jsp" />

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

        <%
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            int contador = 0;

            try {
                // Obtener conexión a la base de datos
                conn = Conexion.getConnection();

                // Leer el valor actual del contador de la base de datos
                String querySelect = "SELECT contador FROM visitas WHERE id = 1";
                pstmt = conn.prepareStatement(querySelect);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    contador = rs.getInt("contador");
                }

                // Incrementar el contador
                contador++;

                // Actualizar el nuevo valor del contador en la base de datos
                String queryUpdate = "UPDATE visitas SET contador = ? WHERE id = 1";
                pstmt = conn.prepareStatement(queryUpdate);
                pstmt.setInt(1, contador);
                pstmt.executeUpdate();

                // Guardar el contador en la sesión
                session.setAttribute("contador", contador);

        %>

        <%    } catch (SQLException e) {
                out.println("Error al acceder a la base de datos: " + e.getMessage());
            } finally {
                if (rs != null) {
                    try {
                        rs.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (pstmt != null) {
                    try {
                        pstmt.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        %>

    </body>


</html>
