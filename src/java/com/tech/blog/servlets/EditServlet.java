/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDAO;
import com.tech.blog.entities.User;
import com.tech.blog.entities.message;
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
public class EditServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            Part part = request.getPart("profile");
            String profileName = part.getSubmittedFileName();
            
            
            
            
            /*Get user object from session*/
            
            HttpSession session = request.getSession();
            User u = (User) session.getAttribute("current");
            
            
            u.setEmail(email);
            u.setPassword(password);
            u.setName(name);
            String oldProfile =u.getProfile();
            u.setProfile(profileName);
            
            UserDAO dao = new UserDAO(ConnectionProvider.getConnection());
            
            if(dao.updateUser(u) == true){
                String path = realPath(request,this.getServletContext()) + "pics" + File.separator + u.getProfile();
//                else { path = realPath(request,this.getServletContext()) + "pics" + File.separator + "default.jpg";}
//                  String path = request.getRealPath("/")+"pics"+File.separator + u.getProfile();
                
                String oldPath = realPath(request,this.getServletContext()) + "pics" + File.separator + oldProfile;
                
                if(!oldProfile.equals("default.jpg"))
                {
                    helper.deleteFile(oldPath);
                }
                
                
                if(helper.saveFile(part.getInputStream(), path)){
                        out.println("Profile Updated!");
                        message msg = new message("Profile Updated Successfully!","success","alert-success");
                        session.setAttribute("msg", msg);
                        
                        
                }
                    else{
                        out.println("Profile Not Updated!");
                        message msg = new message("Something Went Wrong!","error","alert-danger");
                        session.setAttribute("msg", msg);
                    }}
            else{
                out.println("Not Updated!");
                message msg = new message("Something Went Wrong!","error","alert-danger");
                session.setAttribute("msg", msg);
            }
            
            response.sendRedirect("profile.jsp");
            
            
            out.println("</body>");
            out.println("</html>");
        }
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

    public String realPath(HttpServletRequest request, ServletContext servletContext){
    
    String realPath = servletContext.getRealPath("/");
    return realPath;
    }
    
    
}
