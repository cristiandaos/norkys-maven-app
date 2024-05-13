package com.utp.edu.norkys.config.modelo.DAO;

import com.utp.edu.norkys.config.Conexion;
import com.utp.edu.norkys.config.modelo.Producto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductoDAO {
    private Connection cn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
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
}
