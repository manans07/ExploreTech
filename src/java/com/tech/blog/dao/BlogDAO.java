/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import com.tech.blog.entities.User;
import com.tech.blog.entities.blog;
import com.tech.blog.entities.category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DELL
 */
public class BlogDAO {
    
    Connection con;

    public BlogDAO(Connection con) {
        this.con = con;
    }
    
    
    public ArrayList<category> getCategory()
    {
        ArrayList<category> list = new ArrayList<>();
        
        try {
            
            String s = "SELECT * FROM CATEGORIES;";
            Statement st = this.con.createStatement();
            ResultSet set  = st.executeQuery(s);
            
            while(set.next())
            {
                int cid = set.getInt("Cid");
                String cname = set.getString("Cname");
                String des = set.getString("Description");
                String tools = set.getString("Tools");
                
                category c =new category(cid, cname, des, tools);
                list.add(c);
            }
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        
        return list;
        
    }
    
    
    public boolean AddBlog(blog b)
    {
        boolean f = false;
        
        try {
           
            String query = "INSERT INTO blog(title,content,code,picture,cat_id,user_id) VALUES(?,?,?,?,?,?)";
            
            PreparedStatement pstmt = con.prepareStatement(query);
            
            
            pstmt.setString(1, b.getTitle());
            pstmt.setString(2, b.getContent());
            pstmt.setString(3, b.getCode());
            pstmt.setString(4, b.getPicture());
            pstmt.setInt(5, b.getCat_id());
            pstmt.setInt(6  , b.getUserId());
            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
        
        
    }
    
    public ArrayList<blog> getAllBlogs()
    {
//        Method to fetch all blogs
        ArrayList<blog> list = new ArrayList<>();
        
        try {
            
            PreparedStatement pstmt = con.prepareStatement("SELECT * FROM blog ORDER BY BDate DESC;");
            
            ResultSet rs = pstmt.executeQuery();
            
            while(rs.next())
            {
                int id = rs.getInt("id");
                String title = rs.getString("Title");
                String content = rs.getString("Content");
                String code = rs.getString("code");
                String picture = rs.getString("picture");
                Timestamp bdate = rs.getTimestamp("Bdate");
                int cat_id = rs.getInt("cat_id");
                int userId = rs.getInt("User_id");

                blog b = new blog(id, title, content, code, picture, bdate, cat_id, userId);
                
                list.add(b);
            }
            
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return list;
    }
    
    public ArrayList<blog> getBlogsByCat(int cat_Id)
    {
//        Method to fetch all blogs that belong to the same category
        ArrayList<blog> list = new ArrayList<>();
        
        try {
            
            PreparedStatement pstmt = con.prepareStatement("SELECT * FROM blog WHERE cat_id = ? ORDER BY Bdate DESC;");
            pstmt.setInt(1, cat_Id);
            
            ResultSet rs = pstmt.executeQuery();
            
            while(rs.next())
            {
                int id = rs.getInt("id");
                String title = rs.getString("Title");
                String content = rs.getString("Content");
                String code = rs.getString("code");
                String picture = rs.getString("picture");
                Timestamp bdate = rs.getTimestamp("Bdate");
                int cat_id = rs.getInt("cat_id");
                int userId = rs.getInt("User_id");

                blog b = new blog(id, title, content, code, picture, bdate, cat_id, userId);
                
                list.add(b);
            }
            
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public ArrayList<blog> getBlogsByUserId(int user_Id)
    {
//        Method to fetch all blogs that belong to the same category
        ArrayList<blog> list = new ArrayList<>();
        
        try {
            
            PreparedStatement pstmt = con.prepareStatement("SELECT * FROM blog WHERE User_id = ? ORDER BY Bdate DESC;");
            pstmt.setInt(1, user_Id);
            
            ResultSet rs = pstmt.executeQuery();
            
            while(rs.next())
            {
                int id = rs.getInt("id");
                String title = rs.getString("Title");
                String content = rs.getString("Content");
                String code = rs.getString("code");
                String picture = rs.getString("picture");
                Timestamp bdate = rs.getTimestamp("Bdate");
                int cat_id = rs.getInt("cat_id");
                int userId = rs.getInt("User_id");

                blog b = new blog(id, title, content, code, picture, bdate, cat_id, userId);
                
                list.add(b);
            }
            
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public int getBlogCountByUserId(int user_Id)
    {
//        Method to fetch all blogs that belong to the same category
        int count = 0;
        try {
            
            PreparedStatement pstmt = con.prepareStatement("SELECT COUNT(*) FROM blog WHERE User_id = ?;");
            pstmt.setInt(1, user_Id);
            
            ResultSet rs = pstmt.executeQuery();
            
            while(rs.next())
            {
                count = rs.getInt("COUNT(*)");
            }
            
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
    
    public boolean updateDefaultBlogPicture(blog b)
    {
        boolean f = false;
        try {
            
            String query = "UPDATE blog SET picture = ? WHERE id = ?;";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, "ExploreTech.png");
            pstmt.setInt(2, b.getId());
            b.setPicture("ExploreTech.png");
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    public blog getBlogDetailsById(int id)
    {
        blog b1 = new blog();
        
        try {
            
            PreparedStatement pstmt = con.prepareStatement("SELECT * FROM blog WHERE id = ?;");
            pstmt.setInt(1, id);
            
            ResultSet rs = pstmt.executeQuery();
            
            if(rs.next())
            {
                int Id = rs.getInt("id");
                String title = rs.getString("Title");
                String content = rs.getString("Content");
                String code = rs.getString("code");
                String picture = rs.getString("picture");
                Timestamp bdate = rs.getTimestamp("Bdate");
                int cat_id = rs.getInt("cat_id");
                int userId = rs.getInt("User_id");

                b1 = new blog(id, title, content, code, picture, bdate, cat_id, userId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b1;
    }
    
    public String getUserNameByUserId(int id)
    {
        String name = "";
        
        try {
            
            PreparedStatement pstmt = con.prepareStatement("SELECT name FROM user WHERE id = ?;");
            pstmt.setInt(1, id);
            
            ResultSet rs = pstmt.executeQuery();
            
            if(rs.next())
            {
                name = rs.getString("name");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return name;
    }
    
    
    
    public String getCategoryNameByCatId(int catId)
    {
        String name = "";
        
        try {
            String query = "SELECT cname FROM categories WHERE cid = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, catId);
            
            ResultSet rs = pstmt.executeQuery();
            
            if(rs.next())
            {
                name = rs.getString("cname");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        
        return name;
    }
    
    
    public boolean DeleteBlog(int blog_id)
    {
        boolean f = false;
        
        try {
            
            String query = "DELETE FROM blog WHERE id=?;";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, blog_id);
            pstmt.executeUpdate();
            
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    public boolean updateBlog(int blog_id,blog b1)
    {
        boolean f = false;
        
        try {
            
            String query = "UPDATE blog SET title=?, content=?, code=?, picture=? WHERE id=?;";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, b1.getTitle());
            pstmt.setString(2, b1.getContent());
            pstmt.setString(3, b1.getCode());
            pstmt.setString(4, b1.getPicture());
            pstmt.setInt(5, blog_id);
            pstmt.executeUpdate();
            
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    public boolean updateBlogWithoutProfile(int blog_id,blog b1)
    {
        boolean f = false;
        
        try {
            
            String query = "UPDATE blog SET Title=?,Content=?,Code=? WHERE Id=?;";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, b1.getTitle());
            pstmt.setString(2, b1.getContent());
            pstmt.setString(3, b1.getCode());
            pstmt.setInt(4, blog_id);
            pstmt.executeUpdate();
            
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    
    
    
}
