/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.utp.edu.norkys.modelo.DAO;

import com.utp.edu.norkys.config.Conexion;
import com.utp.edu.norkys.modelo.Empleado;
import com.utp.edu.norkys.modelo.Producto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author LUIS
 */
public class EmpleadoDAO {
     private Connection cn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    /*
    public ArrayList<Producto> ListarEmp(){
        ArrayList<Producto> lista = new ArrayList<Producto>();
        
        try{
            cn = Conexion.getConnection();
            String sql = "select * from producto";
            ps = cn.prepareCall(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
                Producto obj = new Producto();
                obj.setIdProd(rs.getInt("id_prod"));
                obj.setNombre(rs.getString("nombre"));
                obj.setCopy(rs.getString("copy"));
                obj.setPrecio(rs.getDouble("precio"));
                obj.setImagen(rs.getString("imagen"));
                lista.add(obj);
            }
            
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
        
        return lista;
    }
    
    public Producto BuscarPorId(int id) {
        Producto obj = null;

        try {
            cn = Conexion.getConnection();
            String sql = "select * from producto where id_prod = ?";
            ps = cn.prepareCall(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                obj = new Producto();
                obj.setIdProd(rs.getInt("id_prod"));
                obj.setNombre(rs.getString("nombre"));
                obj.setCopy(rs.getString("copy"));
                obj.setPrecio(rs.getDouble("precio"));
                obj.setImagen(rs.getString("imagen"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return obj;
    }

 */

    
    public boolean registrarEmpleado(String nombres, String apellidos, String correo, String password, String roles){
        
        ps=null;
        
        try {
            cn = Conexion.getConnection();
            
            String sql="insert into cliente (nombres, apellidos, correo, password, roles) values (?,?,?,?,?)";
            ps= cn.prepareStatement(sql);
            ps.setString(1, nombres);
            ps.setString(2, apellidos);
            ps.setString(3, correo);
            ps.setString(4, password);
            ps.setString(5, roles);
            
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
    
    
    public ArrayList<Empleado> ListarEmp(){
        ArrayList<Empleado> lista = new ArrayList<Empleado>();
        
        try{
            cn = Conexion.getConnection();
            String sql = "SELECT * FROM cliente WHERE roles='2'";
            ps = cn.prepareCall(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
                Empleado obj = new Empleado();
                
                obj.setNombres(rs.getString("nombres"));
                obj.setApellidos(rs.getString("apellidos"));
                obj.setCorreo(rs.getString("correo"));
                obj.setPassword(rs.getString("password"));
        
                lista.add(obj);
            }
            
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
        
        return lista;
    }
    
    
    
}
