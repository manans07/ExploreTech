/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

/**
 *
 * @author DELL
 */
public class category {
    
    private int cid;
    private String cname;
    private String description;
    private String tools;


    public category() {
    }

    public category(int cid, String cname) {
        this.cid = cid;
        this.cname = cname;
    }

    public category(int cid, String cname, String description, String tools) {
        this.cid = cid;
        this.cname = cname;
        this.description = description;
        this.tools = tools;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTools() {
        return tools;
    }

    public void setTools(String tools) {
        this.tools = tools;
    }
    
    
    
    
}
