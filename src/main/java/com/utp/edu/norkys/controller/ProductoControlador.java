package com.utp.edu.norkys.controller;

import com.utp.edu.norkys.modelo.Producto;

import com.utp.edu.norkys.modelo.DAO.ProductoDAO;
import java.io.IOException;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProductoControlador")
public class ProductoControlador extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if (accion != null && accion.equals("registrarProducto")) {
            String nombre = request.getParameter("nombre");
            double precio = Double.parseDouble(request.getParameter("precio"));
            String copy = request.getParameter("copy");
            
            Random random = new Random();
            int randomIndex = random.nextInt(7) + 1; // Generar un número entre 1 y 7
            String imagen = "PROD00000" + randomIndex + ".png";

            Producto producto = new Producto();
            producto.setNombre(nombre);
            producto.setPrecio(precio);
            producto.setImagen(imagen);
            producto.setCopy(copy);

            ProductoDAO productoDAO = new ProductoDAO();
            productoDAO.insertarProducto(producto);

            response.sendRedirect("ActualizadorControlador");; // Redirige a una página de éxito (puedes crearla)
        } else {
            response.sendRedirect("registroArticulo.jsp"); // Redirige a una página de error (puedes crearla)
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    public String getServletInfo() {
        return "ProductoControlador";
    }
}
