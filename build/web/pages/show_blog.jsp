<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.message"%>
<%@page import="com.tech.blog.entities.blog"%>
<%@page import="com.tech.blog.entities.category"%>
<%@page import="com.tech.blog.dao.BlogDAO"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.dao.LikeDAO"%>


<% 
                    User user = (User) session.getAttribute("current");
                    if(user == null)
                    {
                        response.sendRedirect("login.jsp");
                    }
                    
                    String res = request.getParameter("blog_id");
                    int bId = Integer.parseInt(res.trim());
                    
                    BlogDAO dao = new BlogDAO(ConnectionProvider.getConnection());
                    blog b1 = dao.getBlogDetailsById(bId);
                    
                    final int Uid = b1.getUserId();
                    String username = dao.getUserNameByUserId(b1.getUserId());
%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> <%=b1.getTitle()%>|ExploreTech</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="icon" type="image/png" href="https://clipground.com/images/codepen-logo-8.png"/>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <style>
            .banner-clip{
            clip-path: polygon(50% 0%, 100% 0, 100% 83%, 50% 100%, 0 84%, 0 0);}
            
            .blog-date{
                font-style: italic;
            }
            
            .blog-content{
                font-weight: 100;
            }
            
            
        </style>
        
        
        
        
        
    </head>
    <body>
        
        <div id="fb-root"></div>
        <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v18.0" nonce="cm082bxl"></script>
        
        <!--Start of nav-bar-->
        
        <nav class="navbar navbar-expand-lg navbar-dark"  style="background-color: #1a237e;"/>
            <a class="navbar-brand" href="#"> <span class="fa fa-codepen"> </span>  ExploreTech</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between" id="navbarNavDropdown">
              <ul class="navbar-nav">
                <li class="nav-item active">
                  <a class="nav-link" href="profile.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="#" onclick="getBlogs(0)"> Latest Tech Blogs</a>
                </li>
                
                <li class="nav-item dropdown active">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Categories
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                   <% 
                            BlogDAO b2 = new BlogDAO(ConnectionProvider.getConnection());
                            ArrayList<category> list2 = b2.getCategory();
                            
                            for(category c1:list2)
                                    {
                                        
                                %>        
                           <a href="#" onclick="getBlogs(<%=c1.getCid()%>)" class="dropdown-item" style="margin:0%;"> <%= c1.getCname() %> </a>
                                <%   
                                    } 
                                %>
                                

                  </div>
                  
                </li>
                
                <li class="nav-item active">
                  <a class="nav-link" href="#">Contact</a>
                </li> 
                <li class="nav-item active">
                    <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal" > <span class="fa fa-plus-square-o"> </span>  Create New Blog</a>
                </li> 
                
              </ul>

<!--            <form class="form-inline">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success text-white" type="submit">Search</button>
            </form>-->
                <ul class="nav-bar nav mr-right ">
            
                    <li class="nav-item">
                        <a class="nav-link text-white" href="#!" data-toggle="modal" data-target="#profile-modal"> <span class="fa fa-user-circle"></span> <%= user.getName() %> </a>
                        </li>

                    <li class="nav-item">
                              <a class="nav-link text-white" href="LogoutServlet">
                                  <span>
                                  <i class="fa fa-sign-in " aria-hidden="true"></i>
                                  </span>   
                                  Log Out</a>
                        </li>
                </ul>

            </div>

          </nav>
        
         <!--End of nav-bar-->
                
        
        
                  <!--Profile Modal-->
          
          <!-- Button trigger modal -->
