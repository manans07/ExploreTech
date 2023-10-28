<%-- 
    Document   : contact
    Created on : 29-Sep-2023, 11:40:33 am
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Us|ExploreTech</title>
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
        <%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.message"%>
<%@page import="com.tech.blog.entities.blog"%>
<%@page import="com.tech.blog.entities.category"%>
<%@page import="com.tech.blog.dao.BlogDAO"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="jakarta.servlet.annotation.MultipartConfig"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.dao.LikeDAO"%>








<!--           <nav class="navbar navbar-expand-lg navbar-light"  style="background-color: #e3f2fd;">
            <a class="navbar-brand" href="#">ExploreTech</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
              <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                <li class="nav-item active">
                  <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Contact</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link disabled" href="#">Disabled</a>
                </li>
              </ul>
              <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
              </form>
            </div>
          </nav>
          -->
            <nav class="navbar navbar-expand-lg navbar-dark"  style="background-color: #1a237e;" */>
            <a href="index.jsp" class="navbar-brand" href="#"> <span class="fa fa-codepen"> </span>  ExploreTech</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between" id="navbarNavDropdown">
              <ul class="navbar-nav">
                <li class="nav-item active">
                    <%
                      User user = (User) session.getAttribute("current");
                      String url = "";
                      if(user == null)
                        {
                            url = "index.jsp";
                        }else{
                            url = "profile.jsp";
                        }
                    %>
                  <a class="nav-link" href="<%=url%>">Home <span class="sr-only">(current)</span></a>
                </li>
                
              </ul>
              
              <ul class="nav-bar nav mr-right ">
            
                    <li class="nav-item">
                  <%
                      if(user==null){
                      
                  %>
                        <a href="register.jsp"  class="nav-link text-white"> <span class="fa fa-user-circle"></span> Sign Up</a>
                        
                        <%}
                        
                            else{%>
                        
                        <a href="profile.jsp"  class="nav-link text-white"> <span class="fa fa-user-circle"></span> <%= user.getName()%></a>
                        <%}%>
                    </li>

                    <li class="nav-item">
                        <%
                      if(user==null){
                      
                        %>
                              <a href="login.jsp" class="nav-link text-white" >
                                  <span>
                                  <i class="fa fa-sign-in " aria-hidden="true"></i>
                                  </span>   
                                  Log In</a>
                                  
                        <%
                            }
                            else{%>
                            <a href="login.jsp" class="nav-link text-white" >
                                  <span>
                                  <i class="fa fa-sign-in " aria-hidden="true"></i>
                                  </span>   
                                  Log Out</a>
                                                <%}%>

                        </li>
                        
                </ul>
                                
                                

            </div>

          </nav>
                                
        <!--Section: Contact v.2-->
        <section class="col-md-8 container">
        <!--Section heading-->
        <h2 class="h1-responsive font-weight-bold text-center my-4">Contact us</h2>
        <!--Section description-->
        <p class="text-center w-responsive mx-auto mb-5">Do you have any questions? Please do not hesitate to contact us directly. Our team will come back to you within
            a matter of hours to help you.</p>

        <div class="row">

            <!--Grid column-->
            <div class="col-md-9 mb-md-0 mb-5">
                <form id="contact-form" name="contact-form" action="ContactServlet" method="POST" >

                    <!--Grid row-->
                    <div class="row">

                        <!--Grid column-->
                        <div class="col-md-6">
                            <div class="md-form mb-0">
                                <label for="name" class="">Your name</label>
                                <input type="text" id="name" name="name" class="form-control" required>
                            </div>
                        </div>
                        <!--Grid column-->

                        <!--Grid column-->
                        <div class="col-md-6">
                            <div class="md-form mb-0">
                                <label for="email"  class="">Your email</label>
                                <input type="text" id="email" name="email" class="form-control" required>
                            </div>
                        </div>
                        <!--Grid column-->

                    </div>
                    <!--Grid row-->

                    <!--Grid row-->
                    <div class="row mt-2">
                        <div class="col-md-12">
                            <div class="md-form mb-0">
                                <label for="subject" class="">Subject</label>
                                <input type="text" id="subject" name="subject" class="form-control">
                            </div>
                        </div>
                    </div>
                    <!--Grid row-->

                    <!--Grid row-->
                    <div class="row mt-2">

                        <!--Grid column-->
                        <div class="col-md-12">

                            <div class="md-form">
                                <label for="message">Your message</label>
                                <textarea id="message" name="message" rows="2" class="form-control md-textarea"></textarea>
                            </div>

                        </div>
                    </div>
                    <!--Grid row-->

                

                <div class="text-center mt-4">
                    <button class="btn btn-primary text-white" style="background: #01579b" type="submit">Send</button>
                </div>
                <div class="status"></div>
                </form>
            </div>
            <!--Grid column-->

            <!--Grid column-->
            <div class="col-md-3 text-center mt-2">
                <ul class="list-unstyled mb-0">
                    <li><i class="fa fa-map-marker fa-2x"></i>
                        <p>Bhopal, Madhya Pradesh, India</p>
                    </li>

                    <li><i class="fa fa-phone mt-4 fa-2x"></i>
                        <p>+91-9166101911</p>
                    </li>

                    <li><i class="fa fa-envelope mt-4 fa-2x"></i> <br>
                        <a href="manan.s3102@gmail.com" style="color: black;">contact@exploretech.com</a>
                    </li>
                </ul>
            </div>
            <!--Grid column-->

        </div>
        
        
        
        
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/script.js" type="text/javascript"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
        $(document).ready( function(){
          
        console.log("loaded");
        $('#contact-form').on('submit',function(event){
            event.preventDefault();
            
            let form = new FormData(this);
            
            console.log(form);
            
            $.ajax({
                url: "ContactServlet",
                type: 'POST',
                data: form,
                success: function(data, textStatus, jqXHR) {
                    console.log(data);
                    if (data.trim() === 'done') {
                        swal("Message Sent", "Thank You! :)","success");

                    } else {
                        swal("Something went wrong!", "Please try again!","error");
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log(jqXHR);
                    swal("Something went wrong!", "Please try again!");
                },
                processData: false,
                contentType: false
            });

            
            });
        });
        
        </script>
    </section>
    <!--Section: Contact v.2-->
    
    </body>
</html>










