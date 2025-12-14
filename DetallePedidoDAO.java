package com.loginrolesapp.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DetallePedidoDAO {

    private Connection con;

    // =========================
    // CONSTRUCTORES
    // =========================
    public DetallePedidoDAO() {
    }

    public DetallePedidoDAO(Connection con) {
        this.con = con; // usado en transacciones
    }

    private Connection getConnection() throws SQLException {
        return (con != null) ? con : new Conexion().getConexion();
    }

    // =========================
    // INSERTAR DETALLE
    // =========================
    public boolean insertar(DetallePedido d) {

        String sql = """
            INSERT INTO detalle_pedido
            (id_pedido, id_producto, cantidad, precio_unitario, subtotal)
            VALUES (?, ?, ?, ?, ?)
        """;

        try (
            Connection cn = getConnection();
            PreparedStatement ps = cn.prepareStatement(sql)
        ) {

            ps.setInt(1, d.getPedido_id());
            ps.setInt(2, d.getProducto_id());
            ps.setInt(3, d.getCantidad());
            ps.setDouble(4, d.getPrecio_unitario());
            ps.setDouble(5, d.getSubtotal());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.out.println("❌ Error insertando detalle pedido: " + e.getMessage());
            return false;
        }
    }
}
