/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.utp.edu.norkys.controller;

import com.utp.edu.norkys.modelo.DAO.PedidoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LUIS
 */
@WebServlet(name = "ResumenCompraCon", urlPatterns = {"/ResumenCompraCon"})
public class ResumenCompraServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PedidoDAO pedidoDAO;
    

    public void init() {
        pedidoDAO = new PedidoDAO();
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                   HttpSession session = request.getSession();
        Integer id_cli = (Integer) session.getAttribute("id_cli");

        if (id_cli == null) {
            response.sendRedirect("error.jsp");
            return;
        }

        int id_ped = pedidoDAO.obtenerUltimoIdPedido(id_cli);
        if (id_ped == -1) {
            request.setAttribute("mensaje", "No hay compras recientes.");
            request.getRequestDispatcher("sesionCliente.jsp").forward(request, response);
            return;
        }
        List<Map<String, Object>> detallesCompra = pedidoDAO.obtenerDetallesPedido(id_ped);
        List<Map<String, Object>> total = pedidoDAO.obtenerTotal(id_ped);
        request.setAttribute("detallesCompra", detallesCompra);
        request.getRequestDispatcher("sesionCliente.jsp").forward(request, response);
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
        processRequest(request, response);
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
