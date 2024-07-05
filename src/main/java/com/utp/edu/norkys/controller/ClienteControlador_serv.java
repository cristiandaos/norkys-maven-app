
package com.utp.edu.norkys.controller;

import com.utp.edu.norkys.modelo.Cliente;
import com.utp.edu.norkys.modelo.DAO.ClienteDAO;
import com.utp.edu.norkys.modelo.DAO.PedidoDAO;
import com.utp.edu.norkys.modelo.DAO.ProductoDAO;
import com.utp.edu.norkys.modelo.DetallePedido;
import com.utp.edu.norkys.modelo.Empleado;
import com.utp.edu.norkys.modelo.Producto;
import com.utp.edu.norkys.util.Carrito;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
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

public class ClienteControlador_serv extends HttpServlet {
    private String PagListarCarrito = "PagCarrito.jsp";
    private String PagInicio = "index.jsp";    
    private ClienteDAO clienDao = new ClienteDAO();
    private Carrito objCarrito = new Carrito();
    private PedidoDAO pedidoDAO = new PedidoDAO();

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }catch(IOException | ServletException e){
            System.out.println("login error: "+ e.getMessage());
            e.printStackTrace();
        }
        
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
        
        
         String accion = request.getParameter("accion");

        switch (accion) {
            case "session":
                session(request, response);
                break;
            case "registrarCliente":
                registrarCliente(request, response);
                break;
            case "historialCliente":
                historialCliente(request, response);
                break;
           
            default:
                throw new AssertionError();
        }


    }
    
   private static final long serialVersionUID = 1L;

    protected void session(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            if (request.getParameter("correo").isEmpty() || request.getParameter("password").isEmpty()) {
                response.sendRedirect("login.jsp");
            } else {
                    String correo = request.getParameter("correo");
                    String password = request.getParameter("password");

                    ClienteDAO cli = new ClienteDAO();
                    Cliente cliente = cli.getClientePorCorreoYPassword(correo, password);

                    if (cliente != null) {
                        HttpSession session = request.getSession();
                        session.setAttribute("cliente", cliente);
                        session.setAttribute("id_cli", cliente.getId_cli());
                        session.setAttribute("nombre", cliente.getNombres()); // Asegurar que se establece el nombre en la sesión
                        session.setAttribute("roles", cliente.getRoles());
                        
                        response.sendRedirect(request.getContextPath() + "/index.jsp");
                    } else {
                        request.setAttribute("mensaje", "Correo o contraseña incorrectos");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }
            }
        } catch (IOException | ServletException e) {
            System.out.println("login error: " + e.getMessage());
            e.printStackTrace();
        }
    }

    
        
            protected void registrarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
        String nombres= request.getParameter("nombres");
        String apellidos= request.getParameter("apellidos");
        String telefono= request.getParameter("telefono");
        String correo= request.getParameter("correo");
        String password= request.getParameter("password");
        String roles="3";// "3" es numero que identifica a los Clientes 
        
        if(request.getParameter("nombres").equals("") || request.getParameter("apellidos").equals("") || 
            request.getParameter("telefono").equals("")|| request.getParameter("correo").equals("") || 
            request.getParameter("password").equals("")){
            
            response.sendRedirect("registro.jsp");
        }else{
            ClienteDAO cli= new ClienteDAO();
            if (cli.registrarCliente(nombres, apellidos, telefono, correo, password, roles)) {
                response.sendRedirect("login.jsp");
            }else{
                response.sendRedirect("registro.jsp");
            }
        }
        
            


    }
            
            
            
            
    protected void historialCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        
         HttpSession session = request.getSession();
        Integer id_cli = (Integer) session.getAttribute("id_cli");

        if (id_cli == null) {
            response.sendRedirect("error.jsp");
            return;
        }
       try {
            List<Map<String, Object>> pedidoHist = pedidoDAO.obtenerHistorial(id_cli);
            request.setAttribute("pedidoHist", pedidoHist);
         
        request.getRequestDispatcher("historialCliente.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
