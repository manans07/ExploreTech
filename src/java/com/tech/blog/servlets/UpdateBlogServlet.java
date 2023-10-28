/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.BlogDAO;
import com.tech.blog.entities.User;
import com.tech.blog.entities.blog;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.helper;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
/**
 *
 * @author DELL
 */

@MultipartConfig


public class UpdateBlogServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            int bid = Integer.parseInt(request.getParameter("bid"));
            
            String title = request.getParameter("title");
//            System.out.println(title);
            String content = request.getParameter("content");
            String code = request.getParameter("code");
            Part part = request.getPart("picture");
            String profileName = new String("");
            profileName = part.getSubmittedFileName();
            String prevPic = request.getParameter("picture1");
            
            if(profileName.length() == 0) profileName = prevPic;
            
            HttpSession session = request.getSession();
            User user =  (User) session.getAttribute("current");
//            int userid = user.getId();
            
            blog B = new blog(title, content, code, profileName);
            
            BlogDAO b = new BlogDAO(ConnectionProvider.getConnection());
            
            if(b.updateBlog(bid,B))
            {
                String path = realPath(request,this.getServletContext()) + "blog_pictures" + File.separator + profileName;
                helper.saveFile(part.getInputStream(), path);
                out.println("done");
            }else{
            out.println("Unsuccessful!");}
        }
    }
    
    
    
    public String realPath(HttpServletRequest request, ServletContext servletContext){
    
    String realPath = servletContext.getRealPath("/");
    return realPath;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
