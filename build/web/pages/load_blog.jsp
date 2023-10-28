<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.message"%>
<%@page import="com.tech.blog.entities.blog"%>
<%@page import="com.tech.blog.entities.category"%>
<%@page import="com.tech.blog.dao.BlogDAO"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="jakarta.servlet.annotation.MultipartConfig"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.dao.LikeDAO"%>

<%
                        User user = (User) session.getAttribute("current");
                    if(user == null)
                    {
                        response.sendRedirect("login.jsp");
                    }


%>



<div class="row">
<%
    BlogDAO d = new BlogDAO(ConnectionProvider.getConnection());
    
    int cid = Integer.parseInt(request.getParameter("Cat_Id"));
    
    
    ArrayList<blog> list = new ArrayList<>();
    
    if(cid == 0)
    {
        list = d.getAllBlogs();
        }else{
        list = d.getBlogsByCat(cid);
    }
    
    if(list.size() == 0)
    {
        out.println("<h5 class='display-4 text-center mt-4'> No Blogs are created yet for this category! Be the first one to post! :)</h5>");
        }
    
        else{
    for(blog Blog:list)
    {
        
         
   %>
   
                <div class="col-md-6 mt-4">
                      
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
                                </div>
                    </div>  
                </div>
   

     <%
        }}
%>

</div>







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
                           if(data.trim() != null)
                           {
                               let c = $(".like-counter").html();
                               c++;
                               $('.like-counter').html(c);
                           }
                               
                               
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(data);
                    }
            
                });
            
    
    }
        </script>
