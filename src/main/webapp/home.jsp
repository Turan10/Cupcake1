<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="da">
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Homepage</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/material-icons.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="assets/css/Features-Cards-icons.css">
    <link rel="stylesheet" href="assets/css/Hero-Clean-images.css">
    <link rel="stylesheet" href="assets/css/styles.css">
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
       </div>

    <div class="carousel slide" data-bs-ride="carousel" id="carousel-1" style="height: 600px;">
        <div class="carousel-inner h-100">
            <div class="carousel-item active h-100"><img class="img-fluid w-100 d-block position-absolute h-100 fit-cover" src="assets/img/rainbow-buttercream-cupcakes-final.jpg" alt="Slide Image" style="z-index: -1;">
                <div class="container d-flex flex-column justify-content-center h-100">
                    <div class="row">
                        <div class="col-md-6 col-xl-4 offset-md-2">
                            <div style="max-width: 350px;margin-top: -423px;padding-right: 0px;padding-left: 0px;padding-top: 367px;margin-left: -222px;">
                                <h1 class="text-uppercase fw-bold text-white">Velkommen til Olsker's Cupcakes</h1>
                                <p class="text-white my-3">Vores bager stræber hver dag efter nye smagsoplevelser for dig, og alle andre cupcake elskere.&nbsp;<br>Vi gør en dyd i vores arbejde, så du kan nyde nogle af de mest himmelske cupcakes.&nbsp;</p><a class="btn btn-outline-primary btn-lg" role="button" href="orderonline">Bestil</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item h-100"><img class="w-100 d-block position-absolute h-100 fit-cover" src="assets/img/Caramel-filled-Cupcakes-18-1-scaled.jpg" alt="Slide Image" style="z-index: -1;">
                <div class="container d-flex flex-column justify-content-center h-100">
                    <div class="row">
                        <div class="col-md-6 col-xl-4 offset-md-2">
                            <div style="max-width: 350px;">
                                <h1 class="text-uppercase fw-bold text-white" style="margin-top: 358px;">Selv fantasien kan ikke sætte grænsen hos os</h1><a class="btn btn-outline-primary btn-lg" role="button" href="orderonline">Bestil</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item h-100"><img class="w-100 d-block position-absolute h-100 fit-cover" src="assets/img/5dde3858-b6c0-48ce-9b96-b80a5efcb6ce.jpg" alt="Slide Image" style="z-index: -1;">
                <div class="container d-flex flex-column justify-content-center h-100">
                    <div class="row">
                        <div class="col-md-6 col-xl-4 offset-md-2">
                            <div style="max-width: 350px;">
                                <h1 class="text-uppercase fw-bold text-white" style="padding-top: 168px;margin-top: 236px;">Selv de små kan finde glæde hos os</h1><a class="btn btn-outline-primary btn-lg" role="button" href="orderonline">Bestil</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div><a class="carousel-control-prev" href="#carousel-1" role="button" data-bs-slide="prev"><span class="carousel-control-prev-icon"></span><span class="visually-hidden">Previous</span></a><a class="carousel-control-next" href="#carousel-1" role="button" data-bs-slide="next"><span class="carousel-control-next-icon"></span><span class="visually-hidden">Next</span></a></div>
        <ol class="carousel-indicators">
            <li data-bs-target="#carousel-1" data-bs-slide-to="0" class="active"></li>
            <li data-bs-target="#carousel-1" data-bs-slide-to="1"></li>
            <li data-bs-target="#carousel-1" data-bs-slide-to="2"></li>
        </ol>
    </div>
    <div class="container py-4 py-xl-5" style="margin-top: 50px;">
        <div class="row mb-5">
            <div class="col-md-8 col-xl-6 text-center mx-auto">
                <h2>Hvorfor os?</h2>
                <p>For os er kunden altid i centrum</p>
            </div>
        </div>
        <div class="row gy-4 row-cols-1 row-cols-md-2 row-cols-xl-3">
            <div class="col">
                <div class="card">
                    <div class="card-body p-4">
                        <div class="bs-icon-md bs-icon-rounded bs-icon-primary d-flex justify-content-center align-items-center d-inline-block mb-3 bs-icon"><i class="fas fa-leaf"></i></div>
                        <h4 class="card-title">Miljø</h4>
                        <p class="card-text">For at sikre os at vores produkter lever op til vores standarder, er alle vores ingredienser fra vores egen gård.</p>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <div class="card-body p-4">
                        <div class="bs-icon-md bs-icon-rounded bs-icon-primary d-flex justify-content-center align-items-center d-inline-block mb-3 bs-icon"><i class="material-icons">cake</i></div>
                        <h4 class="card-title">Kvalitet</h4>
                        <p class="card-text">Vores cupcakes laves dagligt af vores konditorer, med en præcision og klasse der overstiger alle parameter.&nbsp;</p>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card">
                    <div class="card-body p-4">
                        <div class="bs-icon-md bs-icon-rounded bs-icon-primary d-flex justify-content-center align-items-center d-inline-block mb-3 bs-icon"><i class="fa fa-envelope-o"></i></div>
                        <h4 class="card-title">Særlige ønsker</h4>
                        <p class="card-text">Vi prøver aktivt at få vores menu til at passe til alle.<br>Derfor tilbyder vi også non-diary cupcake</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div></div>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>
</html>