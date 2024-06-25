package com.utp.edu.norkys.modelo.DAO;

import com.utp.edu.norkys.config.Conexion;
import com.utp.edu.norkys.modelo.Producto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAO {
    private Connection cn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    public void insertarProducto(com.utp.edu.norkys.modelo.Producto producto) {

        try {
            cn = Conexion.getConnection();
            String sql = "INSERT INTO producto (nombre, copy, precio, imagen) VALUES (?, ?, ?, ?)";
            ps = cn.prepareStatement(sql);
            ps.setString(1, producto.getNombre());
            ps.setString(2, producto.getCopy());
            ps.setDouble(3, producto.getPrecio());
            ps.setString(4, producto.getImagen());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (cn != null) cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    
    public ArrayList<Producto> ListarTodos(){
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
    
     public static List<ProductoCantidad> obtenerProductosCantidad() {
        List<ProductoCantidad> datos = new ArrayList<>();

        String sql = "SELECT p.nombre, SUM(dp.cantidad) AS cantidad " +
                     "FROM detalle_pedido dp " +
                     "INNER JOIN producto p ON dp.id_prod = p.id_prod " +
                     "GROUP BY p.nombre";

        // Declaración de variables dentro del método
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            cn = Conexion.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                String nombre = rs.getString("nombre");
                int cantidad = rs.getInt("cantidad");
                ProductoCantidad producto = new ProductoCantidad(nombre, cantidad);
                datos.add(producto);
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

        return datos;
    }
}
