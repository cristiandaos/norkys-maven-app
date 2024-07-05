/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.utp.edu.norkys.controller;

// PagoControlador.java
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PagoControlador")
public class PagoControlador extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String numeroTarjeta = request.getParameter("numeroTarjeta");
        String mesExpiracion = request.getParameter("mesExpiracion");
        String anioExpiracion = request.getParameter("anioExpiracion");
        String cvv = request.getParameter("cvv");

        // Simulación del procesamiento del pago
        boolean pagoExitoso = true; // cambiar a false para simular un pago fallido

        if (pagoExitoso) {
            // Redirigir a CarritoControlador con la acción procesar
            response.sendRedirect("CarritoControlador?accion=procesar");
        } else {
            response.sendRedirect("cancelado.jsp");
        }
    }
}
