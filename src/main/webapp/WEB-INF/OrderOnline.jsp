<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dat.backend.model.entities.Topping" %>
<%@ page import="dat.backend.model.entities.Bottom" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="da">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Cupcakes Online</title>
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
    <section class="py-4 py-xl-5"></section>
</div>

<div class="container">
    <div class="content-wrapper">
        <div class="content">
            <h1 class="text-center text-white">Order Cupcakes Online</h1>
            <p class="text-center">Choose your cupcake bottom and topping and place your order.</p>

            <c:set var="step" value="${param.step}"/>

            <c:choose>
            <c:when test="${step == null || step == 'bottoms'}">
            <h2 class="text-center text-black">Choose your cupcake bottom:</h2>
            <form action="orderonline" method="post">
                <input type="hidden" name="step" value="toppings">
                <div class="item-container row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                    <c:forEach var="bottom" items="${requestScope.bottomList}">
                        <div class="item col">
                            <div class="card h-100">
                                <div class="card-body">
                                    <h5 class="card-title">${bottom.details}</h5>
                                    <p class="card-text">Pris: ${bottom.price} kr.</p>
                                    <button type="submit" name="bottomId" value="${bottom.id}" class="btn btn-primary">Vælg bund</button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </form>
            </c:when>
            <c:when test="${step == 'toppings'}">
            <h2 class="text-center text-dark">Valgt Cupcake bund:</h2>
            <div class="text-center text-dark">
                <p><strong>Detaljer:</strong>${requestScope.bottomOfChoice.details}</p>
                <p><strong>Pris:</strong>${requestScope.bottomOfChoice.price} kr.</p>
            </div>
            <br>

            <h2 class="text-center text-black">Vælg din cupcake top:</h2>
            <form action="orderonline" method="post">
                <input type="hidden" name="step" value="complete">
                <input type="hidden" name="bottomId" value="${param.bottomId}">
                <div class="item-container row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                    <c:forEach var="topping" items="${requestScope.toppingList}">
                    <div class="item col">
                        <div class="card h-100">
                            <div class="card-body">
                                <h5 class="card-title">${topping.details}</h5>
                                <p class="card-text">Pris: ${topping.price} kr.</p>
                                <button type="submit" name="toppingId" value="${topping.id}" class="btn btn-primary">Vælg top</button>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </form>
            </c:when>
                <c:otherwise>
                    <div class="text-center">
                        <a href="orderonline">Bestil en ny cupcake</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
</body>
</html>



