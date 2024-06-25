import com.utp.edu.norkys.modelo.DetallePedido;
import com.utp.edu.norkys.modelo.Producto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DetallePedidoDAO {

    private Connection con;

    public DetallePedidoDAO(Connection con) {
        this.con = con;
    }

    // Método para obtener los detalles de pedido por ID de pedido
    public List<DetallePedido> obtenerDetallesPorPedido(int idPedido) {
        List<DetallePedido> detalles = new ArrayList<>();
        String sql = "SELECT dp.idDetallePedido, dp.idPedido, dp.idProducto, dp.cantidad, dp.precio, p.nombre, p.descripcion, p.precio AS precioProducto " +
                     "FROM detalle_pedido dp " +
                     "JOIN producto p ON dp.idProducto = p.idProducto " +
                     "WHERE dp.idPedido = ?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idPedido);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                DetallePedido detalle = new DetallePedido();
                detalle.setId_detalle_ped(rs.getInt("idDetallePedido"));
                detalle.setId_ped(rs.getInt("idPedido"));
                
                Producto producto = new Producto();
                producto.setIdProd(rs.getInt("idProducto"));
                producto.setNombre(rs.getString("nombre"));
                producto.setCopy(rs.getString("descripcion"));
                producto.setPrecio(rs.getDouble("precioProducto"));
                
                detalle.setProducto(producto);
                detalle.setCantidad(rs.getInt("cantidad"));
                detalle.setPrecio(rs.getDouble("precio"));
                
                detalles.add(detalle);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return detalles;
    }
}
