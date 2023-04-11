<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dat.backend.model.entities.ShoppingCart" %>
<%@ page import="dat.backend.model.entities.Cupcake" %>
<%@ page import="java.util.List" %>
<%@ page import="dat.backend.model.entities.Order" %>
<%--  Created by IntelliJ IDEA.
  User: turan
  Date: 27/03/2023
  Time: 17.37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="da">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Checkout</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <style>
        body {
            background: lightpink;
            font-family: 'Open Sans', sans-serif;
        }

    </style>
</head>

<body>
<nav class="navbar navbar-light navbar-expand-md">
    <div class="container-fluid"><a class="navbar-brand" href="#">Olsker's Cupcakes</a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navcol-1">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link active" href="orderonline">Order</a></li>
                <li class="nav-item"><a class="nav-link" href="ToAboutUs">About us</a></li>
                <li class="nav-item"><a class="nav-link" href="ToContact">Contact us</a></li>
            </ul>
        </div>
    </div>
</nav>


<div class="container">
    <h1>Order Confirmation</h1>
    <p class="success"> ${requestScope.msg} </p>

    <div class="table-responsive">
        <h2>Order Details</h2>

        <table class="table">
            <thead>
            <tr>
                <th scope="col">Order ID</th>
                <th scope="col">Total Price</th>
                <th scope="col">Order Date</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>${requestScope.order.getOrderID()}</td>
                <td>${requestScope.order.getTotalPrice()}</td>
                <td>${requestScope.order.getTimestamp()}</
            </tr>
            </tbody>
        </table>
    </div>

    <div class="table-responsive">
        <h2>Order Items</h2>

        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Topping</th>
                <th scope="col">Bottom</th>
                <th scope="col">Price</th>
            </tr>
            </thead>
            <tbody>
            <% int i = 1; %>
            <c:forEach items="${requestScope.order.getCupcakeList()}" var="cupcake">
                <tr>
                    <td><%= i %></td>
                    <td>${cupcake.getTop().getDetails()}</td>
                    <td>${cupcake.getBottom().getDetails()}</td>
                    <td>${cupcake.getTotalPrice()}</td>
                </tr>
                <% i++; %>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <form action="orderonline" method="post">
        <button type="submit" class="btn btn-primary">Order again</button>
    </form>
</div>

<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>
