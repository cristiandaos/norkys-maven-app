
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.*, com.utp.edu.norkys.modelo.DAO.PedidoDAO" %>
<%
    // Verifica si el usuario ha iniciado sesión
    Integer id_cli = (Integer) session.getAttribute("id_cli");
    if (id_cli == null) {
        // Redirige al usuario a la página de inicio de sesión si no ha iniciado sesión
        response.sendRedirect("login.jsp");
        return;
    }
    
    // Obtener el ID del último pedido realizado por el cliente
    PedidoDAO pedidoDAO = new PedidoDAO();
    

    // Obtener los detalles del pedido
    List<Map<String, Object>> detalles = pedidoDAO.obtenerHistorial(id_cli);
    List<Map<String, Object>> totales = pedidoDAO.obtenerTotal(id_cli);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Norkys</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <jsp:include page="components/navegacion.jsp" />
        <hr />
        <div class="container-fluid mt-2 d-flex justify-content-around">
            
           
            
         
            <c:if test="${sessionScope.cliente != null}">
                <div>
                   
                <b><h2>¡Hola, ${sessionScope.cliente.nombres}!</h2></b>
                </div>
                
            </c:if>
            
            
                
                
            
            
        </div>
        <hr />
                <br>
                
                
    <div class="container d-flex justify-content-center ">
        <div class="table-responsive ms-10 col-10 row justify-content-center ms-8 py-4 p-15">
        <h2>Historial</h2>
                <table border="1" class="table text-center align-middle">
                    <thead class="thead-dark">
                        <tr>
                        <th>ID Pedido</th>
                        <th>Fecha de pedido</th>
                        <th>Total</th>
                        <th></th>
                        
                    </tr>
                    </thead>
                    <tbody>

                    <%
                        if (detalles.isEmpty()) {
                    %>
                        <tr>
                            <td colspan="5">No hay detalles de compra disponibles.</td>
                        </tr>
                    <%
                        } else {
                            for (Map<String, Object> detalle : detalles) {
                    %>
                        <tr>
                            <td><%= detalle.get("id_ped") %></td>
                            <td><%= detalle.get("fecha_ped") %></td>
                            <td><%= detalle.get("total") %></td>
                            <td><a href="#" class="btn btn-primary m-10  p-15">Detalles</a></td>
                            
                        </tr>
                        
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
        </div>

    </div>
        
        

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    </body>
</html>
