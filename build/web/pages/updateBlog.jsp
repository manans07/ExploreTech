<%-- 
    Document   : updateBlog
    Created on : 08-Oct-2023, 1:01:13 pm
    Author     : DELL
--%>

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
    int  b1 = Integer.parseInt(request.getParameter("blog1"));
    BlogDAO b = new BlogDAO(ConnectionProvider.getConnection());
    
    blog Blog  = b.getBlogDetailsById(b1);
%>

        
            <div data-toggle="modal" data-target="#update-blog-modal">Click Here To Update</div>
        <!--Update Blog Modal Begins-->
            
                                <div class="modal fade" id="update-blog-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                  <div class="modal-content">
                                    <div class="modal-header" style="background-color: #1a237e;">
                                      <h5 class="modal-title text-white"  id="exampleModalLabel">Update Blog</h5>
                                      <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                      </button>
                                    </div>
                                    <div class="modal-body">

                                        <form id="update-blog-form" action="UpdateBlogServlet" method="POST" enctype="multipart/form-data">

                                            <div class="form-group ">                                    
                                                
                                                    <div class="btn-group">
                                                        <label  class="btn text-white mr-1" style="background-color: #1a237e; border-radius: 5px;;">Blog Category</label>

                                                        <select name="category" class="form-control">

                                                              <option  selected ><%= b.getCategoryNameByCatId(Blog.getCat_id()) %></option>
                                                              </select>
                                                    </div>
                                            </div>
                                            
                                            <div class="form-group" style="display:none;">
                                                <input type="text" name="bid" class="form-control" value="<%=Blog.getId()%>"/>
                              
                                            </div>


                                            <div class="form-group">

                                                <input type="text" name="title" placeholder="Blog Title" class="form-control" value="<%=Blog.getTitle()%>"/>

                                            </div>


                                            <div class="form-group">
                                                <textarea name="content" class="form-control" style="height: 150px;" placeholder="Blog Content"><%=Blog.getContent()%></textarea>                              
                                            </div>


                                            <div class="form-group">
                                                <textarea name="code" class="form-control" style="height: 100px;" placeholder="Program Code (If Any)"><%=Blog.getCode()%></textarea>                              
                                            </div>
                                            
                                           
                                            
                                            
                                            <div class="form-group ">
                                                <label>Uploaded Picture</label>
                                                <input name="picture1" type="radio" value="<%= Blog.getPicture()  %>" > 
                                                <label for="picture1" > Previous</label> 
                                                <input name="picture1" type="radio" value="" > 
                                                <label for="picture1" > Default</label>
                                            </div> 
                                            
                                            <div class="form-group">
                                            <label>Upload New Picture: </label> 
                                            <input type="file" name="picture">
                                            </div> 


                                            <div class="modal-footer">
                                              <a href="myblogs.jsp" class="btn btn-secondary" data-dismiss="modal">Close</a>
                                                        <button type="submit" class="btn" style="background-color: #01579b ; color: white;">Update</button>
                                            </div>
                                            </form>

                                        </div>

                                      </div>
                                    </div>
                                  </div>
                                <!--Update Blog Modal Ends-->
                                
                    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
                    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                    <script src="js/script.js" type="text/javascript"></script>

                    
                    <script> 
                                    <script>
            
            $(document).ready(function() {
                $("#update-blog-form").on("submit", function(event) {
                    // This submit will be called when the submit button is clicked.
                    event.preventDefault();
                    console.log("clicked on submit");
                    let form = new FormData(this);

                    // Requesting to the server
                    $.ajax({
                        url: "UpdateBlogServlet",
                        type: 'POST',
                        data: form,
                        success: function(data, textStatus, jqXHR) {
                            console.log(data);
                            if (data.trim() === 'done') {
                                swal("Great Job! :)","Blog Updated Successfully!","success")
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