

<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="com.tech.blog.entities.user"%>
<%@page errorPage="error_page.jsp" %>
<%
//    parameter inside session.getAttribute("") will be the  session name provide by the firing servlet
    user user=(user)session.getAttribute("currentUser");
    if(user==null){
        response.sendRedirect("login_page.jsp");
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" ]
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 100% 0, 100% 100%, 70% 91%, 36% 100%, 0 90%, 0 0%);
            }
        </style>
        <title><%= user.getName() %></title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span> Tech blog</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
              <li class="nav-item active">
                  <a class="nav-link" href="#"><span class="fa fa-bell"></span> LearnCode with vishal <span class="sr-only">(current)</span></a>
              </li>

              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="fa fa-check-square-o"></span> Categories
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <a class="dropdown-item" href="#">Programming language</a>
                  <a class="dropdown-item" href="#">Project Implementation</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="#">Data Structure</a>
                </div>
              </li>
              <li class="nav-item">
                  <a class="nav-link" href="#"><span class="fa fa-address-card-o"></span> Contact us</a>
              </li>
              <li class="nav-item">
                  <a class="nav-link" href="#" data-toggle="modal" data-target="#do-post-modal"><span class="fa fa-quote-left"></span> Add Post </a>
              </li>
            </ul>
            <ul class="navbar-nav mr-right">
                <li class="nav-item">
                    <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span> 
                        <%= user.getName() %></a>
              </li>
                <li class="nav-item">
                  <a class="nav-link" href="LogoutServlet"><span class="fa fa-blind"></span> Log Out</a>
              </li>
            </ul>
        </div>
    </nav>
              
              <% 
                                Message m=(Message)session.getAttribute("msg");
                                if(m!=null){
                                    %>
                                    
                                    <div class="alert <%= m.getCssClass() %>" role="alert">
                                        <div class="text-center">
                                            <%= m.getContent() %></div>
                                    </div>
                                <%
                                    session.removeAttribute("msg");
                                }
                            %>
        <!--main body of the page-->
        <main>
            <div class="container">
                <div class="row mt-4">
                    <!--first col-->
                    <div class="col-md-4">
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0,this)" class="c-link list-group-item list-group-item-action active">
                              All Posts
                            </a>
                            
                            <!--dynamically fetched category-->
                            <% 
                                PostDao d=new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1=d.getAllCategories();
                                for(Category cc:list1){
                                    %>
                                    <a href="#" onclick="getPosts(<%= cc.getCid()%>,this)" class="c-link list-group-item list-group-item-action" value="<%= cc.getCid() %>"><%= cc.getName() %></a>
                                    <%
                                }
                            %>
                            </div>
                    </div>
                    <!--second col-->
                    <div class="col-md-8"><!--we are not using id here becoz the content inside it gets overwrite as soon as the ajax return html from other jsp-->
                        <div class="container text-center " id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin " ></i>
                            <h3 class="mt-3">loading...</h3>                    
                        </div>
                        <div class="container-fluid" id="post-container"><!--to solve the above overwrite problem we are using another block-->
                                
                        </div>
                    </div>
                </div>
            </div>
        </main>
   <!--modal-section-->
 <!--profile-modal-->

<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content ">
      <div class=" container modal-header primary-background text-white">
       <%-- <h5 class="modal-title" id="exampleModalLabel"><%= user.getName() %></h5>--%>
       <h5 class="modal-title" id="exampleModalLabel">Tech Soft</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="conatainer text-center">
              <%--<%= user.getProfile()//to get profile picture %>--%> 
              <%--<img src="pics/<%= user.getProfile()%>" >--%> 
              <img src="pics/<%=user.getProfile()%>" class="img-fluid" style="border-radius:50%; height:150px; width:150px;">
              <br>
                <h5 class="modal-title" id="exampleModalLabel"><%= user.getName() %></h5>
                <!--rigid profile details-->
                <div id="profile-detail">
                <table class="table">
                    <tbody>
                      <tr>
                        <th scope="row">ID</th>
                        <td><%= user.getId() %></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">e-mail</th>
                        <td><%=user.getEmail()%></td>
                       
                      </tr>
                      <tr>
                        <th scope="row">gender</th>
                        <td><%= user.getGender() %></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">about</th>
                        <td><%= user.getAbout() %></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">reg date</th>
                        <td><%= user.getDatetime() %></td>
                        
                      </tr>
                    </tbody>
                    
                </table>
                </div>
                      <!--editable profile details-->
                <div id="profile-edit" style="display: none;">
                    <h3 class="mt-2">Editing Section</h3>
                    <!--enctype is set to multipart/form-data becoz the form contains image/audio/video type of data-->
                    <form action="EditServlet" method="post" enctype="multipart/form-data">
                        <table class="table">
                            <tr>
                                <td>ID :</td> 
                                <td><%= user.getId() %></td>
                            </tr>
                            <tr>
                                <td>email :</td>
                                <td><input type="email"  class="form-control" name="user_email" value="<%=user.getEmail()%>"></td>
                            </tr>
                      
                            <tr>
                                <td>password :</td>
                                <td><input type="text"  class="form-control" name="user_password" value="<%= user.getPassword()%>"></td>
                            </tr>
                            <tr>
                                <td>gender :</td>
                                <td><%= user.getGender() %></td>
                            </tr>
                            <tr>
                                <td>about :</td>
                                <td><textarea rows="3" class="form-control" name="user_about"><%= user.getAbout()%></textarea>
                                </td>
                            </tr>                           
                            <tr>
                                <td>change profile:</td>
                                <td><input type="file" name="image" class="form-control">
                                </td>
                            </tr>                                 
                        </table>
                        <div class="conatainer">
                                <button type="submit" class="btn btn-outline-primary">save</button>
                        </div>
                    </form>
                </div>
            </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="edit-profile-button" class="btn btn-primary primary-background">Edit</button>
      </div>
    </div>
  </div>
