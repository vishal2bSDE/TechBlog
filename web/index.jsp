<%-- 
    Document   : index
    Created on : 18 Mar, 2020, 9:21:04 PM
    Author     : msvs
--%>

<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" ]
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 100% 0, 100% 100%, 70% 91%, 36% 100%, 0 90%, 0 0%);
            }
        </style>
    </head>
    <body>
       <!--navbar-->
       <%@include file="normal_navbar.jsp" %>
       
       <!--banner-->
       
       <div class="container-fluid m-0 p-0 banner-background">
           <div class="jumbotron primary-background text-white">
               <div class="container">
               <h3 class="display-3">Welcome to Tech Blog</h3>
               <p>Welcome to technical blog, world of technology. A programming language is a formal language, which comprises a set of instructions that produce various kinds of output. Programming languages are used in computer programming to implement algorithms.</p>
               <a href='register_page.jsp' class="btn btn-outline-light btn-lg"><span class='fa fa-user-plus'></span> Start! it's free</a>
               <a href='login_page.jsp' class="btn btn-outline-light btn-lg"><span class='fa fa-user-circle fa-spin'></span> Log in</a>
               </div>
           </div>
           
       </div>
       
       <!--cards-->
       <div class='container'>
           <div class='row'>
               <div class='col-md-4'>
                   <div class="card" style="width: 18rem;">
                        
                        <div class="card-body">
                          <h5 class="card-title">Java programming</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn btn-primary primary-background text-white">Read more</a>
                        </div>
                    </div>
               </div>
               <div class='col-md-4'>
                   <div class="card" style="width: 18rem;">
                        
                        <div class="card-body">
                          <h5 class="card-title">Java programming</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn btn-primary primary-background text-white">Read more</a>
                        </div>
                    </div>
               </div>
               <div class='col-md-4'>
                   <div class="card" style="width: 18rem;">
                        
                        <div class="card-body">
                          <h5 class="card-title">Java programming</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn btn-primary primary-background text-white">Read more</a>
                        </div>
                    </div>
               </div>
           </div>
           <br><br>
           <div class='row'>
               <div class='col-md-4'>
                   <div class="card" style="width: 18rem;">
                        
                        <div class="card-body">
                          <h5 class="card-title">Java programming</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn btn-primary primary-background text-white">Read more</a>
                        </div>
                    </div>
               </div>
               <div class='col-md-4'>
                   <div class="card" style="width: 18rem;">
                        
                        <div class="card-body">
                          <h5 class="card-title">Java programming</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn btn-primary primary-background text-white">Read more</a>
                        </div>
                    </div>
               </div>
               <div class='col-md-4'>
                   <div class="card" style="width: 18rem;">
                        
                        <div class="card-body">
                          <h5 class="card-title">Java programming</h5>
                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                          <a href="#" class="btn btn-primary primary-background text-white">Read more</a>
                        </div>
                    </div>
               </div>
           </div>
           <br>
       </div>
       <% 
            Connection con=ConnectionProvider.getConnection();
           
       %>
       <h1><%= con %></h1>
       <!--js-->
        <script
        src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
<!--        <script>
            $(document).ready(function(){
                alert("document loaded")
            })
        </script>-->
    </body>
</html>
