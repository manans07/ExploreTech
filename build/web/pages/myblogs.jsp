<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.message"%>
<%@page import="com.tech.blog.entities.blog"%>
<%@page import="com.tech.blog.entities.category"%>
<%@page import="com.tech.blog.helper.helper"%>
<%@page import="com.tech.blog.servlets.ProfilePictureServlet"%>
<%@page import="java.io.File"%>
<%@page import="com.tech.blog.dao.BlogDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.dao.LikeDAO"%>



    
    <%
     User u1 = (User) session.getAttribute("current");
     if(u1==null)
     {
        response.sendRedirect("index.jsp");
        }
        
      BlogDAO d = new BlogDAO(ConnectionProvider.getConnection());
%>




<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Blogs|<%= u1.getName()%> </title>
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="icon" type="image/png" href="https://clipground.com/images/codepen-logo-8.png"/>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <style>
            .banner-clip{
                
            clip-path: polygon(50% 0%, 100% 0, 100% 83%, 50% 100%, 0 84%, 0 0);
                
                
            }
        </style>

    </head>
 
    <body style="background-color: #eee;">
        
        
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
                  <a class="nav-link" href="contact.jsp">Contact</a>
                </li> 
                <li class="nav-item active">
                    <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal" > <span class="fa fa-plus-square-o"> </span>  Create New Blog</a>
                </li> 
              
              
              </ul>

           <ul class="nav-bar nav mr-right ">

                    <li class="nav-item">
                                <a class="nav-link text-white" href="#!" data-toggle="modal" data-target="#profile-modal"> <span class="fa fa-user-circle"></span> <%= u1.getName() %> </a>
                                </li>

                        <li class="nav-item">
                                      <a class="nav-link text-white" href="LogoutServlet">
                                             <span>
                                          <i class="fa fa-sign-in " aria-hidden="true"></i>
                                          </span>   
                                          Log Out</a>
                                </li></ul>

                            </div>
            </nav>

            <!--End of nav-bar-->

            
            <!--Create Blog Modal-->
            <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header" style="background-color: #1a237e;">
                  <h5 class="modal-title text-white"  id="exampleModalLabel">Create New Blog</h5>
                  <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  
                    
                    <form id="add-blog" action="AddBlogServlet" method="POST" enctype="multipart/form-data">
                        
                        <div class="form-group ">                                    
                            <div class="btn-group">
                                <button type="button" class="btn text-white mr-1" style="background-color: #1a237e; border-radius: 5px;;">Blog Category</button>
                                    
                                <select name="category" class="form-control">
                                    
                                      <option  selected disabled >Select Category</option>
                                      
                                      <% 
                                         ArrayList<category> list1 = d.getCategory();
                                            
                                         for(category c:list1)
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
                              <img src="pics/<%= u1.getProfile()%>"   style="border-radius: 50%; max-width: 150px; margin-bottom: 20px;"/>
                               <h5  id="exampleModalLabel" style="font-family: Arial"> <%= u1.getName() %> </h5> 
                               
                               <div id="profile-details">
                               <table class="table">
                                <tbody>
                                      <tr>
                                          <th scope="row"> User ID </th>  
                                        <td><%= u1.getId()%> </td>
                                      </tr>
                                      
                                      <tr>
                                          <th scope="row"> Email </th>  
                                          <td><%= u1.getEmail()%> </td>
                                      </tr>
                                      
                                      <tr>
                                          <th scope="row"> Gender </th>  
                                          <td><%= u1.getGender()%> </td>
                                      </tr>
                                      
                                      
                                      <tr>
                                          <th scope="row"> Registration Date and Time</th>  
                                          <td><%= u1.getReg_date().toString() %> </td>
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
                                       <%= u1.getId()%>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th scope="row">Email </th>
                                    <td> 
                                        <input type="email" class="form-control" name="email" value="<%= u1.getEmail()%>" > 
                                    </td>
                                </tr>
                        
                                <tr>
                                    <th scope="row">Name </th>
                                    <td> 
                                        <input type="text" class="form-control" name="name" value="<%= u1.getName()%>" > 
                                    </td>
                                </tr>
                        
                                <tr>
                                    <th scope="row">Password</th>
                                    <td> 
                                        <input type="text" class="form-control" name="password" value="<%= u1.getPassword()%>" > 
                                    </td>
                                </tr>
                                
                                <tr>
                                    <th scope="row">Gender</th>
                                    <td> 
                                       <%= u1.getGender().toUpperCase()%>
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

            
            
            <section>
                    <div class="container mt-5"  >
                      

                        <div class="row">
                        <div class="col-lg-4">
                          <div class="card mb-4">
                            <div class="card-body text-center">
                                                              
                              <img src="pics/<%= u1.getProfile()%>"  alt="avatar"
                                class="rounded-circle img-fluid" style="width: 150px;">
                              <h5 class="my-3"><%=u1.getName()%></h5>
                              
                              
                              <hr>
                              <div class="row">
                                <div class="col-sm-3">
                                  <p class="mb-0">Email</p>
                                </div>
                                <div class="col-sm-9">
                                  <p class="text-muted mb-0"><%=u1.getEmail()%></p>
                                </div>
                              </div>
                              <hr>
                              <div class="row">
                                <div class="col-sm-3">
                                  <p class="mb-0">Gender</p>
                                </div>
                                <div class="col-sm-9">
                                  <p class="text-muted mb-0"><%=u1.getGender()%></p>
                                </div>
                              </div>
                              
                              <hr>
                              <div class="row">
                                <div class="col-sm-3">
                                  <p class="mb-0">Total Blogs</p>
                                </div>
                                <div class="col-sm-9">
                                  <p class="text-muted mb-0"><%=d.getBlogCountByUserId(u1.getId()) %></p>
                                </div>
                              </div>
                            </div>
                          </div>
                                <button class="text-center" id="update1"> Click here to update</button>   
                          </div>
                     
                                
                                
                         
                          <div class="col-lg-8">
                              
                                          <%
                

                ArrayList<blog> list = new ArrayList<>();
                
                list = d.getBlogsByUserId(u1.getId());

                if(list.size() == 0)
                {
                    out.println("<h5 class='display-4 text-center mt-4'> No Blogs are created by you! Create one and share your knowledge! :)</h5>");
                    }

                    else{
                for(blog Blog:list)
                {


               %>
   
               <div class="col-md-10 mb-4" style="border-radius: 5px;">
                      
                    <div class="card">
                                
                        
                                    <% if(Blog.getPicture() == null) {
                                      %>
                                      <img src="blog_pictures/<%=Blog.getPicture()%>"/>
                                      
                                    <%} else{
                                      %> 
                                        <img src="img/<%=d.getCategoryNameByCatId(Blog.getCat_id())%>.gif"/>
                                    <%}%>
                        
                                    

                                      <div class="card-body">
                                      <h5 class="card-title"><%= Blog.getTitle()%></h5>
                                      <p> <%= Blog.getContent()%>  </p>                              
                                      </div>

                                      <div class="card-footer text-center">

                                      <a href="show_blog.jsp?blog_id=<%=Blog.getId() %>" class="btn btn-primary " style="background: #01579b">Read More</a>
                                      
                                      <a href="#"  onclick="updateBlog(<%=Blog.getId()%>)"  class="btn btn-primary " style="background: #01579b"><span class="fa fa-pencil-square-o"> </span></a>
                                      <a href="#" onclick="DeleteBlog(<%=Blog.getId()%>)" class="btn btn-primary " style="background: #01579b"><span class="fa fa-trash-o"> </span></a>
                                      
                                      </div>    
                                      
                                    </div>  
                                      
                                </div>
                                
                                 
                       <%}}%>
                                    
                       </div>
                       
                       </div>        
                            
                    </div>                                
                  </section> 
            <!--Blog container-->
                
            
            
            
            
            

        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="js/script.js" type="text/javascript"></script>
            
            
            
        <script>
            function DeleteBlog(bid) {
                console.log(bid);
                const d = {
                    bid:bid
                };
                swal({
                        title: "Are you sure?",
                        text: "Once deleted, you will not be able to recover this imaginary file!",
                        icon: "warning",
                        buttons: true,
                        dangerMode: true
                      })
                      .then((willDelete) => {
                            
                            if (willDelete) {
                            $.ajax({
                                url: "DeleteBlogServlet",
                                data: d,
                                success: function(data, textStatus, jqXHR) {
                                       console.log(data);
                                       if(data.trim() == 'deleted')
                                       {
                                           swal("Blog Deleted Successfully!",{icon:"success"});
                                       }else{
                                           swal("Blog Deleted Successfully!",{icon:"error"});
                                       }   
                                },
                                error: function (jqXHR, textStatus, errorThrown) {
                                    console.log(data);
                                }

                            }); }
                            else{
                                
                            }
                        }).then(
                            setTimeout(() => {
                            document.location.reload();
                          }, 3000)
                        );
                }
        </script>
        
        
        
        <script>
            
            $("#update1").hide();
            
            function updateBlog(Blog){
                
                
                
                $.ajax({
                    url: "updateBlog.jsp",
                    method: 'POST',
                    data: {blog1:Blog},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);

                        $("#update1").show();
                        $("#update1").html(data);
                        
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.error("AJAX Error: " + textStatus, errorThrown);
                    }
                });    

            }            

        </script>
        

            
            

        
        
        
    </body>
</html>
