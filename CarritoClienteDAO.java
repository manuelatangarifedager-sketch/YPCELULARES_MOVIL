package com.loginrolesapp.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CarritoClienteDAO {

    Conexion cn = new Conexion();

    // =========================
    // AGREGAR PRODUCTO AL CARRITO
    // =========================
    public boolean agregarAlCarrito(int usuarioId, int productoId, int cantidad) {

        String sql = """
            INSERT INTO carrito (usuario_id, producto_id, cantidad)
            VALUES (?, ?, ?)
            ON DUPLICATE KEY UPDATE cantidad = cantidad + ?
        """;

        try (Connection con = cn.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, usuarioId);
            ps.setInt(2, productoId);
            ps.setInt(3, cantidad);
            ps.setInt(4, cantidad);

            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            System.out.println("❌ Error agregar al carrito: " + e.getMessage());
            return false;
        }
    }

    // =========================
    // LISTAR CARRITO DEL CLIENTE
    // =========================
    public List<Producto> listarCarrito(int usuarioId) {

        List<Producto> lista = new ArrayList<>();

        String sql = """
            SELECT p.id, p.nombre, p.precio, p.imagen_url, c.cantidad
            FROM carrito c
            INNER JOIN productos p ON c.producto_id = p.id
            WHERE c.usuario_id = ?
        """;

        try (Connection con = cn.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, usuarioId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getInt("id"));
                p.setNombre(rs.getString("nombre"));
                p.setPrecio(rs.getDouble("precio"));
                p.setImagen_url(rs.getString("imagen_url"));
                p.setCantidad(rs.getInt("cantidad")); // MUY IMPORTANTE
                lista.add(p);
            }

        } catch (Exception e) {
            System.out.println("❌ Error listar carrito: " + e.getMessage());
        }

        return lista;
    }

    // =========================
    // ELIMINAR PRODUCTO DEL CARRITO
    // =========================
    public boolean eliminarDelCarrito(int usuarioId, int productoId) {

        String sql = "DELETE FROM carrito WHERE usuario_id = ? AND producto_id = ?";

        try (Connection con = cn.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, usuarioId);
            ps.setInt(2, productoId);
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            System.out.println("❌ Error eliminar del carrito: " + e.getMessage());
            return false;
        }
    }

    // =========================
    // VACIAR CARRITO
    // =========================
    public boolean vaciarCarrito(int usuarioId) {

        String sql = "DELETE FROM carrito WHERE usuario_id = ?";

        try (Connection con = cn.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, usuarioId);
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            System.out.println("❌ Error vaciar carrito: " + e.getMessage());
            return false;
        }
    }
}
