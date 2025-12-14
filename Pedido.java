package com.loginrolesapp.modelo;

public class Pedido {

    private int id_pedido;
    private int usuario_id; 
    private double total;
    private String direccion_entrega;
    private String metodo_pago;
    private String numero_seguimiento;
    private String fecha_creacion;

    public Pedido() {
    }

    // Getters y Setters


    public int getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(int id_pedido) {
        this.id_pedido = id_pedido;
    }


    public int getUsuario_id() { return usuario_id; }
    public void setUsuario_id(int usuario_id) { this.usuario_id = usuario_id; }

    public double getTotal() { return total; }
    public void setTotal(double total) { this.total = total; }

    public String getDireccion_entrega() { return direccion_entrega; }
    public void setDireccion_entrega(String direccion_entrega) { this.direccion_entrega = direccion_entrega; }

    public String getMetodo_pago() { return metodo_pago; }
    public void setMetodo_pago(String metodo_pago) { this.metodo_pago = metodo_pago; }

    public String getNumero_seguimiento() { return numero_seguimiento; }
    public void setNumero_seguimiento(String numero_seguimiento) { this.numero_seguimiento = numero_seguimiento; }

    public String getFecha_creacion() { return fecha_creacion; }
    public void setFecha_creacion(String fecha_creacion) { this.fecha_creacion = fecha_creacion; }
}
