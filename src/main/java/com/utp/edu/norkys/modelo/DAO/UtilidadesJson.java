/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.utp.edu.norkys.modelo.DAO;
import com.google.gson.Gson;

import java.util.List;
import java.util.Map;

public class UtilidadesJson {
    public static String convertirAJson(List<?> datos) {
        Gson gson = new Gson();
        return gson.toJson(datos);
    }
    
     public static void main(String[] args) {
        List<Map<String, Object>> datosPedidos = PedidoDAO.obtenerDatosPedidos();
        String jsonDatos = convertirAJson(datosPedidos);
        System.out.println(jsonDatos);
    }
}
