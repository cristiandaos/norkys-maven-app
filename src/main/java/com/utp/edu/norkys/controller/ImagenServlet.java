package com.utp.edu.norkys.controller;

import com.utp.edu.norkys.config.Conexion;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ImagenServlet")
public class ImagenServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idProd = Integer.parseInt(request.getParameter("idProd"));

        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            cn = Conexion.getConnection();
            String sql = "SELECT imagen FROM producto WHERE id_prod = ?";
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idProd);
            rs = ps.executeQuery();

            if (rs.next()) {
                InputStream imagenStream = rs.getBinaryStream("imagen");
                if (imagenStream != null) {
                    response.setContentType("image/png");
                    OutputStream output = response.getOutputStream();
                    byte[] buffer = new byte[1024];
                    int bytesRead;
                    while ((bytesRead = imagenStream.read(buffer)) != -1) {
                        output.write(buffer, 0, bytesRead);
                    }
                    output.close();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (cn != null) cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
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
        return "ImagenServlet";
    }
}
