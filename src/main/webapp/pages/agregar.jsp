
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.utp.edu.norkys.config.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="../assets/img/favicon.png">
        <link href="./css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
        <!-- Nucleo Icons -->
        <link href="../assets/css/nucleo-icons.css" rel="stylesheet" />
        <link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
        <!-- Font Awesome Icons -->
        <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
        <link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
        <!-- CSS Files -->
        <link id="pagestyle" href="../assets/css/argon-dashboard.css?v=2.0.4" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>JSP Page</title>
    </head>
    <body>  
        <a class="navbar-brand ms-4 my-4 fixed-top" href="../index.jsp">
            <img src="../assets/img/logo_norkys.png" alt="Norkys"/>
        </a>
        

    <div class="g-sidenav-show   bg-gray-100 ">
        
        <aside class=" bg-white  navbar-vertical navbar-expand-xs border-0 border-radius-xl my-8 fixed-start ms-3 " id="sidenav-main">
            <div class="sidenav-header">
                <i class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
                <div class="sidenav-header p-4 ms-6">

                <p>Dashboard</p>
            </div>
            </div>
            <hr class="horizontal dark mt-0">
            <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link " href="../dashboard.jsp">
                            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                                <i class="ni ni-tv-2 text-primary text-sm opacity-10"></i>
                            </div>
                            <span class="nav-link-text ms-1">Principal</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="../pages/consulta.jsp">
                            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                                <i class="ni ni-calendar-grid-58 text-warning text-sm opacity-10"></i>
                            </div>
                            <span class="nav-link-text ms-1">Clientes</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="../pages/agregar.jsp">
                            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                                <i class="ni ni-app text-info text-sm opacity-10"></i>
                            </div>
                            <span class="nav-link-text ms-1">Agregar Cliente</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="../registroEmp.jsp">
                            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
                                <i class="ni ni-credit-card text-success text-sm opacity-10"></i>
                            </div>
                            <span class="nav-link-text ms-1">Agregar Empleado</span>
                        </a>
                    </li>
                    
                   
                    
                </ul>
            </div>

        </aside>
        

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
        <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
        <script src="../assets/js/argon-dashboard.min.js?v=2.0.4"></script>
    </div >
        <div class="container ms-md-8 ps-md-12">
            <h1>Agregar Registro</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 400px">
                Nombres:
                <input type="text" name="txtnombres" class="form-control"/><br>
                ID:
                <input type="text" name="txtid_cli" class="form-control"/>
                <br>
                Apellido:
                <input type="text" name="txtapellidos" class="form-control"/><br>
                Correo:
                <input type="text" name="txtcorreo" class="form-control"/>
                <br>
                Password:
                <input type="text" name="txtpassword" class="form-control"/><br>
                Telefono:
                <input type="text" name="txttelefono" class="form-control"/>
                <br>
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                <a href="consulta.jsp">Regresar</a>
            </form>
        </div>
        
    <!--   Core JS Files   -->
        <script src="../assets/js/core/popper.min.js"></script>
        <script src="../assets/js/core/bootstrap.min.js"></script>
        <script src="../assets/js/plugins/perfect-scrollbar.min.js"></script>
        <script src="../assets/js/plugins/smooth-scrollbar.min.js"></script>
        <script src="../assets/js/plugins/chartjs.min.js"></script>

        

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
        <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
        <script src="./assets/js/argon-dashboard.min.js?v=2.0.4"></script>
        
    </body>
</html>
<%
       //CONECTANOD A LA BASE DE DATOS:
       Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
     
        Conexion con = new Conexion();
     
        Statement st;
   
        PreparedStatement pst;
        cn = Conexion.getConnection();
         String id, nom, apell,co,pass,tel;
                nom = request.getParameter("txtnombres");
                id = request.getParameter("txtid_cli");
                apell = request.getParameter("txtapellido");
                co = request.getParameter("txtcorreo");
                pass = request.getParameter("txtpassword");
                tel = request.getParameter("txttelefono");
                if (nom != null && id != null && apell != null && co != null && pass != null && tel != null ) {
                    ps = cn.prepareStatement("insert into cliente(id_cli, nombres,apellidos,correo,password,telefono)values('" + nom + "','" + id + "','" + apell + "','" + co + "','" + pass + "','" + tel + "')");
                    ps.executeUpdate();
                    JOptionPane.showMessageDialog(null,"Se Agrego Correctamete");
                    response.sendRedirect("consulta.jsp");

               }        
%>