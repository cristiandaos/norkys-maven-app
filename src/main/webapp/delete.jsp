<%-- 
    Document   : delete
    Created on : 27/05/2024, 01:30:16 PM
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
       ps=cn.prepareStatement("delete from cliente where id_cli="+id);
       ps.executeUpdate();
       response.sendRedirect("consulta.jsp");
       
       %>
    </body>
</html>
