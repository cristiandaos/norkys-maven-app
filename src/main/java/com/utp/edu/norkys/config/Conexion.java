package com.utp.edu.norkys.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
    private static String database = "bd_carrito";
    private static String username = "root";
    private static String password = "";
    private static String url = "jdbc:mysql://localhost:33065/"+database;
    
    public static Connection getConnection(){
        Connection conn = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);
            System.out.println("Conexión satisfactoria");
        }catch(Exception e){
            System.out.println("Error al conectar con la db");
            e.printStackTrace();
        }
        return conn;
    }
}
