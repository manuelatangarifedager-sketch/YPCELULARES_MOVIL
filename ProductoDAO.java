package com.loginrolesapp.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAO {

    Conexion cn = new Conexion();

    // ======================================
    // LISTAR PRODUCTOS ACTIVOS
    // ======================================
    public List<Producto> listar() {

        List<Producto> lista = new ArrayList<>();
        String sql = """
        SELECT p.*, c.nombre AS categoria_nombre
        FROM productos p
        INNER JOIN categoria c ON p.categoria_id = c.id
        WHERE p.activo = 1
    """;

        try (Connection con = cn.getConexion();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Producto p = new Producto();
                p.setId(rs.getInt("id"));
                p.setNombre(rs.getString("nombre"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setPrecio(rs.getDouble("precio"));
                p.setStock(rs.getInt("stock"));
                p.setImagen_url(rs.getString("imagen_url"));
                p.setFecha_creacion(
                    rs.getTimestamp("fecha_creacion") != null
                    ? rs.getTimestamp("fecha_creacion").toString()
                    : null
                );
                p.setActivo(rs.getBoolean("activo"));
                p.setCategoriaId(rs.getInt("categoria_id"));
                p.setCategoriaNombre(rs.getString("categoria_nombre"));

                lista.add(p);
            }

        } catch (Exception e) {
            System.out.println("❌ Error listar productos: " + e.getMessage());
        }

        return lista;
    }

    // ======================================
    // AGREGAR PRODUCTO
    // ======================================
    public boolean agregar(Producto p) {

        String sql = """
            INSERT INTO productos
            (nombre, precio, stock, descripcion, imagen_url, activo, categoria_id)
            VALUES (?, ?, ?, ?, ?, ?, ?)
        """;

        try (Connection con = cn.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, p.getNombre());
            ps.setDouble(2, p.getPrecio());
            ps.setInt(3, p.getStock());
            ps.setString(4, p.getDescripcion());
            ps.setString(5, p.getImagen_url());
            ps.setBoolean(6, p.isActivo());
            ps.setInt(7, p.getCategoriaId());

            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            System.out.println("❌ Error agregar producto: " + e.getMessage());
            return false;
        }
    }

    // ======================================
    // OBTENER PRODUCTO POR ID
    // ======================================
    public Producto obtenerPorId(int id) {

        Producto p = null;
        String sql = "SELECT * FROM productos WHERE id = ?";

        try (Connection con = cn.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                p = new Producto();
                p.setId(rs.getInt("id"));
                p.setNombre(rs.getString("nombre"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setPrecio(rs.getDouble("precio"));
                p.setStock(rs.getInt("stock"));
                p.setImagen_url(rs.getString("imagen_url"));
                p.setFecha_creacion(
                    rs.getTimestamp("fecha_creacion") != null
                    ? rs.getTimestamp("fecha_creacion").toString()
                    : null
                );
                p.setActivo(rs.getBoolean("activo"));
                p.setCategoriaId(rs.getInt("categoria_id"));
            }

        } catch (Exception e) {
            System.out.println("❌ Error obtener producto: " + e.getMessage());
        }

        return p;
    }

    // ======================================
    // ACTUALIZAR PRODUCTO
    // ======================================
    public boolean actualizar(Producto p) {

        String sql = """
            UPDATE productos
            SET nombre = ?, precio = ?, stock = ?, descripcion = ?,
                imagen_url = ?, activo = ?, categoria_id = ?
            WHERE id = ?
        """;

        try (Connection con = cn.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, p.getNombre());
            ps.setDouble(2, p.getPrecio());
            ps.setInt(3, p.getStock());
            ps.setString(4, p.getDescripcion());
            ps.setString(5, p.getImagen_url());
            ps.setBoolean(6, p.isActivo());
            ps.setInt(7, p.getCategoriaId());
            ps.setInt(8, p.getId());

            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            System.out.println("❌ Error actualizar producto: " + e.getMessage());
            return false;
        }
    }

    // ======================================
    // ELIMINAR PRODUCTO
    // ======================================
    public boolean eliminar(int id) {

        String sql = "DELETE FROM productos WHERE id = ?";

        try (Connection con = cn.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            System.out.println("❌ Error eliminar producto: " + e.getMessage());
            return false;
        }
    }

    // ======================================
    // LISTAR POR CATEGORÍA
    // ======================================
    public List<Producto> listarPorCategoria(int categoriaId) {

        List<Producto> lista = new ArrayList<>();

        String sql = """
            SELECT p.*, c.nombre AS categoria_nombre
            FROM productos p
            INNER JOIN categoria c ON p.categoria_id = c.id
            WHERE p.activo = 1 AND c.id = ?
        """;

        try (Connection con = cn.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, categoriaId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Producto p = new Producto();
                p.setId(rs.getInt("id"));
                p.setNombre(rs.getString("nombre"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setPrecio(rs.getDouble("precio"));
                p.setStock(rs.getInt("stock"));
                p.setImagen_url(rs.getString("imagen_url"));
                p.setFecha_creacion(
                    rs.getTimestamp("fecha_creacion") != null
                    ? rs.getTimestamp("fecha_creacion").toString()
                    : null
                );
                p.setActivo(rs.getBoolean("activo"));
                p.setCategoriaId(rs.getInt("categoria_id"));
                p.setCategoriaNombre(rs.getString("categoria_nombre"));

                lista.add(p);
            }

        } catch (Exception e) {
            System.out.println("❌ Error listar por categoría: " + e.getMessage());
        }

        return lista;
    }
}
