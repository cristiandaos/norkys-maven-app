<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="javax.servlet.*" %>
<%@page import="java.io.*" %>
<%
    // Invalidar la sesión actual
    session.invalidate();
    response.sendRedirect("../login.jsp");
%>
