/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.utp.edu.norkys.modelo.DAO;



import com.google.gson.Gson;

import java.util.List;

public class UtilidadesJson {
    public static String convertirAJson(List<?> datos) {
        Gson gson = new Gson();
        return gson.toJson(datos);
    }
}