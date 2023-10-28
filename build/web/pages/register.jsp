<%-- 
    Document   : register
    Created on : 09-Sep-2023, 8:07:12 pm
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User Registration|ExploreTech</title>
        
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
                                New User Registration
                            </div>
                            <div class="card-body">
                                
                                <form id="reg-form" action="RegisterServlet" method="POST">
                              <label>Name</label> 
                              <div class="form-row mb-2">
                                <div class="col">
                                  <input type="text" class="form-control" id="username" name="username" placeholder="Enter your name">
                                </div>
                            </div>
                                
                                
                                
                                
                                
                            <div class="form-group mb-2">
                              <label for="exampleInputEmail1">Email address</label>
                              <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" placeholder="Enter email">
                              <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                              <label for="exampleInputPassword1">Password</label>
                              <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                            </div>
             
                            <div class="form-group">
                                  <label>Gender</label>
                                  <div class="col-sm-10">
                                    <div class="form-check">
                                      <input class="form-check-input" type="radio" name="gender" id="gender" value="male">
                                      <label class="form-check-label" for="gender">
                                        Male
                                      </label>
                                    </div>
                                    <div class="form-check">
                                      <input class="form-check-input" type="radio" name="gender" id="gender" value="female">
                                      <label class="form-check-label" for="gender">
                                        Female
                                      </label>
                                    </div>
                                  </div>
                                </div>
                                                                
                            <div class="form-check mb-2">
                                <input type="checkbox" class="form-check-input" id="exampleCheck1" name="check">
                              <label class="form-check-label mb-2" for="exampleCheck1" >Agree to Terms and Conditions</label>
                            </div>
                                
                            <button type="submit" class="btn btn-primary" style="background: #01579b">Sign Up</button>
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
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
        $(document).ready( function(){
          
        console.log("loaded");
        $('#reg-form').on('submit',function(event){
            event.preventDefault();
            
            let form = new FormData(this);
            
            $.ajax({
                url: "RegisterServlet",
                type: 'POST',
                data: form,
                success: function(data, textStatus, jqXHR) {
                    console.log(data);
                    if (data.trim() === 'done') {
                        swal("Registered Successfully!", "Login to continue :)")
                            .then((value) => {
                                window.location = "login.jsp";
                            });
                    } else {
                        swal("Something went wrong!", "Please try again!");
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
        

    </body>
</html>
