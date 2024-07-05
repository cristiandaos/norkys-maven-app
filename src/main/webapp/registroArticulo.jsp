<%-- 
    Document   : registroArticulo
    Created on : 27/05/2024, 01:00:18 AM
    Author     : qmarc
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%//@ page import="com.utp.edu.norkys.modelo.DAO.ProductoCantidad"%>
<%@ page import="com.utp.edu.norkys.modelo.DAO.ProductoDAO" %>
<%//@ page import="com.utp.edu.norkys.modelo.DAO.UtilidadesJson"%>
<%@ page import="java.util.List" %>
<%@ page import="com.utp.edu.norkys.modelo.DAO.ProductoCantidad"%>
<%@ page import="com.utp.edu.norkys.modelo.DAO.ProductoDAO" %>
<%@ page import="com.utp.edu.norkys.modelo.DAO.UtilidadesJson"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="./assets/img/favicon.png">
        <title>
            Registrar Articulos
        </title>
        <!--     Fonts and icons     -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
        <!-- Nucleo Icons -->
        <link href="./assets/css/nucleo-icons.css" rel="stylesheet" />
        <link href="./assets/css/nucleo-svg.css" rel="stylesheet" />
        <!-- Font Awesome Icons -->
        <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
        <link href="./assets/css/nucleo-svg.css" rel="stylesheet" />
        <!-- CSS Files -->
        <link id="pagestyle" href="./assets/css/argon-dashboard.css?v=2.0.4" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>  
        <nav class="navbar  navbar-expand-lg" >
            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp">
                    <img src="./assets/img/logo_norkys.png" alt="Norkys"/>
                </a>
            </div>
        </nav>
            <div class="g-sidenav-show   bg-gray-100 ">
                <%
                    // Obtener atributos de la sesión
                    String acceso = request.getSession().getAttribute("nombre").toString();
                    String rol = request.getSession().getAttribute("roles").toString();
                %>
                
                    <%
                    if("2".equals(rol)){
                    %>
                    
                     <%
                         }else{
                    %>
                        <aside class=" bg-white  navbar-vertical navbar-expand-xs border-0 border-radius-xl my-8 fixed-start ms-3 " id="sidenav-main">
                            <div class="sidenav-header p-4 ms-6">
                                <p>Dashboard</p>
                            </div>
                            <hr class="horizontal dark mt-0">
                            <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
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
                                            <span class="nav-link-text ms-1">Cliente</span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">
                                            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                                                <i class="ni ni-app text-info text-sm opacity-10"></i>
                                            </div>
                                            <span class="nav-link-text ms-1">Info</span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link " href="./registroEmp.jsp">
                                            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                                                <i class="ni ni-credit-card text-success text-sm opacity-10"></i>
                                            </div>
                                            <span class="nav-link-text ms-1">Agregar Empleado</span>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link active " href="../registroArticulo.jsp">
                                            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                                                <i class="ni ni-credit-card text-success text-sm opacity-10"></i>
                                            </div>
                                            <span class="nav-link-text ms-1">Agregar Platillos</span>
                                        </a>
                                    </li>

                                </ul>
                            </div>

                        </aside>
                    
                    <%
                         }
                    %>
        
        
            <div class="min-height-300  position-absolute w-100"></div>
            

            <div class="row d-flex justify-content-end align-items-center h-100">
                <div class="col col-xl-10">
                    <div class="card" style="border-radius: 1rem;">
                        <div class="row g-0">
                            <div class="col-md-6 col-lg-5 d-none d-md-block">
                                <img src="assets/img/pollo.jpg"
                                     alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
                            </div>
                            <div class="col-md-6 col-lg-7 d-flex align-items-center">
                                <div class="card-body p-4 p-lg-5 text-black">

                                    <form action="ProductoControlador" method="post" enctype="multipart/form-data">
                                        <div class="d-flex align-items-center mb-3 pb-1">
                                            <img src="assets/img/logo_norkys.png" alt="alt"/>
                                        </div>
                                        <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Agrege un nuevo combo al Menu</h5>
                                        <div data-mdb-input-init class="form-outline mb-4">
                                            <input type="text" name="nombre" id="exampleInputNombre" class="form-control form-control-lg" placeholder="Ingrese el nombre del Combo" />
                                            <label class="form-label" for="exampleInputNombre">Nombre del Combo</label>
                                        </div>
                                        <div data-mdb-input-init class="form-outline mb-4">
                                            <input type="text" name="precio" id="exampleInputPrecio" class="form-control form-control-lg" placeholder="Ingrese el Precio"/>
                                            <label class="form-label" for="exampleInputPrecio">Precio del combo</label>
                                        </div>
                                        <div data-mdb-input-init class="form-outline mb-4">
                                            <input name="copy" id="exampleInputCopy" class="form-control form-control-lg" placeholder="Ingresa los Platillos" rows="4"/>
                                            <label class="form-label" for="exampleInputCopy"></label>
                                        </div>
                                        <div class="form-outline mb-4">
                                            <input type="file" name="imagen" id="exampleInputImagen" class="form-control form-control-lg" accept="image/png"/>
                                            <label class="form-label" for="exampleInputImagen">Subir Imagen</label>
                                        </div>
                                        <input type="hidden" name="accion" value="registrarProducto">
                                        <div class="pt-1 mb-4">
                                            <button type="submit" data-mdb-button-init data-mdb-ripple-init class="btn btn-dark btn-lg btn-block" type="button">Agregar Nuevo Combo</button>
                                        </div>
                                        <a href="#!" class="small text-muted">Terms of use. </a>
                                        <a href="#!" class="small text-muted">Privacy policy</a>
                                    </form>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>
