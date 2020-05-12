<%-- 
    Document   : register_page
    Created on : 20 Mar, 2020, 2:19:08 PM
    Author     : msvs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
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
        
        <main class='banner-background primary-background' style='padding-bottom: 50px;'>
            <%@include file="normal_navbar.jsp" %>
            <div class='container '>
                <div class='col-md-6 offset-md-3'>
                    <div class='card m-5'>
                        <div class='card-header text-center primary-background text-white'>
                            <p class='fa fa-user-plus fa-2x' ></p>
                            <p>Register</p>
                        </div>
                        <div class='card-body'>
                            <form id="reg-form" action="RegisterServlet" method="POST">
                                <div class="form-group">
                                  <label for="user_name">New User</label>
                                  <input name="user_name" type="text" class="form-control" id="userName" aria-describedby="emailHelp" placeholder="Enter name">
                                  
                                </div>
                                <div class="form-group">
                                  <label for="exampleInputEmail1">Email address</label>
                                  <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                  <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                  <label for="exampleInputPassword1">Password</label>
                                  <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <div class="form-group">
                                  <label for="gender">Gender</label>
                                  <br>
                                  <input type="radio"  id="gender" name="gender" value="male">Male
                                  <input type="radio"  id="gender" name="gender" value="female">Female
                                  <input type="radio"  id="gender" name='gender' value="super-hero">Super-hero
                                </div>
                                <div class='form-group'>
                                    <textarea name='about' class='form-control' id='' cols='30' rows='2' placeholder="Enter Something about yourself.."></textarea>
                                </div>
                                <div class="form-check">
                                  <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                  <label class="form-check-label" for="exampleCheck1">T&C</label>
                                </div>
                                <div class="container text-center" id="loader" style="display:none;">
                                    <span class="fa fa-refresh fa-spin fa-3x">   </span>
                                    <h4>please wait..</h4>
                                <br>
                                </div>
                                <button id="submit-btn" type="submit" class="btn btn-primary">Register</button>
                              </form>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function(){
                //console.log("loaded");
                $('#reg-form').on('submit',function(event){
                    event.preventDefault();
                    let form=new FormData(this);
                    
                    $('#submit-btn').hide();
                    $("#loader").show();
                    
//                   send to registerServlet
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                        console.log(data);
                         $('#submit-btn').show();
                        $("#loader").hide();
                        if(data.trim()==='done'){
                       
                        swal("Registered Successfully..we are redirecting you to log-in page.")
                        .then((value) => {
                          window.location="login_page.jsp";
                        });
                    }
                    else{
                        swal(data);
                        
                    }
                    },
                        error: function (jqXHR, textStatus, errorThrown) {
                        console.log(jqXHR);
                        $('#submit-btn').show();
                        $("#loader").hide();
                        swal("Something went wrong..")
                        
                    },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
    </body>
</html>
