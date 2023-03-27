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
            width: 400px;
            height: 410px;
            position: absolute;
            top: 240px;
            left: 265px;
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
            max-width: 470px;
            max-height: 400px;
            margin-top: 95px;
            margin-left: 680px;
            margin-right: 280px;
            z-index: 2;
            position: absolute;
            border-radius: 5px;
            background-color: white;
            padding: 20px;

        }

        input[type=text], select, textarea {
            width: 100%; /* Full width */
            padding: 2px; /* Some padding */
            border: 1px solid #ccc; /* Gray border */
            border-radius: 2px; /* Rounded borders */
            box-sizing: border-box; /* Make sure that padding and width stays in place */
            margin-top: 1px; /* Add a top margin */
            margin-bottom: 1px; /* Bottom margin */
            resize: vertical /* Allow the user to vertically resize the textarea (not horizontally) */
        }

        /* Style the submit button with a specific background color etc */
        input[type=submit] {
            width: 100%; /* make the submit button full width */
            max-width: 450px; /* limit the maximum width of the submit button */
            background-color: hotpink;
            color: white;
            padding: 8px 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .googlemaps {
            width: 450px;
            height: 450px;
            z-index: 2;
            margin-left: 300px;
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

</div>
<div class="paragraph">
    <form action="SaveContactFormServlet" method="post">

        <label for="fname">Full name</label>
        <input type="text" id="fname" name="fullname" placeholder="Your full name..">

        <label for="lname">Email adress</label>
        <input type="text" id="lname" name="email" placeholder="Your email adress..">

        <label for="inquiry">Whats the inquiry about?</label>
        <select id="inquiry" name="inquiry">
            <option value="orderissues">Order Issues</option>
            <option value="feedback">Feedback</option>
            <option value="other">Other</option>
        </select>

        <label for="subject">Subject</label>
        <textarea id="subject" name="subject" placeholder="Write something.." style="height:100px"></textarea>

        <input type="submit" value="Submit">

    </form>
</div>

    <div class="square2"></div>
    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d9098.855202108787!2d14.7971999!3d55.2407315!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x46550643ea4740df%3A0xa00afcc1d51fdc0!2s3770%20Olsker!5e0!3m2!1sda!2sdk!4v1679780335841!5m2!1sda!2sdk" class="aboutuscupcakelogo" style="border: 2px solid plum" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    <div class="square"></div>

    <div class="row">
        <div class="col text-center">
            <a href="homepage.jsp">
                <button type="button" class="btn btn-primary">HOME</button>
            </a>
            <a href="about-us.jsp">
                <button type="button" class="btn btn-primary">ABOUT US</button>
            </a>
            <button type="button" class="btn btn-primary">MENU</button>
            <button type="button" class="btn btn-primary">ORDER ONLINE</button>
            <a href="contact-us.jsp">
                <button type="button" class="btn btn-primary">CONTACT US</button>
            </a>
        </div>
    </div>
</div>
<!-- Include Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</body>