<%@page contentType="text/html" pageEncoding="UTF-8"%>


<nav class="navbar  navbar-expand-lg" style="background-color: #264334;">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">
            <img src="./assets/img/logo_norkys.png" alt="Norkys"/>



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

               
            </ul>
                    
               <%
                try {
                    // Obtener atributos de la sesión
                    String acceso = request.getSession().getAttribute("nombre").toString();
                    String rol = request.getSession().getAttribute("roles").toString();
                %>
                
                    
                    <span style="color: white; margin-right: 12px;">Bienvenido ${sessionScope.nombre}</span> 
                    <%
                    if("1".equals(rol)){
                    %>
                    
                        <span style="color: white; margin-right: 12px;">Administración </span>
                        <a href="registroEmp.jsp" style=" margin-right: 12px;"><i class="fa-solid fa-user-plus fa-2x text-secondary"></i></a>
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="registroArticulo.jsp" style="color: white; border-radius: 50px; margin-right: 12px; background-color: #AEB453">
                            <i class="fa fa-home"></i> Registro-Platillos
                        </a>
                        </li>
                        <a class="nav-link active" aria-current="page" href="dashboard.jsp" style="color: white; border-radius: 50px; margin-right: 12px; background-color: #AEB453">
                            <i class="fa fa-home"></i> Dashboard
                        </a>
                    </ul>
                        <a href="consulta.jsp" style=" margin-right: 12px;"><i class="fa-solid fa-magnifying-glass fa-2x text-secondary"></i></a>
                    <%
                    }else{
                        if("2".equals(rol)){
                    %>
                        <span style="color: white; margin-right: 12px;"> Empleado </span>
                    <%
                        }
                    }
                    %>
                    <a href="components/logout.jsp" class="btn btn-dark" style="border-radius: 50px; background-color: #AEB453">Logout</a>
                
                    <%
                        
                } catch (Exception e) {
                %>
                    <form class="d-flex" role="search">
                        <c:choose>
                            <c:otherwise>
                                <a href="registro.jsp" class="btn btn-dark" style="border-radius: 50px; margin-right: 12px; background-color: #AEB453">
                                    <i class="fas fa-user-plus"></i> Registrate
                                </a>
                                <a href="login.jsp" class="btn btn-dark" style="border-radius: 50px; background-color: #AEB453">
                                    <i class="fas fa-user-lock" style="padding-right: 5px;"></i>Login
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </form>
                <%
                }
                %>



            </ul>
            

        </div>
    </div>
</nav>
