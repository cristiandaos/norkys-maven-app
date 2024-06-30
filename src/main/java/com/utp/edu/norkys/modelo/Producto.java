package com.utp.edu.norkys.modelo;

import java.text.DecimalFormat;

public class Producto {
    private int idProd;
    private String nombre;
    private String copy;
    private double precio;
    private String imagen;

    public int getIdProd() {
        return idProd;
    }

    public void setIdProd(int idProd) {
        this.idProd = idProd;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPrecio() {
         DecimalFormat df = new DecimalFormat("#.0000");
        return Double.parseDouble(df.format(precio));
        
    }

    public void setPrecio(double precio) {
         DecimalFormat df = new DecimalFormat("#.0000");
         this.precio = Double.parseDouble(df.format(precio));
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getCopy() {
        return copy;
    }

    public void setCopy(String copy) {
        this.copy = copy;
    }
    
}
