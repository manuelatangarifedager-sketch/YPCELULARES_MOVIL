package com.loginrolesapp.modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {

    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    Conexion cn = new Conexion();

    // ================================
    // LOGIN
    // ================================
    public Usuario login(String correo, String password) {
        Usuario u = null;
        String sql = "SELECT id_usuario, nombre, correo, rol "
                   + "FROM usuarios WHERE correo=? AND password=?";

        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, correo);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if (rs.next()) {
                u = new Usuario();
                u.setId_usuario(rs.getInt("id_usuario"));
                u.setNombre(rs.getString("nombre"));
                u.setCorreo(rs.getString("correo"));
                u.setRol(rs.getString("rol")); // CLAVE PARA EL LOGIN
            }

        } catch (Exception e) {
            System.out.println("❌ Error en login UsuarioDAO: " + e.getMessage());
        } finally {
            cerrar();
        }

        return u;
    }

    // ================================
    // LISTAR USUARIOS
    // ================================
    public List<Usuario> listar() {
        List<Usuario> lista = new ArrayList<>();
        String sql = "SELECT id_usuario, nombre, correo, password, rol FROM usuarios";

        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Usuario u = new Usuario();
                u.setId_usuario(rs.getInt("id_usuario"));
                u.setNombre(rs.getString("nombre"));
                u.setCorreo(rs.getString("correo"));
                u.setPassword(rs.getString("password"));
                u.setRol(rs.getString("rol"));
                lista.add(u);
            }

        } catch (Exception e) {
            System.out.println("❌ Error listar UsuarioDAO: " + e.getMessage());
        } finally {
            cerrar();
        }

        return lista;
    }

    // ================================
    // AGREGAR USUARIO
    // ================================
    public boolean agregar(Usuario u) {
        String sql = "INSERT INTO usuarios (nombre, correo, password, rol) "
                   + "VALUES (?, ?, ?, ?)";

        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getNombre());
            ps.setString(2, u.getCorreo());
            ps.setString(3, u.getPassword());
            ps.setString(4, u.getRol());
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            System.out.println("❌ Error agregar UsuarioDAO: " + e.getMessage());
        } finally {
            cerrar();
        }

        return false;
    }

    // ================================
    // BUSCAR POR ID
    // ================================
    public Usuario buscarPorId(int id) {
        Usuario u = null;
        String sql = "SELECT id_usuario, nombre, correo, password, rol "
                   + "FROM usuarios WHERE id_usuario=?";

        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                u = new Usuario();
                u.setId_usuario(rs.getInt("id_usuario"));
                u.setNombre(rs.getString("nombre"));
                u.setCorreo(rs.getString("correo"));
                u.setPassword(rs.getString("password"));
                u.setRol(rs.getString("rol"));
            }

        } catch (Exception e) {
            System.out.println("❌ Error buscarPorId UsuarioDAO: " + e.getMessage());
        } finally {
            cerrar();
        }

        return u;
    }

    // ================================
    // ACTUALIZAR USUARIO
    // ================================
    public boolean actualizar(Usuario u) {
        String sql = "UPDATE usuarios SET nombre=?, correo=?, password=?, rol=? "
                   + "WHERE id_usuario=?";

        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getNombre());
            ps.setString(2, u.getCorreo());
            ps.setString(3, u.getPassword());
            ps.setString(4, u.getRol());
            ps.setInt(5, u.getId_usuario());
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            System.out.println("❌ Error actualizar UsuarioDAO: " + e.getMessage());
        } finally {
            cerrar();
        }

        return false;
    }

    // ================================
    // ELIMINAR USUARIO
    // ================================
    public boolean eliminar(int id) {
        String sql = "DELETE FROM usuarios WHERE id_usuario=?";

        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            System.out.println("❌ Error eliminar UsuarioDAO: " + e.getMessage());
        } finally {
            cerrar();
        }

        return false;
    }

    // ================================
    // CERRAR CONEXIONES
    // ================================
    private void cerrar() {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (Exception e) {
            System.out.println("❌ Error cerrando recursos: " + e.getMessage());
        }
    }
    
    // ================================
// REGISTRO DE CLIENTE
// ================================
public boolean registrar(String nombre, String correo, String password,
                         String telefono, String direccion) {

    String sql = "INSERT INTO usuarios " +
                 "(nombre, correo, password, telefono, direccion, rol) " +
                 "VALUES (?, ?, ?, ?, ?, 'cliente')";

    try {
        con = cn.getConexion();
        ps = con.prepareStatement(sql);

        ps.setString(1, nombre);
        ps.setString(2, correo);
        ps.setString(3, password);
        ps.setString(4, telefono);
        ps.setString(5, direccion);

        ps.executeUpdate();
        return true;

    } catch (Exception e) {
        System.out.println("❌ Error registrar usuario: " + e.getMessage());
    } finally {
        cerrar();
    }

    return false;
}

}
