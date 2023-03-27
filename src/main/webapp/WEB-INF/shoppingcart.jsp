<%@ page import="dat.backend.model.entities.Cupcake" %>
<%@ page import="java.util.List" %>
<%@ page import="dat.backend.model.entities.ShoppingCart" %><%--
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
            background-color: #b841AD;
        }

        .container {
            margin-top: 30px;
        }

        .item-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
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


    </style>
</head>
<body>

<h1>Shopping Cart</h1>


<h4>Items</h4>

<div class="item-container">
        <% ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("shoppingCart");
    if (shoppingCart != null) {
        List<Cupcake> cupcakes = shoppingCart.getCupcakes();
        if (cupcakes != null && !cupcakes.isEmpty()) {
            for (Cupcake cupcake : cupcakes) {
    %>
    <div class="item">
        <div class="item card" style="width: 18rem;">
            <h5><%= cupcake.getBottom().getDetails() %> with <%= cupcake.getTop().getDetails() %>
            </h5>

            <p>Price: <%= cupcake.getTotalPrice() %> kr.
            </p>
            <form action="deletefromcart" method="post">
                <input type="hidden" name="cupcakeId" value="<%= cupcakes.indexOf(cupcake) %>">
                <button type="submit" class="btn btn-danger">Remove</button>

            </form>
        </div>
    </div>
        <%   }
        } else {
    %>
    <p>No items in cart</p>
        <%   }
    }
    %>

    <div class="fixed-center">


        <a href="checkout" class="badge badge-pill badge-success text-dark p-3">Checkout</a>


    </div>

    <div class="fixed-center" style="left: 10%;">
        <p class="badge badge-pill badge-primary bg-white text-dark p-3">
            Number of cupcakes = <%= shoppingCart.getCupcakes().size() %>
            <br>
            Total price = <%= shoppingCart.getTotalPrice() %> kr.
        </p>
    </div>


    <div class="position-absolute" style="top: 50%; right: 10%;">

        <a href="orderonline" class="badge badge-pill badge-primary bg-white text-dark p-3">Back to shop</a>

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
