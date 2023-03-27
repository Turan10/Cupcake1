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
            z-index: 1;
        }

        .square2 {
            background: pink;
            width: 400px;
            height: 400px;
            position: absolute;
            top: 245px;
            left: 265px;
            z-index: 2;
        }

        .aboutuscupcakelogo {
            width: 240px;
            height: 320px;
            position: absolute;
            top: 280px;
            left: 345px;
            z-index: 2;
        }

        .textsquare {
            width: 470px;
            height: 400px;
            position: absolute;
            background: white;
            border: 2px solid lightgray;
            z-index: 2;
            top: 245px;
            left: 680px;
        }

        .paragraph {
            margin-left: 100px;
            margin-top: 125px;
            margin-left: 410px;
            z-index: 2;
            position: absolute;
        }

    </style>
</head>
<body>
<div class="container-fluid d-flex justify-content-center">
    <div class="logo">
        <a href="homepage.jsp">
            <img src="${pageContext.request.contextPath}/images/cupcakelogo.png" width="270px;" class="logo"/>
        </a>
        <a href="login.jsp">
            <img src="${pageContext.request.contextPath}/images/loginlogo.png" width="30px;" class="loginLogo"/>
        </a>
    </div>
    <div class="textsquare"></div>
    <p class="paragraph" style="text-align: center">Olsker Cupcakes
        is an artisanal cupcake factory
        <br>
        based in the heart of the Danish countryside.
        <br>
        We specialize in creating delicious, hand-crafted
        <br>
        cupcakes made from only the freshest ingredients.
        <br>
        From traditional favorites to creative new flavors,
        <br>
        we have something for everyone to enjoy.
        <br>
        Our team of passionate pastry chefs take pride in
        <br>
        creating unique cupcakes with a focus on
        quality,
        <br>
        taste, and presentation.
        <br>
        Whether you’re looking for a special treat for a special
        <br>
        occasion or just a sweet treat
        <br>
        to brighten your day, Olsker Cupcakes has got you covered.
        <br>
        Stop by our factory and take home a
        <br>
        sweet treat you won’t soon forget!
    </p>

    <div class="square2"></div>
    <div><img src="${pageContext.request.contextPath}/images/about-us-cupcake.png" width="30px;" class="aboutuscupcakelogo"/></div>
    <div class="square"></div>

    <div class="row">
        <div class="col text-center">
            <button type="button" class="btn btn-primary">HOME</button>
            <button type="button" class="btn btn-primary">ABOUT US</button>
            <button type="button" class="btn btn-primary">MENU</button>
            <button type="button" class="btn btn-primary">ORDER ONLINE</button>
            <button type="button" class="btn btn-primary">CONTACT US</button>
        </div>
    </div>
</div>
<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</body>