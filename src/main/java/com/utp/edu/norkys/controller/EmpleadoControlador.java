/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.utp.edu.norkys.controller;

import com.utp.edu.norkys.modelo.DAO.ClienteDAO;
import com.utp.edu.norkys.modelo.DAO.EmpleadoDAO;
import com.utp.edu.norkys.modelo.Empleado;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LUIS
 */
@WebServlet(name = "EmpleadoControlador", urlPatterns = {"/EmpleadoControlador"})
public class EmpleadoControlador extends HttpServlet {
    private EmpleadoDAO empleadoDAO;

    public void init() {
        empleadoDAO = new EmpleadoDAO();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         listarEmpleados(request, response);
        
        
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
        
        
         String accion = request.getParameter("accion");

        switch (accion) {
            
            case "registrarEmpleado":
                registrarEmpleado(request, response);
                break;
           
            default:
                throw new AssertionError();
        }

    }

    
     protected void registrarEmpleado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
        String nombres= request.getParameter("nombres");
        String apellidos= request.getParameter("apellidos");
        String correo= request.getParameter("correo");
        String password= request.getParameter("password");
        String roles="2";// "2" es numero que identifica a los Empleado 

            
        if(request.getParameter("nombres").equals("") || request.getParameter("apellidos").equals("")||
            request.getParameter("correo").equals("") || 
            request.getParameter("password").equals("")){
            
            // Redirigir a la página de registro para actualizar la lista de empleados
            response.sendRedirect("registroEmp.jsp");
           
        }else{
            EmpleadoDAO cli= new EmpleadoDAO();
            if (cli.registrarEmpleado(nombres, apellidos, correo, password, roles)) {
                response.sendRedirect(request.getContextPath() + "/EmpleadoControlador");
            }else{
                response.sendRedirect("index.jsp");
            }   
        }

    }
     
     
      private void listarEmpleados(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Empleado> empleados = empleadoDAO.ListarEmp();
            request.setAttribute("empleados", empleados);
            RequestDispatcher dispatcher = request.getRequestDispatcher("registroEmp.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
