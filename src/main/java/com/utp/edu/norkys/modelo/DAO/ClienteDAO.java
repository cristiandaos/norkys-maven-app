/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.utp.edu.norkys.modelo.DAO;

import com.utp.edu.norkys.config.Conexion;
import com.utp.edu.norkys.modelo.Cliente;
import com.utp.edu.norkys.modelo.Producto;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author LUIS
 */
public class ClienteDAO {
    private Connection cn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    Conexion con = new Conexion();
    
    Statement st;
   
    PreparedStatement pst;
    
    /*
    public boolean autenticar(String correo, String password){
        ps=null;
        rs=null;
            
            try{
                
            cn = Conexion.getConnection();
            String sql ="select * from cliente where correo = ? and password= ?;";
             ps = cn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            
                ps.setString(1, correo);
                ps.setString(2, password);
               
            rs = ps.executeQuery();
            if(rs.absolute(1)) return true;
            
            
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{
                if(cn != null){
                    cn.close();
                }
                if(ps != null){
                    ps.close();
                }
                if(rs != null){
                    rs.close();
                }
            }catch(Exception e){
                e.printStackTrace();
            }
        }
            
            

        
        return false;
    }
     */
    
    public boolean registrarCliente(String nombres, String apellidos, String telefono, String correo, String password, String roles){
        
        ps=null;
        
        try {
            cn = Conexion.getConnection();
            
            String sql="insert into cliente (nombres, apellidos, telefono, correo, password, roles) values (?,?,?,?,?,?)";
            ps= cn.prepareStatement(sql);
            ps.setString(1, nombres);
            ps.setString(2, apellidos);
            ps.setString(3, telefono);
            ps.setString(4, correo);
            ps.setString(5, password);
            ps.setString(6, roles);
            
            if(ps.executeUpdate()==1){
                return true; 
            }
            
        } catch (Exception e) {
        }finally{
            try{
                if(cn != null){
                    cn.close();
                }
                if(ps != null){
                    ps.close();
                }
                if(rs != null){
                    rs.close();
                }
            }catch(Exception e){
                e.printStackTrace();
            }
        }

        
        return false;
    }
    
    
    
    
 
      public Cliente getClientePorCorreoYPassword(String correo, String password) {
        Cliente cliente = null;
        String query = "SELECT * FROM cliente WHERE correo = ? AND password = ?";

        try (Connection con = Conexion.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, correo);
            ps.setString(2, password);
           
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    cliente = new Cliente();
                    cliente.setId_cli(rs.getInt("id_cli"));
                    cliente.setCorreo(rs.getString("correo"));
                    cliente.setNombres(rs.getString("nombres"));
                    cliente.setRoles(rs.getString("roles"));
                    // Set other properties as needed
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cliente;
    }

    public boolean autenticar(String correo, String password) {
        return getClientePorCorreoYPassword(correo, password) != null;
    }
}
