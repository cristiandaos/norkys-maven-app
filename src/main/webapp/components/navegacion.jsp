<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg" style="background-color: #264334;">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">
            <img src="assets/img/logo_norkys.png" alt="Norkys"/>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.jsp" style="color: white;">
                        <i class="fa fa-home"></i> Inicio
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#" style="color: white;">
                        <i class="fa fa-bowl-food"></i> Platos
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" style="color: white;" href="CarritoControlador?accion=listar">
                        <i class="fa fa-shopping-cart"></i> (<span class="fw-bold">${sessionScope.carrito != null ? sessionScope.carrito.size() : 0}</span>)  Carrito
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#" style="color: white;">
                        <i class="fa fa-utensils"></i> Carta Online
                    </a>
                </li>

            </ul>
            <form class="d-flex" role="search">
                <a href="#" class="btn btn-dark" style="border-radius: 50px; margin-right: 12px; background-color: #AEB453">
                    <i class="fas fa-user-plus"></i> Registrate
                </a>
                <a href="#" class="btn btn-dark" style="border-radius: 50px; background-color: #AEB453">
                    <i class="fas fa-user-lock" style="padding-right: 5px;"></i>Login
                </a>
            </form>
        </div>
    </div>
</nav>
