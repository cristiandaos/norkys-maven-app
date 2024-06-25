<%-- 
    Document   : editar
    Created on : 27/05/2024, 01:30:28 PM
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
        <title>JSP Page</title>
    </head>
    <body>
        <%
       //CONECTANOD A LA BASE DE DATOS:
       Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
     
        Conexion con = new Conexion();
     
        Statement st;
   
        PreparedStatement pst;
        cn = Conexion.getConnection();
            
        int id=Integer.parseInt(request.getParameter("id"));
        ps=cn.prepareStatement("select * from cliente where id_cli="+id);
        rs=ps.executeQuery();
       
       
       while(rs.next()){
                         %>
        <div class="container">
            <h1>Modificar Registro</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
                ID:
                <input type="text" readonly="" class="form-control" value="<%= rs.getInt("id_cli")%>"/>
                Nombres:
                <input type="text" name="txtnombres" class="form-control" value="<%= rs.getString("nombres")%>"/><br>
                Apellido:
                <input type="text" name="txtapellidos" class="form-control" value="<%= rs.getString("apellidos")%>"/><br>
                Correo:
                <input type="text" name="txtcorreo" class="form-control" value="<%= rs.getString("correo")%>"/><br>
                Password:
                <input type="text" name="txtpassword" class="form-control" value="<%= rs.getString("password")%>"/><br>
                Telefono:
                <input type="text" name="txttelefono" class="form-control" value="<%= rs.getString("telefono")%>"/>
                 <br>
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                
                <a href="consulta.jsp">Regresar</a>
            </form>
            <%}%>
        </div>
    </body>
</html>
<%
                
    String ide, nomb, apel,cor,pas,te;
                nomb = request.getParameter("txtnombres");
                ide = request.getParameter("txtid_cli");
                apel = request.getParameter("txtapellido");
                cor = request.getParameter("txtcorreo");
                pas = request.getParameter("txtpassword");
                te = request.getParameter("txttelefono");
                if (nomb != null && ide != null && apel != null && cor != null && pas != null && te != null ) {
                    ps = cn.prepareStatement("update cliente(nombres, id_cli,apellidos,correo,password,telefono)values('" + nomb + "','" + ide + "','" + apel + "','" + cor + "','" + pas + "','" + te + "')");
                    ps.executeUpdate();
                    response.sendRedirect("consulta.jsp");

                }
            %>