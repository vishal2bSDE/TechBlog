<%-- 
    Document   : login_page
    Created on : 20 Mar, 2020, 1:53:38 PM
    Author     : msvs
--%>

<%@page import="com.tech.blog.entities.Message"%>
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
        <title>Log In.</title>
    </head>
    <body>
        <!--navbar-->
        <%@include file="normal_navbar.jsp" %>
        
        <main class='d-flex align-items-center primary-background banner-background' style='height:70vh;'>
            <div class='container'>
                <div class='row'>
                    <div class='col-md-4 offset-md-4'>
                        <div class='card'>
                            <div class='card-header primary-background text-white text-center'>
                                <p class='fa fa-user-circle fa-2x'></p>
                                <p>Log In..</p>
                            </div>
                            <% 
                                Message m=(Message)session.getAttribute("msg");
                                if(m!=null){
                                    %>
                                    
                                    <div class="alert <%= m.getCssClass() %>" role="alert">
                                        <%= m.getContent() %>
                                    </div>
                                <%
                                    session.removeAttribute("msg");
                                }
                            %>
                            <div class='card-body'>
                                <form action="LoginServlet" method="POST">
                                    <div class="form-group">
                                      <label for="exampleInputEmail1">Email address</label>
                                      <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                      <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                      <label for="exampleInputPassword1">Password</label>
                                      <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                    <div class="form-check">
                                      <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                      <label class="form-check-label" for="exampleCheck1">keep me logged in.</label>
                                    </div>
                                    <div class="conatainer text-center">
                                    <button type="submit" class="btn btn-primary">LogIn</button>
                                    <a href='register_page.jsp' type="submit" class="btn btn-primary">Register</a>
                                    </div>
                                  </form>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </main>
        
        
        
        
        <script
        src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
