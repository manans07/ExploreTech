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
                <li class="nav-item active">
                                <%
                                   if(user==null) 
                                   {
                                %>        
                  <a class="nav-link" href="login.jsp"> Latest Tech Blogs</a>
                                <%
                                    }else
                                   {
                                %>    
                    <a class="nav-link" href="#" onclick="getBlogs(0)"> Latest Tech Blogs</a>
                                <%}%>
                </li>
                
                <li class="nav-item dropdown active">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Categories
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
<!--                    <a class="dropdown-item" href="#">Programming Language</a>
                    <a class="dropdown-item" href="#">Web Development</a>
                    <a class="dropdown-item" href="#">Android Development</a>
                    <a class="dropdown-item" href="#">Blockchain Development</a>
                    <a class="dropdown-item" href="#">Artificial Intelligence</a>
                    <a class="dropdown-item" href="#">Machine Learning</a>
                    <a class="dropdown-item" href="#">Data Science</a>-->
                    
                   <% 
                            BlogDAO b1 = new BlogDAO(ConnectionProvider.getConnection());
                            ArrayList<category> list1 = b1.getCategory();
                            
                            for(category c1:list1)
                                    {
                                   if(user==null) 
                                   {
                                %>        
                           <a href="login.jsp" class="dropdown-item" style="margin:0%;"> <%= c1.getCname() %> </a>
                                <%   
                                    } else{
                                %>
                                <a href="#" onclick="getBlogs(<%=c1.getCid()%>)" class="dropdown-item" style="margin:0%;"> <%= c1.getCname() %> </a>
                                <%
                                    }  }
                                %>
                            <div id="loader" style="display: none;">
                                <button class="btn btn-primary mt-4" style="background: #1a237e; margin-left: 35%;">
                                    <span class="spinner-border spinner-border-sm"></span>
                                    Loading..
                                </button>
                            </div>
                            
                  </div>
                </li>
                
                <li class="nav-item active">
                  <a class="nav-link" href="contact.jsp">Contact</a>
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
                 
                                                
          <div class="col-md-8">
                                <div class="container-fluid" id="blog-container">
                                    <!-- Blog content loaded by JavaScript will appear here -->
                                </div>
                            </div>
                                                
                                                
                                                
                                                
                                                
                                                
        <script>
          function getBlogs(catId){
                
                $("#loader").show();
                $("#blog_container").hide();
                
                
                
                
                $.ajax({
                    url: "load_blog.jsp",
                    method: 'GET',
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
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                