<%-- 
    Document   : consulta
    Created on : 27/05/2024, 11:31:57 AM
    Author     : Marcelo Assanza
--%>

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
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Agregar</title>
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
    </head>
    <body style="margin-top: 30px">  
        
        <a class="navbar-brand ms-4 my-4 fixed-top" href="../index.jsp">
            <img src="../assets/img/logo_norkys.png" alt="Norkys"/>
        </a>
        
       <aside class=" bg-white  navbar-vertical navbar-expand-xs border-0 border-radius-xl my-8 fixed-start ms-3 " id="sidenav-main">
            <div class="sidenav-header p-4 ms-6">

                <p>Dashboard</p>
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
                        <a class="nav-link active" href="../pages/consulta.jsp">
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
        <%
             Connection cn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
     
            Conexion con = new Conexion();
     
            Statement st;
   
            PreparedStatement pst;
            cn = Conexion.getConnection();
            
             
            ps=cn.prepareStatement("select * from cliente where roles='3'");
            rs=ps.executeQuery(); 
            //Creamo la Tabla:     
        %>
        <h1 class="ms-md-8 ps-md-12">Busqueda de Clientes</h1>
        <div class="container buscar">    
            <br>
            
            <div style="padding-left: 800px">                  
            <form class="form ">
                <input type="text" class="form-control" name="txtbuscar"/>
                <input type="submit" class="btn btn" value="Buscar"/>
            </form>
        </div>  
         <%
            String nombuscar=request.getParameter("txtbuscar");
                if(nombuscar!=null){
                st=con.getConnection().createStatement();
                rs=st.executeQuery("select * from cliente where id_cli LIKE"+"'%" +nombuscar+"%' and roles='3'");      
            }else{
                System.err.print("Error");
            }
         %> 
        </div>
              
        <br>
        <div class="container ms-md-6 ps-md-12">                      
             <table class="table table-bordered"  id="tablaDatos">
                    <thead>
                        <tr>
                            <th class="text-center">Id</th>
                            <th>Nombres</th>
                            <th class="text-center">Apellidos</th>
                            <th class="text-center">Correo</th>
                          
                            <th class="text-center">Telefono</th>
                        </tr>
                    </thead>
                    <tbody id="tbodys">
                        <%
                            while (rs.next()) {
                        %>
                        <tr>
                            <td class="text-center"><%= rs.getInt("id_cli")%></td>
                            <td><%= rs.getString("nombres")%></td>
                            <td class="text-center"><%= rs.getString("apellidos")%></td>
                            <td class="text-center"><%= rs.getString("correo")%></td>
                            
                            <td class="text-center"><%= rs.getString("telefono")%></td>
                            <td class="text-center">
                                <a href="editar.jsp?id=<%= rs.getInt("id_cli")%>" class="btn btn-primary">Editar</a>
                                <a href="delete.jsp?id=<%= rs.getInt("id_cli")%>" class="btn btn-danger">Delete</a>
                            </td>
                        </tr>
                        <%}%>
                </table>
            </div>        
                        
        <script src="js/jquery.js" type="text/javascript"></script>             
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
<br><br>
<br><br>
        <jsp:include page="../components/footer.jsp" />        
    </body>
</html>
