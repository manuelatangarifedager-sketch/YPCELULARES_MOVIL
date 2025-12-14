package com.loginrolesapp.modelo;

import java.sql.*;
import java.util.*;

public class CategoriaDAO {

    Conexion cn = new Conexion();

    // ==========================
    // LISTAR CATEGORÍAS
    // ==========================
    public List<Categoria> listar() {

        List<Categoria> lista = new ArrayList<>();
        String sql = "SELECT * FROM categoria";

        try (
            Connection con = cn.getConexion();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {

            while (rs.next()) {
                Categoria c = new Categoria();
                c.setId(rs.getInt("id"));
                c.setNombre(rs.getString("nombre"));
                lista.add(c);
            }

        } catch (Exception e) {
            System.out.println("Error listar categorias: " + e.getMessage());
        }

        return lista;
    }

    // ==========================
    // AGREGAR CATEGORÍA
    // ==========================
    public boolean agregar(String nombre) {

        String sql = "INSERT INTO categoria (nombre) VALUES (?)";

        try (
            Connection con = cn.getConexion();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setString(1, nombre);
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            System.out.println("Error agregar categoria: " + e.getMessage());
            return false;
        }
    }

    // ==========================
    // ACTUALIZAR CATEGORÍA
    // ==========================
    public boolean actualizar(int id, String nombre) {

        String sql = "UPDATE categoria SET nombre=? WHERE id=?";

        try (
            Connection con = cn.getConexion();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setString(1, nombre);
            ps.setInt(2, id);
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            System.out.println("Error actualizar categoria: " + e.getMessage());
            return false;
        }
    }

    // ==========================
    // ELIMINAR CATEGORÍA
    // ==========================
    public boolean eliminar(int id) {

        String sql = "DELETE FROM categoria WHERE id=?";

        try (
            Connection con = cn.getConexion();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, id);
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            System.out.println("Error eliminar categoria: " + e.getMessage());
            return false;
        }
    }
}
