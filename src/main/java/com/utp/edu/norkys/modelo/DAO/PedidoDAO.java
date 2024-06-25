package com.utp.edu.norkys.modelo.DAO;

import com.utp.edu.norkys.config.Conexion;
import com.utp.edu.norkys.modelo.DetallePedido;
import com.utp.edu.norkys.modelo.Pedido;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class PedidoDAO {
     private Connection cn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    Conexion con = new Conexion();
    
    Statement st;
    PreparedStatement pst;
    
    // Tu método para obtener la conexión a la base de datos
 
    
    
    public boolean guardarPedido(Pedido pedido) {
    Connection conn = null;
    PreparedStatement stmtPedido = null;
    PreparedStatement stmtDetalle = null;
    boolean success = false;

    try {
        conn = Conexion.getConnection();
        conn.setAutoCommit(false);

        String sqlPedido = "INSERT INTO pedido (id_cli, fecha_ped, total) VALUES (?, ?, ?)";
        stmtPedido = conn.prepareStatement(sqlPedido, PreparedStatement.RETURN_GENERATED_KEYS);
        stmtPedido.setInt(1, pedido.getCliente().getId_cli());
        stmtPedido.setDate(2, new java.sql.Date(System.currentTimeMillis()));
        stmtPedido.setDouble(3, pedido.getTotal());
        stmtPedido.executeUpdate();

        // Obtener el ID del pedido generado
        ResultSet rs = stmtPedido.getGeneratedKeys();
        if (rs.next()) {
            int id_ped = rs.getInt(1);

            String sqlDetalle = "INSERT INTO detalle_pedido (id_ped, id_prod, precio, cantidad) VALUES (?, ?, ?, ?)";
            stmtDetalle = conn.prepareStatement(sqlDetalle);

            for (DetallePedido detalle : pedido.getDetalles()) {
                stmtDetalle.setInt(1, id_ped);
                stmtDetalle.setInt(2, detalle.getProducto().getIdProd());
                stmtDetalle.setDouble(3, detalle.getProducto().getPrecio());
                stmtDetalle.setInt(4, detalle.getCantidad());

                stmtDetalle.addBatch();
            }

            stmtDetalle.executeBatch();
            conn.commit();
            success = true;
        }

    } catch (SQLException e) {
        if (conn != null) {
            try {
                conn.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        e.printStackTrace();
    } finally {
        try {
            if (stmtPedido != null) stmtPedido.close();
            if (stmtDetalle != null) stmtDetalle.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    return success;
}


    
    
    
}
