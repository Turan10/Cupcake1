<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dat.backend.model.entities.ShoppingCart" %>
<%@ page import="dat.backend.model.entities.Cupcake" %>
<%@ page import="java.util.List" %>
<%@ page import="dat.backend.model.entities.Order" %><%--
  Created by IntelliJ IDEA.
  User: turan
  Date: 27/03/2023
  Time: 17.37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Order Confirmation</title>

    <style>
        body {
            background: pink;
            font-family: 'Open Sans', sans-serif;
        }

        h1, h2 {
            font-weight: 700;
            text-align: center;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 2rem;
        }

        .table {
            width: 80%;
            margin-bottom: 2rem;
        }

        .table th, .table td {
            text-align: center;
        }

        .success {
            color: green;
            font-weight: bold;
            margin-top: 1rem;
            text-align: center;
        }

        button {
            margin-top: 1rem;
        }
    </style>
</head>

<body>

<div class="container">
    <h1>Order Confirmation</h1>
    <p class="success"> ${requestScope.msg} </p>

    <div class="order-details">
        <h2>Order Details</h2>

        <table class="table table-striped">
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
                <td>${requestScope.order.getTimestamp()}</td>
            </tr>
            </tbody>
        </table>
    </div>

    <div class="order-items">
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
        <button type="submit" class="btn btn-primary">Order again</button
    </form>
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
