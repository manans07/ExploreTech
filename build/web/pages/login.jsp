<%-- 
    Document   : login
    Created on : 09-Sep-2023, 7:47:57 pm
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.tech.blog.entities.message"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login|ExploreTech</title>
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="icon" type="image/png" href="https://clipground.com/images/codepen-logo-8.png"/>
        <style>
            .banner-clip{
                
            clip-path: polygon(50% 0%, 100% 0, 100% 83%, 50% 100%, 0 84%, 0 0);
                
                
            }
        </style>
        
        
        
        
        
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="icon" type="image/png" href="https://clipground.com/images/codepen-logo-8.png"/>
    </head>
    <body>
        
        <%@include file="navbar.jsp" %>
        
        <main>
            <div class="container" style="margin-top: 20px;">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        
                        <div class="card">
                            
                            <div class="card-header" style="color: white; background-color: #1a237e; text-align: center">
                                Login
                            </div>
                            
<!--                            <div class="alert alert-danger" role="alert">
                                This is a danger alert—check it out!
                            </div>-->
                            
                             <%  
                                message m = (message) session.getAttribute("msg");
                                
                                try{
                                if(m!=null)
                                {     
                             %>
                                <div class="alert <%= m.getCssClass() %>"  role="alert">
                                    
                                    <%= m.getContent() %>
                                </div>
                                    <% 
                                        session.removeAttribute("msg");
                                        }

                                    }catch(Exception e){
                                     
}
                                %> 
 
                            
                            <div class="card-body">
                                
                            <form action="LoginServlet" method="post">
                            <div class="form-group">
                              <label for="exampleInputEmail1">Email address</label>
                              <input name="email" required  type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                              <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                              <label for="exampleInputPassword1">Password</label>
                              <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                            </div ><!-- comment -->
                                    
                            <div class="mb-2">
                                    <small id="emailHelp" class="form-text text-muted">Don't have any account? </small>
                                    <a href="register.jsp"  >Click here to register</a> 
                            </div>
                            
                            <div class="container text-center"> <button type="submit" class="btn btn-primary" style="background: #01579b">Login</button> </div>
                          
                            </form>
                                
                            </div>
                            
                        </div>
                        
                    </div>    
                </div>
            </div>
        </main>
        
        
        
        
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/script.js" type="text/javascript"></script>
        
    </body>
</html>
