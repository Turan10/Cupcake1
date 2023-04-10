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
<!DOCTYPE html>
<html lang="da">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js"></script>
</head>
<body style="background-color: lightpink;">
<nav class="navbar navbar-light navbar-expand-md">
    <div class="container-fluid"><a class="navbar-brand" href="home.jsp">Olsker's Cupcakes</a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navcol-1">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link active" href="orderonline">Order</a></li>
                <li class="nav-item"><a class="nav-link" href="about-us.jsp">About us</a></li>
                <li class="nav-item"><a class="nav-link" href="contact-us.jsp">Contact us</a></li>
                <li class="nav-item">
                    <c:choose>
                        <c:when test="${empty sessionScope.user}">
                            <a class="nav-link" href="login.jsp">
                                <img src="${pageContext.request.contextPath}/images/loginlogo.png" width="30px;" class="loginLogo" alt="Login" /> Login
                            </a>
                        </c:when>
                        <c:otherwise>
                            <span class="nav-link">Welcome ${sessionScope.user.username}!</span>
                        </c:otherwise>
                    </c:choose>
                </li>

                <li class="nav-item">
                    <c:choose>
                    <c:when test="${empty sessionScope.user}">
                    <a class="nav-link" href="signup.jsp">
                        <img src="${pageContext.request.contextPath}/assets/img/signup.png" width="30px;" class="registerLogo" alt="Register" /> Register
                    </a>
                    </c:when>
                    <c:otherwise>
                    <a class="nav-link" href="logout">
                        <img src="${pageContext.request.contextPath}/assets/img/logout.png" width="30px;" class="logoutLogo" alt="Logout" /> Logout
                    </a>
                    </c:otherwise>
                    </c:choose>

            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <h1 class="text-center mt-4 mb-4">Shopping Cart</h1>
    <div class="item-container row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
        <c:set var="shoppingCart" value="${sessionScope.shoppingCart}" />

        <c:if test="${not empty shoppingCart}">
            <c:forEach items="${shoppingCart.cupcakes}" var="cupcake">
                <div class="item col">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">${cupcake.bottom.details} with ${cupcake.top.details}</h5>
                            <p class="card-text">Price: ${cupcake.totalPrice} kr.</p>
                            <form action="deletefromcart" method="post">
                                <input type="hidden" name="cupcakeId" value="${shoppingCart.cupcakes.indexOf(cupcake)}">
                                <button type="submit" class="btn btn-danger">Remove</button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </div>
    <c:if test="${empty shoppingCart}">
        <p class="text-center">No items in cart</p>
    </c:if>

    <div class="buttons-container mt-5">
        <div class="d-flex justify-content-between">
            <form action="checkout" method="post">
                <button type="submit" class="btn btn-primary">Checkout</button>
            </form>

            <div>
                <p class="badge bg-light text-dark px-3 py-2">
                    Number of cupcakes = ${shoppingCart.cupcakes.size()}<br>
                    Total price = ${shoppingCart.totalPrice} kr.
                </p>
            </div>

            <div>
                <a href="orderonline" class="badge bg-light text-dark px-3 py-2">Back to shop</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>

