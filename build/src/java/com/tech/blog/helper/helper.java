/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.helper;

import com.tech.blog.entities.blog;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author DELL
 */
public class helper {
    
    public static boolean deleteFile(String path)
    {
        boolean f = false;
        
        try {
            File file = new File(path);
            f = file.delete();            
        } catch (Exception e) {
        }
        
        return f;
    }
    
    public static boolean saveFile(InputStream is,String path)
    {
        boolean f = false;
        
        try {
            byte b[] = new byte[is.available()];
            is.read(b);
            
            FileOutputStream fos = new FileOutputStream(path);
            fos.write(b);
            fos.flush();
            fos.close();
            f=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    
    
    public blog getBlogToUpdate(blog b1)
    {
        blog b = b1;
        return b;
    }
    
    
    
    
}
