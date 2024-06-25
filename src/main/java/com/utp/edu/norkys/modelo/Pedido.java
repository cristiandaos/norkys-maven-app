/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.utp.edu.norkys.modelo;

import java.util.Date;
import java.util.List;

public class Pedido {
    private int idPedido;
    private Cliente cliente;
    private Date fecha;
    private double total; // Add this line
    private List<DetallePedido> detalles;



    // Otros campos y métodos de la clase Pedido

    public double getTotal() {
        double total = 0.0;
        for (DetallePedido detalle : detalles) {
            total += detalle.getProducto().getPrecio() * detalle.getCantidad();
        }
        return total;
    }

    // Getters y setters para detalles
    public List<DetallePedido> getDetalles() {
        return detalles;
    }

    public void setDetalles(List<DetallePedido> detalles) {
        this.detalles = detalles;
    }
    
    // Getters and setters
    public int getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public double getTotal(DetallePedido det) { // Add this getter
        return total;
    }

    public void setTotal(double total) { // Add this setter
        this.total = total;
    }


}

