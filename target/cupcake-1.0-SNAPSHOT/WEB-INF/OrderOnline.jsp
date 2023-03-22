<%@ page import="dat.backend.model.entities.Topping" %>
<%@ page import="dat.backend.model.entities.Bottom" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <title>Order online</title>
    <style>

        body {
            background-color: #B841AD;
        }
        .carousel-control-prev, .carousel-control-next {
            top: unset;
            bottom: -50px;
        }
    </style>
</head>

<body>


<div class="container-fluid">
    <div class="container">
        <form action="orderonline" method="post">
            <input type="hidden" name="selectedBottomId" id="selectedBottomId" value="" />
            <input type="hidden" name="selectedToppingId" id="selectedToppingId" value="" />
                <%
                int step = request.getParameter("step") != null ? Integer.parseInt(request.getParameter("step")) : 1;
                List<Bottom> bottoms = (List<Bottom>) request.getAttribute("bottomList");
                List<Topping> toppings = (List<Topping>) request.getAttribute("toppingList");
            %>
                <% if (step == 1) { %>
            <h2>Select your bottom:</h2>
            <div id="bottomCarousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <% for (int i = 0; i < bottoms.size(); i++) { %>
                    <div class="carousel-item <%= (i == 0) ? "active" : "" %>">
                        <h3><%= bottoms.get(i).getDetails() %></h3>
                        <p>This is the content of the <%= bottoms.get(i).getDetails() %> bottom slide.</p>
                        <button type="submit" name="step" value="2" onclick="document.getElementById('selectedBottomId').value='<%= bottoms.get(i).getId() %>'">Choose <%= bottoms.get(i).getDetails() %></button>
                    </div>
                    <% } %>
                </div>
                <a class="carousel-control-prev" href="#bottomCarousel" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#bottomCarousel" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
                <% } else if (step == 2) { %>
            <h2>Select your topping:</h2>
            <div id="toppingCarousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                        <% for (int i = 0; i < toppings.size(); i++) { %>
                    <div class="carousel-item <%= (i == 0) ? "active": "" %>">
                        <h3><%= toppings.get(i).getDetails() %></h3>
                        <p>This is the content of the <%= toppings.get(i).getDetails() %> topping slide.</p>
                        <button type="submit" name="step" value="3" onclick="document.getElementById('selectedToppingId').value='<%= toppings.get(i).getId() %>'">Choose <%= toppings.get(i).getDetails() %><%= toppings.get(i).getPrice() %></button>
                    </div>
                    <% } %>
                </div>
                <a class="carousel-control-prev" href="#toppingCarousel" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#toppingCarousel" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <% } %>
        </form>
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

