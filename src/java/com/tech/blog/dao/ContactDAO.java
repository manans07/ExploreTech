/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import com.tech.blog.entities.Contact;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author DELL
 */
public class ContactDAO {
  
    Connection con;

    public ContactDAO(Connection con) {
        this.con = con;
    }
    
    public boolean sendContactForm(Contact c)
    {
        boolean f = false;
        
        try {
            String query = "INSERT INTO contact(name,email,subject,message) VALUES(?,?,?,?);";
            PreparedStatement pstmt = con.prepareStatement(query);
            
            pstmt.setString(1, c.getName());
            pstmt.setString(2, c.getEmail());
            pstmt.setString(3, c.getSubject());
            pstmt.setString(4, c.getMessage());
            
            pstmt.executeUpdate();
            f = true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        
        return f;
    }
    
    
    
    
    
}
