
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
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
        <title>Sorry ! Something went wrong...</title>
    </head>
    <body>
        <div class="container text-center">
            <img src="img/flat.jpg" class="img-fluid">
            <h1 class="display-3">Sorry ! Something went wrong...</h1>
            <h3 class="display-3"><%= exception %></h3>
            <a href="index.jsp" class="btn primary-background btn-lg text-white mt-5">Home</a>
        </div>
    </body>
</html>
