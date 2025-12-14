package com.loginrolesapp.modelo;

import java.sql.*;

public class PedidoDAO {

    Conexion cn = new Conexion();

    // ==========================
    // CREAR PEDIDO
    // ==========================
    public int crearPedido(int idUsuario, double total,
                           String direccionEntrega, String metodoPago) {

        int pedidoId = 0;

        String sql = "INSERT INTO pedidos " +
                     "(id_usuario, total, direccion_entrega, metodo_pago, estado) " +
                     "VALUES (?, ?, ?, ?, 'pendiente')";

        try (
            Connection con = cn.getConexion();
            PreparedStatement ps = con.prepareStatement(
                    sql, Statement.RETURN_GENERATED_KEYS)
        ) {

            ps.setInt(1, idUsuario);
            ps.setDouble(2, total);
            ps.setString(3, direccionEntrega);
            ps.setString(4, metodoPago);
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                pedidoId = rs.getInt(1);
            }

        } catch (Exception e) {
            System.out.println("Error crear pedido: " + e.getMessage());
        }

        return pedidoId;
    }

    // ==========================
    // INSERTAR DETALLE PEDIDO
    // ==========================
    public boolean insertarDetallePedido(int pedidoId, int productoId,
                                         int cantidad, double precioUnitario) {

        String sql = "INSERT INTO detalle_pedido " +
                     "(pedido_id, producto_id, cantidad, precio_unitario, subtotal) " +
                     "VALUES (?, ?, ?, ?, ?)";

        try (
            Connection con = cn.getConexion();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, pedidoId);
            ps.setInt(2, productoId);
            ps.setInt(3, cantidad);
            ps.setDouble(4, precioUnitario);
            ps.setDouble(5, precioUnitario * cantidad);
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            System.out.println("Error insertar detalle pedido: " + e.getMessage());
            return false;
        }
    }

    // ==========================
    // DESCONTAR STOCK
    // ==========================
    public boolean descontarStock(int productoId, int cantidad) {

        String sql = "UPDATE productos SET stock = stock - ? WHERE id = ?";

        try (
            Connection con = cn.getConexion();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, cantidad);
            ps.setInt(2, productoId);
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            System.out.println("Error descontar stock: " + e.getMessage());
            return false;
        }
    }
}