</div>
        
       <!--post-modal-->
    
<div class="modal fade" id="do-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add a new Post</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form id='add-post-form' action="AddPostServlet" method="post">
              <div class='mb-2 form-group'>
                  <select class='form-control' name='cid' >
                      <option selected disabled>----Select Category----</option>
                      <% 
                        PostDao postd=new PostDao(ConnectionProvider.getConnection());
                        ArrayList<Category> list=postd.getAllCategories();
                        for(Category c: list){
                            %>
                            <option value='<%= c.getCid() %>'><%= c.getName() %></option>
                            <%
                        }
                      %>
                      
                    
                  </select>
              </div>
              <div class="form-group" >
                  <input type="text" required name='pTitle' placeholder="Title" class="form-control"/>
              </div>
              <div class="form-group" >
                  <textarea required class="form-control" name='pContent' style="height:100px;" placeholder="Content"></textarea>
              </div>
              <div class="form-group">
                  <textarea class="form-control" name='pCode' style="height:100px;" placeholder="/code.write()"></textarea>
              </div>
              <div class="form-group">
                  <input type="file" name='pic'/><br>
                  <label>Related picture</label>
              </div>
                      <div class='conatainer text-center'>
                          <button type='submit' class='btn btn-outline-primary'>Post</button>
                      </div>
          </form>
      </div>
       
    </div>
  </div>
</div>
       
                      
        <script
        src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script>
            $(document).ready(function(){
//               alert("testing" );
                    let editStatus=false;
                $("#edit-profile-button").click(function(){
                    if(!editStatus){
                        $("#profile-detail").hide();
                        $("#profile-edit").show();
                        editStatus=true;
                        $(this).text("Back");
                    }else{
                         $("#profile-detail").show();
                        $("#profile-edit").hide();
                        editStatus=false;$(this).text("Edit");
                    }
                });
            });
        </script>
        <!--add-post-form jss-->
        <script>
            $(document).ready(function(e){
                $("#add-post-form").on("submit",function(event){
//                   this section executes when post form  gets submitted
                    console.log("submitted");
                    event.preventDefault();
                    let form=new FormData(this);
//                    now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: "post",
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            if(data.trim()=='done')
                                swal("Good job!", "post added successfully", "success");
                            else
                                swal("error", "something went wrong", "error");
                            console.log(data);
                    },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("error", "something went wrong", "error");
                    }  ,
                        processData: false,
                        contentType: false  //processData and contentType should always be put to false otherwise multimedia kind of file cant be send
                    })
                });
            });
        </script>
        <!--loading post-->
        <script>
            function getPosts(catId,temp){
                $("#loader").show();
                $(".c-link").removeClass("active");
                $("#post-container").hide();
                 $.ajax({
                  url: "load_posts.jsp" ,
//                  sending this data ob to servlet
                  data: {cid:catId},
                  success: function(data, textStatus, jqXHR){
                    console.log(data)  ;
                    $("#loader").hide();
                     $("#post-container").show();
                    $("#post-container").html(data);
                    $(temp).addClass("active");
                  }
               });
            }
            
            $(document).ready(function(e){
              let allPostRef=$(".c-link")[0];
               getPosts(0,allPostRef);
               
            });
        </script>
    </body>
                                        
</html>
