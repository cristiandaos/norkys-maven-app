package com.utp.edu.norkys.controller;

import com.utp.edu.norkys.modelo.DAO.PedidoDAO;
import com.utp.edu.norkys.modelo.Cliente;
import com.utp.edu.norkys.modelo.DAO.ProductoDAO;
import com.utp.edu.norkys.modelo.DetallePedido;
import com.utp.edu.norkys.modelo.Pedido;
import com.utp.edu.norkys.modelo.Producto;
import com.utp.edu.norkys.util.Carrito;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CarritoControlador extends HttpServlet {
    private String PagListarCarrito = "PagCarrito.jsp";
    private String PagInicio = "index.jsp";    
    private ProductoDAO prodDao = new ProductoDAO();
    private Carrito objCarrito = new Carrito();
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String accion = request.getParameter("accion");

        switch (accion) {
            case "listar":
                Listar(request, response);
                break;
            case "agregar":
                Agregar(request, response);
                break;
            case "eliminar":
                Eliminar(request, response);
                break; 
            case "procesar":
                procesar(request, response);
                break; 
             case "AumentarCantidad":
                AumentarCantidad(request, response);
                break; 
             case "DisminuirCantidad":
                DisminuirCantidad(request, response);
                break; 
            default:
                throw new AssertionError();
        }
    }
    
    protected void Agregar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int idProd = Integer.parseInt(request.getParameter("id"));
        Producto obj = prodDao.BuscarPorId(idProd);
        
        if(obj != null) {
            DetallePedido objDet = new DetallePedido();
            objDet.setProducto(obj);
            objDet.setCantidad(1);
            
            objCarrito.AgregarCarrito(objDet, request);
        }
        request.getRequestDispatcher(PagInicio).forward(request, response);

    }
    
    protected void Listar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ArrayList<DetallePedido> lista = objCarrito.ObtenerSesion(request);
        request.setAttribute("carrito", lista);
        request.setAttribute("total", objCarrito.ImporteTotal(lista));
        request.getRequestDispatcher(PagListarCarrito).forward(request, response);
    }
    
    protected void Eliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int indice = Integer.parseInt(request.getParameter("indice"));
        
        objCarrito.RemoverItemCarrito(request, indice);

        response.sendRedirect("CarritoControlador?accion=listar");
    }
    
    
        protected void procesar(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            HttpSession session = request.getSession();
            Cliente cliente = (Cliente) session.getAttribute("cliente");

            // Verificar si el cliente ha iniciado sesión
            if (cliente == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            // Obtener la lista del carrito de la sesión
            ArrayList<DetallePedido> carrito = ObtenerSesion(request);

            // Guardar la lista del carrito en la base de datos
            PedidoDAO pedidoDAO = new PedidoDAO();
            Pedido pedido = new Pedido();
            pedido.setCliente(cliente);
            pedido.setDetalles(carrito);

            boolean success = false;
            try {
                success = pedidoDAO.guardarPedido(pedido);
            } catch (Exception e) {
                e.printStackTrace(); // Mejor usar un logger en producción
                success = false;
            }

            if (success) {
                request.setAttribute("mensaje", "Pedido procesado con éxito.");
                session.removeAttribute("carrito");
                RequestDispatcher dispatcher = request.getRequestDispatcher("session.jsp");
                dispatcher.forward(request, response);
            } else {
                request.setAttribute("mensaje", "Error al procesar el pedido.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                dispatcher.forward(request, response);
            }
        }

        
        private ArrayList<DetallePedido> ObtenerSesion(HttpServletRequest request) {
            HttpSession session = request.getSession();
            @SuppressWarnings("unchecked")
            ArrayList<DetallePedido> carrito = (ArrayList<DetallePedido>) session.getAttribute("carrito");
            if (carrito == null) {
                carrito = new ArrayList<>();
            }
            return carrito;
        }

            protected void agregarEmp(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }
            
    protected void AumentarCantidad(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
                  response.setContentType("text/html;charset=UTF-8");
        int idProd = Integer.parseInt(request.getParameter("id"));
        Producto obj = prodDao.BuscarPorId(idProd);
        if(obj != null) {
            DetallePedido objDet = new DetallePedido();
            objDet.setProducto(obj);
            objDet.setCantidad(1);
            
            objCarrito.AgregarCarrito(objDet, request);
            
            
        }
        ArrayList<DetallePedido> lista = objCarrito.ObtenerSesion(request);
        request.setAttribute("total", objCarrito.ImporteTotal(lista));
        response.sendRedirect("CarritoControlador?accion=listar");

    }
       
    protected void DisminuirCantidad(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
                  response.setContentType("text/html;charset=UTF-8");
        int idProd = Integer.parseInt(request.getParameter("id"));
        Producto obj = prodDao.BuscarPorId(idProd);
        if(obj != null) {
            DetallePedido objDet = new DetallePedido();
            objDet.setProducto(obj);
            objDet.setCantidad(-1);
            
            objCarrito.AgregarCarrito(objDet, request);
            
            
        }
        ArrayList<DetallePedido> lista = objCarrito.ObtenerSesion(request);
        request.setAttribute("total", objCarrito.ImporteTotal(lista));
        response.sendRedirect("CarritoControlador?accion=listar");

    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
