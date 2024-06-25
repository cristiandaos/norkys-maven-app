/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.utp.edu.norkys.controller;

import com.utp.edu.norkys.modelo.DAO.VisitaDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/VisitaControlador")
public class VisitaControlador extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private VisitaDAO visitaDAO = new VisitaDAO();

    @Override
    public void init() throws ServletException {
        super.init();
        visitaDAO.incrementarContador();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        visitaDAO.incrementarContador();
        int contador = visitaDAO.obtenerContador();
        request.setAttribute("contador", contador);
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }
}