<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: turan
  Date: 25/03/2023
  Time: 15.35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Olskers cupcakes!</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style>
    table {
    border-collapse: collapse;
    border: 1px solid silver;
    padding:15px;
    }

    body {
    background: pink;
    }


    th, td {
    border: 1px solid silver;
    padding:15px;
    }

    .container-fluid {
    margin-top: 150px;
    }

    .btn:hover {
    background-color: pink;
    border: 3px solid deeppink;
    color: black;
    }

    .btn {
    margin-top: 20px;
    margin-left: -8px;
    margin-right: 24px;
    width: 170px;
    color: black;
    background-color: white;
    border: 3px solid deeppink;
    font-weight: bold;
    }

    .logo {
    margin-top: -160px;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    z-index: 1;
    }

    .loginLogo {
    margin-top: -180px;
    position: absolute;
    margin-left: 650px;
    transform: translate(-50%,-50%);
    z-index: 1;
    }

    .square {
    border: 3px solid deeppink;
    margin-left: -18px;
    margin-right: 15px;
    margin-top: 50px;
    width: 930px;
    height: 450px;
    background-color: white;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    }


</style>
</head>
<body>
<div class="container-fluid d-flex justify-content-center">
    <div class="logo">
        <a href="Homepage.jsp">
            <img src="${pageContext.request.contextPath}/images/cupcakelogo.png" width="270px;" class="logo"/>
        </a>
        <c:choose>
            <c:when test="${empty sessionScope.user}">
                <a href="login.jsp">
                    <img src="${pageContext.request.contextPath}/images/loginlogo.png" width="30px;" class="loginLogo"/>
                </a>
            </c:when>
            <c:otherwise>
                <h3>Welcome ${sessionScope.user.username}!</h3>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="row">
        <c:if test="${sessionScope.user != null && sessionScope.user.role == 'admin'}">
            <form method="post" action="vieworders">
            <button class="btn btn-secondary" type="submit">View all orders</button>

        </form>
        </c:if>
        <div class="col text-center">
            <a href="Homepage.jsp">
            <button type="button" class="btn btn-primary">HOME</button>
            </a>
            <a href="about-us.jsp">
            <button type="button" class="btn btn-primary">ABOUT US</button>
            </a>
            <button type="button" class="btn btn-primary">MENU</button>
            <a href="login">
            <button type="button" class="btn btn-primary">ORDER ONLINE</button>
            </a>
            <a href="contact-us.jsp">
            <button type="button" class="btn btn-primary">CONTACT US</button>
            </a>
        </div>
    </div>
</div>
<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</body>