<!--                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#profile-modal">
                  Launch demo modal
                </button>-->

                <!-- Modal -->
                <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color: #1a237e;">
                        <h5 class="text-white " id="exampleModalLabel">ExploreTech</h5>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                          
                          <div class="container  text-center">
                              <img src="pics/<%= user.getProfile()%>"   style="border-radius: 50%; max-width: 150px; margin-bottom: 20px;"/>
                               <h5  id="exampleModalLabel" style="font-family: Arial"> <%= user.getName() %> </h5> 
                               
                               <div id="profile-details">
                               <table class="table">
                                <tbody>
                                      <tr>
                                          <th scope="row"> User ID </th>  
                                        <td><%= user.getId()%> </td>
                                      </tr>
                                      
                                      <tr>
                                          <th scope="row"> Email </th>  
                                          <td><%= user.getEmail()%> </td>
                                      </tr>
                                      
                                      <tr>
                                          <th scope="row"> Gender </th>  
                                          <td><%= user.getGender()%> </td>
                                      </tr>
                                      
                                      
                                      <tr>
                                          <th scope="row"> Registration Date and Time</th>  
                                          <td><%= user.getReg_date().toString() %> </td>
                                      </tr>                                      
                                      
                                    </tbody>
                                  </table>
                               </div>
                          </div>
                          
                    <div id="profile-edit" style="display: none;" >

                        <h5 class="mt-2 text-center" style="" >Edit Details</h5>
                        
                        <form action="EditServlet" method="POST" class="form-group text-center" enctype="multipart/form-data">
                            <table class="table">
                                <tbody>
                                <tr>
                                    <th scope="row" >User ID </th>
                                    <td> 
                                       <%= user.getId()%>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th scope="row">Email </th>
                                    <td> 
                                        <input type="email" class="form-control" name="email" value="<%= user.getEmail()%>" > 
                                    </td>
                                </tr>
                        
                                <tr>
                                    <th scope="row">Name </th>
                                    <td> 
                                        <input type="text" class="form-control" name="name" value="<%= user.getName()%>" > 
                                    </td>
                                </tr>
                        
                                <tr>
                                    <th scope="row">Password</th>
                                    <td> 
                                        <input type="text" class="form-control" name="password" value="<%= user.getPassword()%>" > 
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th scope="row">Gender</th>
                                    <td> 
                                       <%= user.getGender().toUpperCase()%>
                                    </td>

                                </tr>     
                                
                                <tr>
                                    <th scope="row">Profile Picture</th>
                                    <td> 
                                        <input type="file" class="form-control" name="profile" > 
                                    </td>

                                </tr>     
                                </tbody>     
                            </table>
                          
                                    <button type="submit" class="btn" style="background-color: #01579b ; color: white;">
                                        Save
                                    </button>
                                    
                                    
                            
                        </form>
                        
                        
                    </div>
                      </div>
                                      
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-button" type="button" class="btn btn-primary" style="background-color: #1a237e;">Edit</button>
                      </div>
          <!--Profile Edit-->
          
                </div>
                    </div>
                  </div>

          <!--End of Profile Modal-->
          

          <!-- Modal -->
          <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header" style="background-color: #1a237e;">
                  <h5 class="modal-title text-white"  id="exampleModalLabel" data-toggle="modal" data-target="#add-post-modal"   >Create New Blog</h5>
                  <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  
                    
                    <form id="add-blog" action="AddBlogServlet" method="POST" enctype="multipart/form-data">
                        
                        
                        <div class="form-group ">                            
<!--                            <select>
                                <option class="dropdown-item" >Programming Language</option>                                 
                                <a class="dropdown-item" href="#">Web Development</a>
                                <a class="dropdown-item" href="#">Android Development</a>
                                <a class="dropdown-item" href="#">Blockchain Development</a>
                                <a class="dropdown-item" href="#">Artificial Intelligence</a>
                                <a class="dropdown-item" href="#">Machine Learning</a>
                                <a class="dropdown-item" href="#">Data Science</a>
                            </select>-->
                            
                            <div class="btn-group">
                                <button type="button" class="btn text-white mr-1" style="background-color: #1a237e; border-radius: 5px;;">Blog Category</button>
                                    
                                <select name="category" class="form-control">
                                    
                                      <option  selected disabled >Select Category</option>
                                      
                                      <% BlogDAO b = new BlogDAO(ConnectionProvider.getConnection());
                                         ArrayList<category> list = b.getCategory();
                                            
                                         for(category c:list)
                                         {
                                      
                                      %>
                                            <option class="dropdown-item" value="<%= c.getCid()%>" > <%= c.getCname() %> </option>
                                      
                                            <% 
                                          
                                          } %>
                                      </select>
                            </div>

                        </div>
                        
                              
                        <div class="form-group">
                            
                            <input type="text" name="title" placeholder="Blog Title" class="form-control"/>
                                
                        </div>
                        
                        
                        <div class="form-group">
                            <textarea name="content" class="form-control" style="height: 150px;" placeholder="Blog Content"></textarea>                              
                        </div>
                        
                        <div class="form-group">
                            <textarea name="code" class="form-control" style="height: 100px;" placeholder="Program Code (If Any)"></textarea>                              
                        </div>
                        
                        
                        <div class="form-group">
                            <label>Upload Picture (If Any)</label> 
                            <br>
                            <input type="file" name="picture">
                        </div>
              
                    
                    
                    
                        
                        <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn" style="background-color: #01579b ; color: white;">Create</button>
                        </div>
                </form>
                </div>
                                          
              </div>
            </div>
          </div>
           
          
          
          
          
        <!--Start of Blog Section-->
            
        <div class="container">
            
            <div class="row">
                
                <div class="col-md-6 offset-md-4 mt-4">
                    
                    <div class="card">
                    
                        <div class="card-header" style="background: #1a237e;">
                        
                            <h4 class="text-center text-white " style="font-family:Arial; margin-top: 10px;">
                                <%= b1.getTitle()%>
                            </h4>
                        
                        </div>
                            
                         <% if(b1.getPicture().length() > 0 ) {
                              %> 
                              <img src="blog_pictures/<%=b1.getPicture()%>" />
                            <%}%><% else{
                              %> 
                              <img src="img/<%=dao.getCategoryNameByCatId(b1.getCat_id())%>.gif"/>
                            <%}%>
                            
                            <div class="row mx-0 pt-2" style="background:#f8f9fa; border-bottom: black; size: 100%;">
                                <div class="col-md-7">
                                    <p>Posted by <a href="UserpageServlet" name="key1" value="<%=Uid%>"> <%= username %> </a>    </p>
                                </div>
                                <div class="col-md-5 blog-date">
                                    <p> <%= b1.getBdate().toLocaleString() %> </p>
                                </div>
                                
                            </div>
                        <div class="card-body">
                            
                            <p class="blog-content">
                                <%= b1.getContent()%>
                            </p>
                            
                            <br>
                            <br>
                            
                            <%
                            if(b1.getCode().length()>0)
                            {%>
                                
                            <h6>Code</h6>
                            <div style="background:#eeeeee">
                            <p>
                                 <%= b1.getCode()%>
                            </p>
                            </div>
                            <%
                                }
                            %>
                            
                        </div>
                        
                        <div class="card-footer">
                            
                            <%
                                LikeDAO ld = new LikeDAO(ConnectionProvider.getConnection());
                            %>
                            
                            <a href="#" class="btn btn-primary" style="background: #01579b" onclick="doLike(<%=b1.getId()%>,<%=user.getId()%>,this)" id="like"><i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ld.countLike(b1.getId())%></span> </a>
                              <a href="#" class="btn btn-primary" style="background: #01579b"><i class="fa fas fa-comment"></i> <span>5</span> </a>

                        </div>
                            
                        <div>
                        
                            
                              <div class="fb-comments" data-href="http://localhost:8080/ExploreTech/show_blog.jsp?blog_id=10#" data-width="" data-numposts="5"></div>
                        </div>
                            
                        
                    </div>                    
                </div>

            </div>
        </div>
        
  
        <!--End of Blog Section-->
        
        
        <div class="col-md-8 container">
                            <div class="container-fluid" id="blog-container">
                                <!-- Blog content loaded by JavaScript will appear here -->
                            </div>
        </div>
        
        
        
        
        
        
        
        
        
        
          
