<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.message"%>
<%@page import="com.tech.blog.entities.blog"%>
<%@page import="com.tech.blog.entities.category"%>
<%@page import="com.tech.blog.dao.BlogDAO"%>
<%@page import="jakarta.servlet.annotation.MultipartConfig"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.dao.LikeDAO"%>





<%
     User u1 = (User) session.getAttribute("current");
     if(u1!=null)
     {
        response.sendRedirect("profile.jsp");
        }
%>






<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ExploreTech|Blog</title>
        
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
    <body style="margin-bottom:40px; ">
          
          <!--nav-bar-->
          <%@include file="navbar.jsp"%>
          
          <!--banner #3f51b5, #1565c0, #1e88e5 , #1976d2 , #303f9f, -->
          
          <div class="container-fluid banner-clip" style="margin: 0; padding: 0">
              <!--#3949ab--> 
              <div class="jumbotron jumbotron-fluid text-white" style="background-color: #01579b ; ">
                  <div class="container" >
                      <h2 class="display-4"> 
                      Welcome to ExploreTech!
                  </h2>
                      <h4 class="display">
                      A place where Tech Enthusiasts gather to learn and share! :) 
                  </h4>
                      <br>
                  
                      
                      <a href="register.jsp" class="btn btn-outline-light" style="margin-right: 5px;">
                          <span>
                          <i class="fa fa-plus" aria-hidden="true"></i>

                          </span>   Let's Start
                      </a>
                      
                      <a href=" login.jsp" class="btn btn-outline-light">
                          <span>
                          <i class="fa fa-sign-in " aria-hidden="true"></i>
                          </span>   
                          Login
                      </a>
                      
                      
                  </div> 
              </div>
              
          </div>

          
          <div class="container">
          
          <div class="row mb-4">
              
              <%
                                      BlogDAO dao = new BlogDAO(ConnectionProvider.getConnection());
                                      
                                      ArrayList<blog> list = dao.getAllBlogs();
                                      
                                      for(blog c1 : list)
                                      {
                                      
                                  
                                  %>
              <!--<div class="row mb-4">-->
                  
                  <div class="col-md-4">
                      
                                  
                      <div class="card mt-2" style="width:18rem">
                              <div class="card-body">
                                  
                                  
                              <h5 class="card-title"><%= c1.getTitle() %></h5>
                              <p class="card-text">
                                    
                                  <%=c1.getContent() %>
                                  </p>
                              <a href="login.jsp" class="btn btn-primary" style="background: #01579b">Read More</a>
                            </div>
                    <!--</div>-->  
                  </div>
                  </div>
                  <%
                      }
                  %>
          </div>
          
          </div>
          
          
          
          
          
          
          
          
          <!-- 
          <div class="container">
              
              <div class="row mb-4">
                  
                  <div class="col-md-4">
                      
                    <div class="card" style="width: 18rem;">
                              <div class="card-body">
                              <h5 class="card-title">Android Development</h5>
                              <p class="card-text">
                                  
                                   Android Development invloves crafting mobile apps for Android devices using languages like Java or Kotlin to design and build user friendly and feature rich experiences.
                                  </p>
                              <a href="login.jsp" class="btn btn-primary" style="background: #01579b">Read More</a>
                            </div>
                    </div>  
                  </div>
                  
        <div class="col-md-4">
                      
                    <div class="card" style="width: 18rem;">
                              <div class="card-body">
                              <h5 class="card-title">Web Development</h5>
                                  <p class="card-text">
                                   Web development is the art of creating and maintaining websites and web applications, encompassing everything from coding and design to functionality and user experience.
                                  </p>
                              <a href="login.jsp" class="btn btn-primary" style="background: #01579b">Read More</a>
                            </div>
                    </div>  
                  </div>
                  
                  <div class="col-md-4">
                      
                    <div class="card" style="width: 18rem;">
                              <div class="card-body">
                              <h5 class="card-title">Blockchain Development</h5>
                              <p class="card-text">
                                  
                                  Blockchain development involves creating decentralized digital ledgers using cryptographic techniques to secure and verify transactions and data across a network of computers.
                              </p>
                              <a href="login.jsp" class="btn btn-primary" style="background: #01579b">Read More</a>
                            </div>
                    </div>  
                  </div>
                  </div>
                  
              <div class="row mb-4">
                  
                  <div class="col-md-4">
                      
                    <div class="card" style="width: 18rem;">
                              <div class="card-body">
                              <h5 class="card-title">Artificial Intelligence</h5>
                              <p class="card-text"> 
                                  Artificial intelligence is the field of computer science dedicated to creating machines and systems that can perform tasks requiring human-like intelligence, such as learning or problem-solving.
                              </p>
                              <a href="login.jsp" class="btn btn-primary" style="background: #01579b">Read More</a>
                            </div>
                    </div>  
                  </div>
                  
                  <div class="col-md-4">
                      
                    <div class="card" style="width: 18rem;">
                              <div class="card-body">
                              <h5 class="card-title">Data Science</h5>
                              <p class="card-text">Data science is the discipline of extracting valuable insights and knowledge from large and complex data sets using statistical, mathematical, and computational techniques.</p>
                              <a href="login.jsp" class="btn btn-primary" style="background: #01579b">Read More</a>
                            </div>
                    </div>  
                  </div>
                  
                  <div class="col-md-4">
                      
                    <div class="card" style="width: 18rem;">
                              <div class="card-body">
                              <h5 class="card-title">Machine Learning</h5>
                              <p class="card-text">Machine learning is a subset of AI that focuses on developing algorithms and models enabling computers to learn from data and make predictions or decisions without explicit programming.</p>
                              <a href="login.jsp" class="btn btn-primary" style="background: #01579b">Read More</a>
                            </div>
                    </div>  
                  </div>
              </div>
              
              <div class="row">
                  
                  <div class="col-md-4">
                      
                    <div class="card" style="width: 18rem;">
                              <div class="card-body">
                              <h5 class="card-title">Programming Languages</h5>
                              <p class="card-text">Programming languages are tools that enable humans to communicate instructions to computers, facilitating the development of software and applications.</p>
                              <a href="login.jsp" class="btn btn-primary" style="background: #01579b">Read More</a>
                            </div>
                    </div>  
                  </div>

          </div> -->

          
          



        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/script.js" type="text/javascript"></script>
        
<!--        <script>
            $(document).ready(function()
            {
                alert("Loaded!");
            })
        </script>*/
        -->
        
        
    </body>
</html>
