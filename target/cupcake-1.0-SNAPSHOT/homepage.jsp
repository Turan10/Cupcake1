<%--
  Created by IntelliJ IDEA.
  User: martinthuren
  Date: 24/03/2023
  Time: 15.12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Olskers cupcakes!</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- Optional: Include your own CSS file here -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container-fluid d-flex justify-content-center">
    <div class="logo">
        <a href="homepage.jsp">
        <img src="${pageContext.request.contextPath}/images/cupcakelogo.png" width="270px;" class="logo"/>
        </a>
        <a href="login.jsp">
            <img src="${pageContext.request.contextPath}/images/loginlogo.png" width="30px;" class="loginLogo"/>
        </a>
    </div>
    <div class="square"></div>
    <div class="row">
        <div class="col text-center">
            <button type="button" class="btn btn-primary">HOME</button>
            <button type="button" class="btn btn-primary">ABOUT US</button>
            <button type="button" class="btn btn-primary">MENU</button>
            <button type="button" class="btn btn-primary">ORDER ONLINE</button>
            <button type="button" class="btn btn-primary">CONTACT US</button>
        </div>
    </div>
</div>
<!-- Include Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNSG+p" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