<!--        
            <%= user.getName() %>
            <br>
            <%= user.getEmail() %>
            <br>
            -->
            

        <!--<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>-->
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="js/script.js" type="text/javascript"></script>
        <!-- Include Bootstrap JavaScript and its dependencies -->
<!--        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        -->
        
        
        
        
        <script>
            
            $(document).ready(function(){
                
                let editStatus = false;
                
                
                $('#edit-profile-button').click(function() {
//                      alert("button clicked");
                        
                        if (editStatus === false) {
                            
                            $("#profile-details").hide();
                            $("#profile-edit").show();
                            editStatus = true;
                            
                            $(this).text("Back");
    
                        }else {
                            $("#profile-edit").hide();
                            $("#profile-details").show();
                            $(this).text("Edit");
                            editStatus = false;
                            
                            
                        }

                    
                });
             });
            
            
            
            
        </script>
        
        
        
        
        <!--Script for creating a blog-->
        <script>
            
            $(document).ready(function() {
                $("#add-blog").on("submit", function(event) {
                    // This submit will be called when the submit button is clicked.
                    event.preventDefault();
                    console.log("clicked on submit");
                    let form = new FormData(this);

                    // Requesting to the server
                    $.ajax({
                        url: "AddBlogServlet",
                        type: 'POST',
                        data: form,
                        success: function(data, textStatus, jqXHR) {
                            console.log(data);
                            if (data.trim() === 'done') {
                                swal("Great Job! :)","Blog Created Successfully!","success")
                                .then((value) => {
                                window.location = "profile.jsp";
                                    });
                                    }
                             else {
                                swal("Something went wrong!", "Please try again!","error");
                            }
                        },
                        error: function(jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR);
                            swal("Something went wrong!", "Please try again!","error");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });

            

        </script>
        
        <script>
            function doLike(bid,userid) {
                console.log(bid+","+userid);
                const d = {
                    bid:bid,
                    userid:userid,
                    operation:'like'
                };
                
                $.ajax({
                    
                    url: "LikeServlet",
                    data: d,
                    success: function(data, textStatus, jqXHR) {
                           console.log(data);
                           if(data.trim() == 'LIKED')
                           {
                               let c = $(".like-counter").html();
                               c++;
                               $('.like-counter').html(c);
                           }else{
                               swal("Already Liked! :)");
                           }
                               
                               
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(data);
                    }
            
                });
            
    
    }
        </script>
        
        
                <script>
          function getBlogs(catId){
                
                $("#loader").show();
                $("#blog_container").hide();
                
                
                
                
                $.ajax({
                    url: "load_blog.jsp",
                    method: 'BLOG',
                    data: {Cat_Id:catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $("#blog_container").show();
                        $("#blog-container").html(data);
                        
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.error("AJAX Error: " + textStatus, errorThrown);
                    }
                });
                
                
                
                
            }
            
            
            
            
            
        </script>
        
        
        <script>
            
         
        function goToUserPage(userId){
                
                console.log(userId);
               
                $.ajax({
                    url: 'UserpageServlet',
                    method: 'POST',
                    data: userId,
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.error("AJAX Error: " + textStatus, errorThrown);
                    }
                });
                
            } 
            
            
            
            
        </script>
        

        
    </body>
</html>
