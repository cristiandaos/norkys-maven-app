<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registrar Empleado</title>
    <link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="./assets/img/favicon.png">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
    <!-- Nucleo Icons -->
    <link href="./assets/css/nucleo-icons.css" rel="stylesheet" />
    <link href="./assets/css/nucleo-svg.css" rel="stylesheet" />
    <!-- Font Awesome Icons -->
    <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
    <link href="./assets/css/nucleo-svg.css" rel="stylesheet" />
    <link id="pagestyle" href="./assets/css/argon-dashboard.css?v=2.0.4" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>   
        
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <a class="navbar-brand ms-4 my-4 fixed-top" href="../index.jsp">
            <img src="./assets/img/logo_norkys.png" alt="Norkys"/>
        </a>
    <br><br>
    <aside class=" bg-white h-75 d-inline-block  navbar-vertical navbar-expand-xs border-0 border-radius-xl my-8 fixed-start ms-3 " id="">
            <div class="sidenav-header p-4 ms-5">

                <p>Dashboard</p>
            </div>
            <hr class="horizontal dark mt-0 ">
            <div class="collapse navbar-collapse  w-100 " id="">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link " href="./dashboard.jsp">
                            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                                <i class="ni ni-tv-2 text-primary text-sm opacity-10"></i>
                            </div>
                            <span class="nav-link-text ms-1">Principal</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="./pages/consulta.jsp">
                            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                                <i class="ni ni-calendar-grid-58 text-warning text-sm opacity-10"></i>
                            </div>
                            <span class="nav-link-text ms-1">Clientes</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#">
                            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                                <i class="ni ni-app text-info text-sm opacity-10"></i>
                            </div>
                            <span class="nav-link-text ms-1">Info</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="./registroEmp.jsp">
                            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                                <i class="ni ni-credit-card text-success text-sm opacity-10"></i>
                            </div>
                            <span class="nav-link-text ms-1">Agregar Empleado</span>
                        </a>
                    </li>
                    <li class="nav-item">
                            <a class="nav-link " href="./registroArticulo.jsp">
                                <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                                    <i class="ni ni-credit-card text-success text-sm opacity-10"></i>
                                </div>
                                <span class="nav-link-text ms-1">Agregar Platillos</span>
                            </a>
                        </li>
                   
                    
                </ul>
            </div>

        </aside>
    
    <div class="row justify-content-center ms-8">
    <div class="col-4">
      <form action="EmpleadoControlador" method="post" style="display: flex; justify-content: center;">
                <div style="width: 100%; background-color: #AEB453; padding: 10%; border-radius: 50px">
                    <center><h1>REGISTRAR EMPLEADO</h1><br></center>
                    <br>
                    <div class="form-group">
                        <label for="exampleInputNombres">Nombres</label>
                        <input type="text" name="nombres" class="form-control" id="exampleInputNombres" aria-describedby="nombresHelp" placeholder="Ingrese nombres">
                    </div><br>
                    <div class="form-group">
                        <label for="exampleInputApellidos">Apellidos</label>
                        <input type="text" name="apellidos" class="form-control" id="exampleInputApellidos" aria-describedby="apellidosHelp" placeholder="Ingrese apellidos">
                    </div><br>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Correo electronico</label>
                        <input type="email" name="correo" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Ingrese email">
                    </div><br>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Contraseña</label>
                        <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Contraseña">
                    </div><br>
                    <br>
                    <input type="hidden" name="accion" value="registrarEmpleado">
                    <div class="d-flex justify-content-between align-items-center">
                        <button type="submit" class="btn btn-primary">Registrar</button>
                    </div>
                </div>
            </form>
    </div>
    <div class="col-4">
      <div style="width: 50%; padding-left: 5%; padding-top: 5%; border-radius: 50px">
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                     
                        <th scope="col">Nombres</th>
                        <th scope="col">Apellidos</th>
                        <th scope="col">Correo</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${empleados}" var="item">
                        <tr>
                            
                            <td>${item.nombres}</td>
                            <td>${item.apellidos}</td>
                            <td>${item.correo}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
  </div>
    
    <div style="display: flex; justify-content: center;">
        <div>
            
        

        
        </div>
        
    </div>
    <br> <br>
    <br><br>
        <jsp:include page="components/footer.jsp" />

</body>
</html>
