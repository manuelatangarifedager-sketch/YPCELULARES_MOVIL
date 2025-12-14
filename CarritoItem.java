package com.loginrolesapp.modelo;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class CarritoItem {

    private int id;
    private int cantidad;
    private Timestamp fechaAgregado;
    private String nombreProducto;
    private BigDecimal precio;
    private String imagen;

    // ============================
    //        GETTERS
    // ============================

    public int getId() {
        return id;
    }

    public int getCantidad() {
        return cantidad;
    }

    public Timestamp getFechaAgregado() {
        return fechaAgregado;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public BigDecimal getPrecio() {
        return precio;
    }

    public String getImagen() {
        return imagen;
    }

    // ============================
    //        SETTERS
    // ============================

    public void setId(int id) {
        this.id = id;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public void setFechaAgregado(Timestamp fechaAgregado) {
        this.fechaAgregado = fechaAgregado;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public void setPrecio(BigDecimal precio) {
        this.precio = precio;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
}
