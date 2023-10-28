/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import com.tech.blog.entities.User;
import jakarta.servlet.annotation.MultipartConfig;
import java.sql.*;



public class UserDAO {
    
    private Connection con;

    public UserDAO() {
    }
    public UserDAO(Connection con) {
        this.con = con;
    }
    
    /*Method to insert user data to database*/
    
    public boolean SaveUser(User user)
    {
        boolean flag = false;
        try {
            
            String query = "INSERT INTO USER(NAME,EMAIL,PASSWORD,GENDER) VALUES (?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1,user.getName());
            pstmt.setString(2,user.getEmail());
            pstmt.setString(3,user.getPassword());
            pstmt.setString(4,user.getGender());
            
            pstmt.executeUpdate();
            
            flag = true;
            
        } catch (Exception e) {
            
            e.printStackTrace();
        }
        return flag;
    }
    
    /*Get user details by email and password*/
    
    public User getUserByEmailAndPassword(String email,String pass)
    {
        User user = null;
        
        try {
            
            String query = "SELECT * FROM USER WHERE EMAIL = ? AND PASSWORD = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, pass);
            
            ResultSet rs =  pstmt.executeQuery();
            
             if(rs.next())
             {
                 user = new User();
                 user.setId(rs.getInt("id"));
                 String name = rs.getString("name");
                 user.setName(name);
                 user.setEmail(rs.getString("email"));
                 user.setPassword(rs.getString("password"));
                 user.setGender(rs.getString("gender"));
                 user.setReg_date(rs.getTimestamp("reg_date"));
                 user.setProfile(rs.getString("profile"));
                 
          
//                 String name = rs.getString("name");
                 
             }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return user;
        
    }
    
    public User getUserNameByUserId(int id)
    {
        User user = null;
        
        try {
            
            String query = "SELECT * FROM USER WHERE id = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, id);
            
            ResultSet rs =  pstmt.executeQuery();
            
             if(rs.next())
             {
                 user = new User();
                 user.setId(rs.getInt("id"));
                 String name = rs.getString("name");
                 user.setName(name);
                 user.setEmail(rs.getString("email"));
                 user.setPassword(rs.getString("password"));
                 user.setGender(rs.getString("gender"));
                 user.setReg_date(rs.getTimestamp("reg_date"));
                 user.setProfile(rs.getString("profile"));
                 
          
//                 String name = rs.getString("name");
                 
             }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return user;
        
    }
    
    
    /*Update User Data*/
    
    
    public boolean updateUser(User user)
    {
        boolean f = false;
        try {
            
            String query = "UPDATE USER SET NAME = ? ,EMAIL = ?,PASSWORD = ?,PROFILE = ? WHERE ID = ?;";
            PreparedStatement pstmt = con.prepareStatement(query);
            
            
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            
            if(!(user.getProfile().equals(""))) { pstmt.setString(4, user.getProfile());}
            else{ pstmt.setString(4, "default.jpg");   } 
            pstmt.setInt(5, user.getId());
            
            pstmt.executeUpdate();
            f = true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
        
    }
}
