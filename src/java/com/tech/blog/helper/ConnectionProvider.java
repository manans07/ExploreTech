/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.helper;

import java.sql.*;

/**
 *
 * @author DELL
 */
public class ConnectionProvider {
    
    private static Connection con;
    
    public static Connection getConnection()
    {
        
        try {
            
        if(con==null){   /*Register Driver Class*/
            Class.forName("com.mysql.jdbc.Driver");
            
            /*Creating Connection Object*/
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/exploretech","root","Password");
        }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return con; 
    }
    
}
