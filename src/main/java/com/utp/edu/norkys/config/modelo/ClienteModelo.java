/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.utp.edu.norkys.config.modelo;

import com.utp.edu.norkys.config.Conexion;
import com.utp.edu.norkys.modelo.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author LUIS
 */
public class ClienteModelo {
     Conexion con = new Conexion();
    Connection cn;
    Statement st;
    ResultSet rs;
    PreparedStatement pst;

    
    public Cliente obtenerUsuario(String correo) throws SQLException {
        
                 String sql="select * from cliente";
                cn= Conexion.getConnection();
                st=cn.createStatement();
                pst = cn.prepareStatement(sql);
                pst.setString(1, correo);
                ResultSet result = pst.executeQuery();
                
                Cliente cli = null;

                    while (result.next()) {
                        cli = new Cliente(
                                result.getInt("id_cli"),
                                result.getString("nombres"),
                                result.getString("apellidos"),
                                result.getString("telefono"),
                                result.getString("correo"),
                                result.getString("password"),
                                result.getString("roles")
                        );
                    }
                  
             return cli;
        
    }
    
    
    
    
    
}
