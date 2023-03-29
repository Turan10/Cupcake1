<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dat.backend.model.entities.Cupcake" %>
<%@ page import="java.util.List" %>
<%@ page import="dat.backend.model.entities.ShoppingCart" %>
<%@ page import="dat.backend.model.entities.User" %>
<%@ page import="com.mysql.cj.Session" %><%--
  Created by IntelliJ IDEA.
  User: turan
  Date: 23/03/2023
  Time: 21.35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        body {
            background: pink;
        }


        .container {
            margin-top: 30px;
        }

        .item-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            min-height: 50vh;
        }

        .buttons-container{
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            margin-top: 30px;
        }

        .item {
            margin: 15px;
            text-align: center;
        }

        .fixed-center {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        .item .card{
            padding: 15px;
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
                <h3 class="header">Here's your shoppingcart ${sessionScope.user.username}!</h3>

            </c:otherwise>
        </c:choose>
    </div>
</div>

<h1>Shopping Cart</h1>


<h4>Items</h4>

<div class="item-container">
    <c:set var="shoppingCart" value="${sessionScope.shoppingCart}" />

    <c:if test="${not empty shoppingCart}">
        <c:forEach items="${shoppingCart.cupcakes}" var="cupcake">
            <div class="item">
                <div class="item card" style="width: 18rem;">
                    <h5>${cupcake.bottom.details} with ${cupcake.top.details}</h5>
                    <p>Price: ${cupcake.totalPrice} kr.</p>
                    <form action="deletefromcart" method="post">
                        <input type="hidden" name="cupcakeId" value="${shoppingCart.cupcakes.indexOf(cupcake)}">
                        <button type="submit" class="btn btn-danger">Remove</button>
                    </form>
                </div>
            </div>
        </c:forEach>
    </c:if>
    <c:if test="${empty shoppingCart}">
        <p>No items in cart</p>
    </c:if>
<div class="buttons-container">
    <div class="center ml-4">


    <form action="checkout" method="post">

        <button type="submit" class="btn btn-primary">Checkout</button>
    </form>


    </div>


    <div class="center ml-4" style="left: 10%;">
        <p class="badge badge-pill badge-primary bg-white text-dark p-3">
            Number of cupcakes = ${shoppingCart.cupcakes.size()}
            <br>
            Total price = ${shoppingCart.totalPrice} kr.
        </p>
    </div>


    <div class="position-absolute" style="top: 50%; right: 10%;">

        <a href="orderonline" class="badge badge-pill badge-primary bg-white text-dark p-3">Back to shop</a>

    </div>

</div>
</div>


    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
</body>
</html>
