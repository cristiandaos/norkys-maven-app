<%-- 
    Document   : dashboard
    Created on : 9 jun. 2024, 19:40:04
    Author     : LUIS
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
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="./assets/img/favicon.png">
        <title>
            Dashboard NORKYS
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

    <body >

        <jsp:include page="components/navegacion.jsp" />
        <div class="g-sidenav-show   bg-gray-100 ">
            <div class="min-height-300  position-absolute w-100"></div>
            <aside class=" bg-white  navbar-vertical navbar-expand-xs border-0 border-radius-xl my-8 fixed-start ms-3 " id="sidenav-main">
                <div class="sidenav-header p-4 ms-6">

                    <p>Dashboard</p>
                </div>
                <hr class="horizontal dark mt-0">
                <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" href="./dashboard.jsp">
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
                            <a class="nav-link" href="./pages/agregar.jsp">
                                <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                                    <i class="ni ni-app text-info text-sm opacity-10"></i>
                                </div>
                                <span class="nav-link-text ms-1">Agregar Cliente</span>
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


            <main class="ms-12 main-content position-relative border-radius-lg ">
                <!-- Navbar -->

                <!-- End Navbar -->
                <div class="container-fluid py-4">
                    <div class="row">
                        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                            <div class="card">
                                <div class="card-body p-3">
                                    <div class="row">
                                        <div class="col-8">
                                            <div class="numbers">
                                                <p class="text-sm mb-0 text-uppercase font-weight-bold">N° Productos</p>
                                                <br>
                                                <h5 class="font-weight-bolder">
                                                    53,000
                                                </h5>

                                            </div>
                                        </div>
                                        <div class="col-4 text-end">
                                            <div class="icon icon-shape bg-gradient-primary shadow-primary text-center rounded-circle">
                                                <i class="ni ni-money-coins text-lg opacity-10" aria-hidden="true"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                            <div class="card">
                                <div class="card-body p-3">
                                    <div class="row">
                                        <div class="col-8">
                                            <div class="numbers">
                                                <p class="text-sm mb-0 text-uppercase font-weight-bold">Visitas</p>
                                                <br>
                                                <h5 class="font-weight-bolder">
                                                    <%
                                                        Integer contador = (Integer) session.getAttribute("contador");
                                                        if (contador != null) {
                                                            out.println(contador);
                                                        } else {
                                                            out.println("No se pudo obtener el valor del contador.");
                                                        }
                                                    %>
                                                </h5>

                                            </div>
                                        </div>
                                        <div class="col-4 text-end">
                                            <div class="icon icon-shape bg-gradient-danger shadow-danger text-center rounded-circle">
                                                <i class="ni ni-world text-lg opacity-10" aria-hidden="true"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                            <div class="card">
                                <div class="card-body p-3">
                                    <div class="row">
                                        <div class="col-8">
                                            <div class="numbers">
                                                <p class="text-sm mb-0 text-uppercase font-weight-bold">Colaboradores</p>
                                                <br><!-- comment -->
                                                <h5 class="font-weight-bolder">
                                                    +3,462
                                                </h5>

                                            </div>
                                        </div>
                                        <div class="col-4 text-end">
                                            <div class="icon icon-shape bg-gradient-success shadow-success text-center rounded-circle">
                                                <i class="ni ni-paper-diploma text-lg opacity-10" aria-hidden="true"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-sm-6">
                            <div class="card">
                                <div class="card-body p-3">
                                    <div class="row">
                                        <div class="col-8">
                                            <div class="numbers">
                                                <p class="text-sm mb-0 text-uppercase font-weight-bold">Ventas</p>
                                                <br>
                                                <h5 class="font-weight-bolder">
                                                    $103,430
                                                </h5>

                                            </div>
                                        </div>
                                        <div class="col-4 text-end">
                                            <div class="icon icon-shape bg-gradient-warning shadow-warning text-center rounded-circle">
                                                <i class="ni ni-cart text-lg opacity-10" aria-hidden="true"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col-lg-7 mb-lg-0 mb-4">
                            <div class="card z-index-2 h-100">
                                <div class="card-header pb-0 pt-3 bg-transparent">
                                    <h6 class="text-capitalize">Gráficos de ventas</h6>
                                </div>
                                <div class="card-body p-3">
                                    <div class="chart">
                                        <canvas id="chart-line" class="chart-canvas" height="300"></canvas>
                                            <%
                                                List<ProductoCantidad> datos = ProductoDAO.obtenerProductosCantidad();
                                                String nombresJson = UtilidadesJson.convertirAJson(datos);
                                            %>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-5">
                            <div class="card card-carousel overflow-hidden h-100 p-0">
                                <div id="carouselExampleCaptions" class="carousel slide h-100" data-bs-ride="carousel">
                                    <div class="carousel-inner border-radius-lg h-100">
                                        <div class="carousel-item h-100 active" style="background-image: url('./assets/productos/PROD000001.png');
                                             background-size: cover;">

                                        </div>
                                        <div class="carousel-item h-100" style="background-image: url('./assets/productos/PROD000007.png');
                                             background-size: cover;">
                                            <div class="carousel-caption d-none d-md-block bottom-0 text-start start-0 ms-5">
                                                <div class="icon icon-shape icon-sm bg-white text-center border-radius-md mb-3">
                                                    <i class="ni ni-bulb-61 text-dark opacity-10"></i>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="carousel-item h-100" style="background-image: url('./assets/img/pollo.jpg');
                                             background-size: cover;">
                                            <div class="carousel-caption d-none d-md-block bottom-0 text-start start-0 ms-5">
                                                <div class="icon icon-shape icon-sm bg-white text-center border-radius-md mb-3">
                                                    <i class="ni ni-trophy text-dark opacity-10"></i>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <button class="carousel-control-prev w-5 me-3" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Previous</span>
                                    </button>
                                    <button class="carousel-control-next w-5 me-3" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Next</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </main>

            <script>
                // Toggle Sidenav
                const iconNavbarSidenav = document.getElementById('iconNavbarSidenav');
                const iconSidenav = document.getElementById('iconSidenav');
                const sidenav = document.getElementById('sidenav-main');
                let body = document.getElementsByTagName('body')[0];
                let className = 'g-sidenav-pinned';

                if (iconNavbarSidenav) {
                    iconNavbarSidenav.addEventListener("click", toggleSidenav);
                }

                if (iconSidenav) {
                    iconSidenav.addEventListener("click", toggleSidenav);
                }

                function toggleSidenav() {
                    if (body.classList.contains(className)) {
                        body.classList.remove(className);
                        setTimeout(function () {
                            sidenav.classList.remove('bg-white');
                        }, 100);
                        sidenav.classList.remove('bg-transparent');

                    } else {
                        body.classList.add(className);
                        sidenav.classList.add('bg-white');
                        sidenav.classList.remove('bg-transparent');
                        iconSidenav.classList.remove('d-none');
                    }
                }
            </script>





            <!--   Core JS Files   -->
            <script src="./assets/js/core/popper.min.js"></script>
            <script src="./assets/js/core/bootstrap.min.js"></script>
            <script src="./assets/js/plugins/perfect-scrollbar.min.js"></script>
            <script src="./assets/js/plugins/smooth-scrollbar.min.js"></script>
            <script src="./assets/js/plugins/chartjs.min.js"></script>



            <script>
                var win = navigator.platform.indexOf('Win') > -1;
                if (win && document.querySelector('#sidenav-scrollbar')) {
                    var options = {
                        damping: '0.5'
                    }
                    Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
                }
            </script>
            <!-- Github buttons -->
            <script async defer src="https://buttons.github.io/buttons.js"></script>
            <script src="./assets/js/argon-dashboard.min.js?v=2.0.4"></script>
        </div>


        <script>
                // Toggle Sidenav
                const iconNavbarSidenav = document.getElementById('iconNavbarSidenav');
                const iconSidenav = document.getElementById('iconSidenav');
                const sidenav = document.getElementById('sidenav-main');
                let body = document.getElementsByTagName('body')[0];
                let className = 'g-sidenav-pinned';

                if (iconNavbarSidenav) {
                    iconNavbarSidenav.addEventListener("click", toggleSidenav);
                }
        </script>                

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var ctx = document.getElementById('chart-line').getContext('2d');

                // Parsear los datos JSON desde Java
                var productos = JSON.parse('<%= nombresJson%>');

                // Preparar los datos para el gráfico
                var labels = productos.map(function (producto) {
                    return producto.nombre;
                });
                var cantidades = productos.map(function (producto) {
                    return producto.cantidad;
                });

                // Generar colores aleatorios para las barras
                var colores = [];
                for (var i = 0; i < productos.length; i++) {
                    var color = 'rgba(' + Math.floor(Math.random() * 256) + ', '
                            + Math.floor(Math.random() * 256) + ', '
                            + Math.floor(Math.random() * 256) + ', 0.7)';
                    colores.push(color);
                }

                // Crear el gráfico de barras
                new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: labels,
                        datasets: [{
                                label: 'Cantidad vendida',
                                data: cantidades,
                                backgroundColor: colores,
                                borderColor: colores,
                                borderWidth: 1
                            }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        scales: {
                            y: {
                                beginAtZero: true,
                                grid: {
                                    drawBorder: false,
                                    display: true,
                                    drawOnChartArea: true,
                                    drawTicks: false,
                                    borderDash: [5, 5]
                                },
                                ticks: {
                                    display: true,
                                    padding: 10,
                                    color: '#fbfbfb',
                                    font: {
                                        size: 11,
                                        family: "Open Sans",
                                        style: 'normal',
                                        lineHeight: 2
                                    }
                                }
                            },
                            x: {
                                grid: {
                                    drawBorder: false,
                                    display: false,
                                    drawOnChartArea: false,
                                    drawTicks: false,
                                    borderDash: [5, 5]
                                },
                                ticks: {
                                    display: true,
                                    color: '#ccc',
                                    padding: 20,
                                    font: {
                                        size: 11,
                                        family: "Open Sans",
                                        style: 'normal',
                                        lineHeight: 2
                                    }
                                }
                            }
                        },
                        plugins: {
                            legend: {
                                display: false
                            }
                        }
                    }
                });
            });
        </script>
    </body>

</html>
