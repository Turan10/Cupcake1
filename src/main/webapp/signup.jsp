<%--
  Created by IntelliJ IDEA.
  User: Orhan
  Date: 23-03-2023
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Signup</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>

<h1>Registrer dig på siden her</h1>

<p>Indtast følgende info:</p>

<br>

<!-- $[] javakode - hvis username eller password fejler, kommer de to pop ops op på siden -->
<label style="color: red">${requestScope.userExists}</label><br><br>
<label >${requestScope.passwordMismatch}</label><br><br>


<form action="signup" method="post">

    Username: <input type="text" name="username" placeholder="e.g user123"> <br><br>

    Password: <input type="password" name="password"> <br><br>

    Confirm Password: <input type="password" name="confirmpassword"> <br><br>

    <input class="btn btn-primary" type="submit" value="Sign up"/>
</form>

<a class="btn btn-primary" href="index.jsp">Tilbage til forsiden!</a>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>




</body>
</html>
