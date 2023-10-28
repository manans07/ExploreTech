/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author DELL
 */
public class LikeDAO {
    
    
    Connection con;

    public LikeDAO(Connection con) {
        this.con = con;
    }
    
    public boolean isLiked(int bid,int userid)
    {
        boolean f = false;
        
        try {
            String query = "SELECT * FROM likes WHERE blogid = ? AND userid=?;";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, bid);
            pstmt.setInt(2, userid);
            ResultSet rs = pstmt.executeQuery();
            
            if(rs.next())
            {
                f = true;
            }
            
            
        } catch (Exception e) {
        }
        
        
        
        return f;
        
    }
    
    public boolean insertLike(int bid,int userid)
    {
        boolean f = false;
        try {
            
            if(!isLiked(bid, userid)) {
            
            String query = "INSERT INTO likes(blogid,userid,likeid) VALUES(?,?,?);";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, bid);
            pstmt.setInt(2, userid);
            pstmt.setInt(3, 1);
            pstmt.executeUpdate();
            f=true;}
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public int countLike(int bid)
    {
        int cnt = 0;
        try {
            
            String query = "SELECT COUNT(*) FROM likes WHERE blogid = ?;";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, bid);
            ResultSet rs = pstmt.executeQuery();
            
            if(rs.next())
            {
                cnt = rs.getInt("COUNT(*)");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        
        return cnt;
    }
    
    
    
    
    public boolean deleteLike(int bid,int userid)
    {
        boolean f = false;
        
        try {
            String query = "DELETE FROM liketable WHERE bid = ? AND userid=?;";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, bid);
            pstmt.setInt(2, userid);
            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
        }
        
        return f;
        
    }
    
    
    
    
    
    
    

}
