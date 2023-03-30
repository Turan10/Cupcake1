<%@ page import="dat.backend.model.entities.Topping" %>
<%@ page import="dat.backend.model.entities.Bottom" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/template.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Cupcakes</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="js/scripts.js"></script>
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

        .logo {
            margin-top: -160px;
            position: absolute;
            top: 30%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 1;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="content-wrapper">
        <div class="content">
            <h1 class="text-center text-white">Order Cupcakes Online</h1>
            <p class="text-center">Choose your cupcake bottom and topping and place your order.</p>

            <c:set var="step" value="${param.step}"/>

            <c:choose>
                <c:when test="${step == null || step == 'bottoms'}">
                    <h2 class="text-center text-white">Choose your cupcake bottom:</h2>
                    <form action="orderonline" method="post">
                        <input type="hidden" name="step" value="toppings">
                        <div class="item-container">
                            <c:forEach var="bottom" items="${requestScope.bottomList}">
                                <div class="item card" style="width: 18rem;">
                                    <div class="card-body">
                                        <h5 class="card-title">${bottom.details}
                                        </h5>
                                        <p class="card-text">Price: ${bottom.price} kr.
                                        </p>
                                        <button type="submit" name="bottomId" value="${bottom.id}"
                                                class="btn btn-primary">Select
                                        </button>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </form>
                </c:when>
                <c:when test="${step == 'toppings'}">
                    <h2 class="text-center text-white">Selected Cupcake bottom:</h2>
                    <div class="text-center text-white">
                        <p><strong>Details:</strong>${requestScope.bottomOfChoice.details}
                        </p>
                        <p><strong>Price:</strong>${requestScope.bottomOfChoice.price} kr.
                        </p>
                    </div>
                    <br>

                    <h2 class="text-center text-white">Choose your cupcake topping:</h2>
                    <form action="orderonline" method="post">
                        <input type="hidden" name="step" value="complete">
                        <input type="hidden" name="bottomId" value="${param.bottomId}">
                        <div class="item-container">
                            <c:forEach var="topping" items="${requestScope.toppingList}">
                                <div class="item card" style="width: 18rem;">
                                    <div class="card-body">
                                        <h5 class="card-title">${topping.details}
                                        </h5>
                                        <p class="card-text">Price: ${topping.price} kr.
                                        </p>
                                        <button type="submit" name="toppingId" value="${topping.id}"
                                                class="btn btn-primary">
                                            Select
                                        </button>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </form>
                </c:when>
                <c:otherwise>
                    <div class="text-center">
                        <a href="orderonline">Order another cupcake</a>
                    </div>
                </c:otherwise>
            </c:choose>

        </div>
    </div>
</div>

<h2 class="text-center text-white">Order Complete</h2>
<p class="text-center text-white">Thank you for your order!</p>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>


</body>
</html>

