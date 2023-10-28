<%-- 
    Document   : error_page
    Created on : 12-Sep-2023, 11:42:59 am
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.message"%>
<%@page import="com.tech.blog.entities.blog"%>
<%@page import="com.tech.blog.entities.category"%>
<%@page import="com.tech.blog.dao.BlogDAO"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry! Something went wrong</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="icon" type="image/png" href="https://clipground.com/images/codepen-logo-8.png"/>
        <style>
            .banner-clip{
                
            clip-path: polygon(50% 0%, 100% 0, 100% 83%, 50% 100%, 0 84%, 0 0);
            }
        </style>
    </head>
    <body>
       
        <div class="container text-center">
            <img src="img/warning.png" alt="alt" class="img-fluid " style="margin-top: 40px;"/>
            <h3 class="display-4" style="">Something Went Wrong!</h3>
            <%--<%= exception %>--%>
            
            <% 
                    User user = (User) session.getAttribute("current");
                    if(user == null)
                    {%>
                        <a href="index.jsp" class="btn btn-primary mt-4" style="background: #1a237e"> Return to Homepage</a>
                    <%}
                    else{
                    %>
                            <a href="profile.jsp" class="btn btn-primary mt-4" style="background: #1a237e">Return to Profile Page</a>
                    <%}%>        
                            
            
            
            
        </div>
        
    </body>
</html>
