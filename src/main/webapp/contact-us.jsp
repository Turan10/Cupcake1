<%--
  Created by IntelliJ IDEA.
  User: turan
  Date: 25/03/2023
  Time: 15.35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="da">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Untitled</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
</head>

<body style="background-color: lightpink;">
<nav class="navbar navbar-light navbar-expand-md">
    <div class="container-fluid"><a class="navbar-brand" href="home.jsp">Olsker's Cupcakes</a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navcol-1">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link active" href="orderonline">Order</a></li>
                <li class="nav-item"><a class="nav-link" href="about-us.jsp">About us</a></li>
                <li class="nav-item"><a class="nav-link" href="contact-us.jsp">Contact us</a></li>
            </ul>
        </div>
    </div>
</nav>
<section class="py-4 py-xl-5">
    <header class="font-monospace" style="text-align: center;font-size: x-large;"><span>Kontakt os</span></header>
</section>
<section class="position-relative py-5">
    <div class="d-md-none"><iframe allowfullscreen="" frameborder="0" loading="lazy" src="https://www.google.com/maps/embed/v1/place?key=AIzaSyA-VQN0r-xg12oRS51ojTppayX0d-mggSU&amp;q=R%C3%B8nnevej+39+B%2C+3770+Allinge&amp;zoom=11" width="100%" height="100%"></iframe></div>
    <div class="d-none d-md-block position-absolute top-0 start-0 w-100 h-100"><iframe allowfullscreen="" frameborder="0" loading="lazy" src="https://www.google.com/maps/embed/v1/place?key=AIzaSyA-VQN0r-xg12oRS51ojTppayX0d-mggSU&amp;q=R%C3%B8nnevej+39+B%2C+3770+Allinge&amp;zoom=11" width="100%" height="100%"></iframe></div>
    <div class="position-relative mx-2 my-5 m-md-5">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-xl-5 col-xxl-4 offset-md-6 offset-xl-7 offset-xxl-8">
                    <div>
                        <form class="border rounded shadow p-3 p-md-4 p-lg-5" method="post" style="background: var(--bs-body-bg);">
                            <h3 class="text-center mb-3">Contact us</h3>
                            <div class="mb-3"><input class="form-control" type="text" name="name" placeholder="Name"></div>
                            <div class="mb-3"><input class="form-control" type="email" name="email" placeholder="Email"></div>
                            <div class="mb-3"><textarea class="form-control" name="message" placeholder="Message" rows="6"></textarea></div>
                            <div class="mb-3"><button class="btn btn-primary" type="submit">Send </button></div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>