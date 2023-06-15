<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="main.css">
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
                    <a class="nav-link" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#2">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#3">Contact</a>
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
                <h1>Hello There</h1>
                <div class="image-link">
                    <a href="Book.jsp?id=<%= request.getParameter("id") %>">
                        <img src="book.jpg" alt="Book" />
                    </a>
                    <h2>Book</h2>
                </div>
                <div class="image-link">
                    <a href="ViewReservation.jsp">
                        <img src="reserve.jpg" alt="View Reservation" />
                    </a>
                    <h2>View Reservation</h2>
                </div>
                <div class="image-link">
                    <a href="ViewHistory.jsp">
                        <img src="history.jpg" alt="View History" />
                    </a>
                    <h2>View History</h2>
                </div>
            </div>
        </div>
    </header>
            <section class="features" id="2">
        <div class="container">
            <div class="feature-title">About</div>
            <p>
                This system allows users to book courts for various sports activities. Simply fill in the required details and submit the form to make a booking. Please ensure that you provide accurate information for a smooth booking process.
            </p>
        </div>
    </section>
    <section class="features" id="3">
        <div class="container">
            <div class="feature-title">Contact</div>
            <ul>
                <li>Email: upm@student.upm.edu.my</li>
                <li>Phone: 123-456-7890</li>
                <li>Address: University Putra Malaysia</li>
            </ul>
        </div>
    </section>
    <footer class="page-footer">
        <div class="container">
            <p>&copy; 2023 Court Booking System. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>