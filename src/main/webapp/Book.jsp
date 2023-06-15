<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Court</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <style>
        /* Update background and font styles */
        body {
            padding: 0;
            margin: 0;
            background: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        /* Style the navigation bar */
        .navbar {
            background: #343a40;
            padding: 1rem;
        }

        .nav-link,
        .navbar-brand {
            color: #fff;
            cursor: pointer;
        }

        .nav-link {
            margin-right: 1em !important;
            transition: color 0.3s ease-in-out;
        }

        .nav-link:hover {
            color: #000;
        }

        .navbar-collapse {
            justify-content: flex-end;
        }

        /* Style the header section */
        .header {
            background-image: url('all.png');
            background-size: cover;
            background-position: center;
            position: relative;
            height: 400px; /* Adjust the height as needed */
        }

        .overlay {
            position: absolute;
            min-height: 100%;
            min-width: 100%;
            left: 0;
            top: 0;
            background: rgba(0, 0, 0, 0.6);
        }

        .description {
            left: 50%;
            position: absolute;
            top: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            color: #000; /* Updated text color to black */
        }

        .description h1 {
            font-size: 36px;
            margin-bottom: 20px;
            color: #000; /* Updated text color to black */
        }

        .description p {
            font-size: 18px;
            line-height: 1.5;
            margin-bottom: 1.5rem;
            color: #000; /* Updated text color to black */
        }

        .description a {
            display: inline-block;
            padding: 0.5rem 1rem;
            border: 1px solid grey;
            background: grey;
            border-radius: 3px;
            color: #fff;
            text-decoration: none;
            transition: all 0.3s ease-in-out;
        }

        .description a:hover {
            border-color: #fff;
            background: #fff;
            color: #000;
        }

        /* Style the features section */
        .features {
            margin: 4em auto;
            padding: 1em;
            position: relative;
            max-width: 900px; /* Adjust the max-width as needed */
        }

        .feature-title {
            color: #333;
            font-size: 20px;
            font-weight: 700;
            margin-bottom: 20px;
            text-transform: uppercase;
        }

        .features img {
            box-shadow: 1px 1px 4px rgba(0, 0, 0, 0.4);
            margin-bottom: 16px;
        }

        .features .form-control,
        .features input {
            border-radius: 0;
        }

        .features .btn {
            background-color: grey;
            border: 1px solid grey;
            color: #fff;
            margin-top: 20px;
            transition: all 0.3s ease-in-out;
        }

        .features .btn:hover {
            background-color: #333;
            border-color: #333;
        }

        /* Style the container */
        .container {
            text-align: center;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 10px;
            max-width: 600px; /* Adjust the max-width as needed */
            margin: 0 auto;
            margin-top: 4em;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .container h1 {
            font-size: 30px;
            margin-bottom: 20px;
            color: #000; /* Updated text color to black */
        }

        .container ul {
            list-style-type: none;
            padding: 0;
        }

        .container li {
            margin-bottom: 10px;
        }

        /* Style the image links */
        .image-link {
            display: inline-block;
            margin: 10px;
            cursor: pointer;
            transition: transform 0.2s ease-in-out;
        }

        .image-link img {
            width: 200px;
            height: 150px;
            border-radius: 5px;
        }

        .image-link img:hover {
            transform: scale(1.1);
        }
    </style>
</head>
<body>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
        integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
        crossorigin="anonymous"></script>
    <script src="main.js"></script>

    <nav class="navbar navbar-expand-md navbar-dark">
        <a href="https://www.upm.edu.my/" class="navbar-brand">Court Booking System</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="main-navigation">
            <ul class="navbar-nav">
                <li class="nav-item">
    <a class="nav-link" href="Home.jsp">Home</a>
</li>
                <li class="nav-item">
                    <a class="nav-link" href="Login.jsp">Log Out</a>
                </li>
            </ul>
        </div>
    </nav>
    <header class="page-header header container-fluid">
        <div class="overlay"></div>
        <div class="description">
            <div class="container">
                <h1>Book Court</h1>
                <form action="ReservationRequest" method="POST">
                    <div class="form-group">
                        <label>Matric ID:</label>
                        <input class="idinput" name="id" value="<%= request.getParameter("id") %>">
                    </div>
                    <div class="login-ui">
                        <div class="username">College:</div>
                        <div class="userinput">
                            <select name="college">
                                <option value="none" selected disabled hidden>Select a college</option>
                                <option value="Kolej Empat Belas">Kolej Empat Belas</option>
                                <option value="Kolej Dua Belas">Kolej Dua Belas</option>
                                <option value="Kolej Tiga Belas">Kolej Tiga Belas</option>
                                <option value="Kolej Sebelas">Kolej Sebelas</option>
                                <option value="Kolej Sepuluh">Kolej Sepuluh</option>
                                <option value="Kolej Tujuh Belas">Kolej Tujuh Belas</option>
                                <option value="Kolej Pendeta Za'ba">Kolej Pendeta Za'ba</option>
                                <option value="Kolej Tun Dr Ismail">Kolej Tun Dr Ismail</option>
                                <option value="Kolej Canselor">Kolej Canselor</option>
                                <option value="Kolej Sultan Alaedin Suleiman Shah">Kolej Sultan Alaedin Suleiman Shah</option>
                            </select>
                        </div>
                    </div>
                    <div class="login-ui">
                        <div class="username">Court:</div>
                        <div class="userinput">
                            <select name="court">
                                <option value="none" selected disabled hidden>Select a court</option>
                                <option value="basketball">Basketball court</option>
                                <option value="football">Football court</option>
                                <option value="badminton">Badminton court</option>
                                <option value="tennis">Tennis court</option>
                                <option value="squash">Squash court</option>
                            </select>
                        </div>
                    </div>
                    <div class="login-ui">
                        <div class="userinput">
                            <label for="role">Duration:</label>
                            <select name="duration">
                                <option value="none" selected disabled hidden>Select duration</option>
                                <option value="8-10">8am-10am</option>
                                <option value="10-12">10am-12pm</option>
                                <option value="12-14">12pm-2pm</option>
                                <option value="14-16">2pm-4pm</option>
                                <option value="16-18">4pm-6pm</option>
                                <option value="18-20">6pm-8pm</option>
                                <option value="20-22">8pm-10pm</option>
                            </select>
                        </div>
                    </div>
                    <div class="login-ui">
                        <div class="username">Number of people:</div>
                        <div class="userinput">
                            <input type="number" name="number" min="1" max="20" required>
                        </div>
                    </div>
                    <br>
                    <input type="submit" value="Book Court" class="btn btn-primary">
                </form>
            </div>
        </div>
    </header>
</body>
</html>
