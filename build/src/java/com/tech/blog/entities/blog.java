/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author DELL
 */
public class blog {
   
    private int id;
    private String title;
    private String content;
    private String code;
    private String picture;
    private Timestamp bdate;
    private int cat_id;
    private int userId;

    public blog(int id, String title, String content, String code, String picture, Timestamp bdate, int cat_id, int userId) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.code = code;
        this.picture = picture;
        this.bdate = bdate;
        this.cat_id = cat_id;
        this.userId = userId;
    }
    
    public blog(String title, String content, String code, String picture, Timestamp bdate, int cat_id, int userId) {
//        this.id = id;
        this.title = title;
        this.content = content;
        this.code = code;
        this.picture = picture;
        this.bdate = bdate;
        this.cat_id = cat_id;
        this.userId = userId;
    }
    
    
    
    
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getCat_id() {
        return cat_id;
    }

    public void setCat_id(int cat_id) {
        this.cat_id = cat_id;
    }
    public blog() {
    }

    public blog(int id, String title) {
        this.id = id;
        this.title = title;
    }

    public blog(String title, String content, String code, String picture) {
        this.title = title;
        this.content = content;
        this.code = code;
        this.picture = picture;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public Timestamp getBdate() {
        return bdate;
    }

    public void setBdate(Timestamp bdate) {
        this.bdate = bdate;
    }

    
}
