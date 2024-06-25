/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.utp.edu.norkys.modelo.DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.utp.edu.norkys.config.Conexion;
import com.utp.edu.norkys.modelo.Visita;

public class VisitaDAO {

    private Connection cn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    public int obtenerContador() {
        int contador = 0;
        try {
            cn = Conexion.getConnection();
            String sql = "SELECT contador FROM visitas WHERE id = 1";
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                contador = rs.getInt("contador");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contador;
    }

    // Método para incrementar el contador de visitas
    public void incrementarContador() {
        int contador = obtenerContador();
        contador++;
        try {
            cn = Conexion.getConnection();
            String sql = "UPDATE visitas SET contador = ? WHERE id = 1";
            ps = cn.prepareStatement(sql);
            ps.setInt(1, contador);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

