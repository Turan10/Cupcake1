<%@ page import="dat.backend.model.entities.Topping" %>
<%@ page import="dat.backend.model.entities.Bottom" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/Homepage.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Cupcakes</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="js/scripts.js"></script>
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
            margin-left: -15px;
            margin-right: -15px;
        }

        .item {
            margin: 15px;
            text-align: center;
            flex-basis: calc(33.3333% - 30px);
        }
        .content {
            max-width: 930px;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            border: 3px solid deeppink;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .content-wrapper {
            padding: 20px;
            box-sizing: border-box;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="content-wrapper">
            <div class="content">
                <h1 class="text-center text-white">Order Cupcakes Online</h1>
                <p class="text-center">Choose your cupcake bottom and topping and place your order.</p>



        <% String step = request.getParameter("step"); %>

        <% if (step == null || step.equals("bottoms")) { %>
    <h2 class="text-center text-white">Choose your cupcake bottom:</h2>
    <form action="orderonline" method="post">
        <input type="hidden" name="step" value="toppings">
        <div class="item-container">
            <% for (Bottom bottom : (List<Bottom>) request.getAttribute("bottomList")) { %>
            <div class="item card" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title"><%= bottom.getDetails() %>
                    </h5>
                    <p class="card-text">Price: <%= bottom.getPrice() %> kr.
                    </p>
                    <button type="submit" name="bottomId" value="<%= bottom.getId() %>" class="btn btn-primary">Select
                    </button>
                </div>
            </div>
            <% } %>
        </div>
    </form>

        <% } else if (step.equals("toppings")) { %>
    <h2 class="text-center text-white">Selected Cupcake bottom:</h2>
        <% Bottom bottomOfChoice = (Bottom) request.getAttribute("bottomOfChoice"); %>
    <div class="text-center text-white">

        <p><strong>Details:</strong><%= bottomOfChoice.getDetails()%>
        </p>
        <p><strong>Price:</strong><%= bottomOfChoice.getPrice()%> kr.
        </p>

    </div>
    <br>

    <h2 class="text-center text-white">Choose your cupcake topping:</h2>
    <form action="orderonline" method="post">
        <input type="hidden" name="step" value="complete">
        <input type="hidden" name="bottomId" value="<%= request.getParameter("bottomId") %>">
        <div class="item-container">
            <% for (Topping topping : (List<Topping>) request.getAttribute("toppingList")) { %>
            <div class="item card" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title"><%= topping.getDetails() %>
                    </h5>
                    <p class="card-text">Price: <%= topping.getPrice() %> kr.
                    </p>
                    <button type="submit" name="toppingId" value="<%= topping.getId() %>" class="btn btn-primary">
                        Select
                    </button>
                </div>
            </div>
            <% } %>
        </div>
    </form>
        <% } else if (step.equals("complete")) { %>
    <h2 class="text-center text-white">Order Complete</h2>
    <p class="text-center text-white">Thank you for your order!</p>
    <div class="text-center">
        <a href="orderonline">Order another cupcake</a>
            <% } %>


    </div>
    </div>
    </div>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
                crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
                crossorigin="anonymous"></script>



</body>
</html>

