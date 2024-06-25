package com.utp.edu.norkys.modelo;


public class DetallePedido {

  
    private Producto producto;
    private int cantidad;
     private int id_detalle_ped;
     private int id_ped;
     private double precio;
     
      public DetallePedido() {
    }

    public DetallePedido(Producto producto, int cantidad, int id_detalle_ped, int id_ped, double precio) {
        this.producto = producto;
        this.cantidad = cantidad;
        this.id_detalle_ped = id_detalle_ped;
        this.id_ped = id_ped;
        this.precio = precio;
    }

    public int getId_detalle_ped() {
        return id_detalle_ped;
    }

    public void setId_detalle_ped(int id_detalle_ped) {
        this.id_detalle_ped = id_detalle_ped;
    }

    public int getId_ped() {
        return id_ped;
    }

    public void setId_ped(int id_ped) {
        this.id_ped = id_ped;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }
  
      
    public void AumentarCantidad(int cantidad){
        this.cantidad += cantidad;
    }

    public double Importe(){
        return producto.getPrecio() * cantidad;
    } 
    
    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
    public void setTotal() {
        double total= (this.precio)*this.cantidad;
    }
}
