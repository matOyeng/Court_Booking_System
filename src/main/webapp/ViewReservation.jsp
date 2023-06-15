<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.ben.MySQL"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Reservation</title>
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

        /* Style the reservation table */
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
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
                <h1>Reservation Table</h1>

                <%-- Establish a connection to the database --%>
                <%@ page import="java.sql.*" %>
                <%@ page import="javax.sql.*" %>
                <%@ page import="javax.naming.*" %>

                <%-- Retrieve data from the database --%>
                <%@ page import="com.ben.MySQL"%>
                <%-- Assuming you have a class named YourDataAccessClass that retrieves data --%>
                <%
                    Connection connection = null;
                    PreparedStatement statement = null;
                    ResultSet resultSet = null;
                    try {
                        // Create an instance of your data access class
                        MySQL mysql = MySQL.getInstance();
                        connection = mysql.getSQLConnection();

                        // Prepare the SQL statement
                        String query = "SELECT * FROM reservation";
                        statement = connection.prepareStatement(query);

                        // Execute the query and retrieve the data
                        resultSet = statement.executeQuery();

                        // Generate HTML table dynamically using the retrieved data
                        out.println("<table>");
                        out.println("<tr>");
                        out.println("<th>College Name</th>");
                        out.println("<th>Court Name</th>");
                        out.println("<th>Duration</th>");
                        out.println("<th>Date</th>");
                        // Add more table headers for additional columns if needed
                        out.println("</tr>");

                        while (resultSet.next()) {
                            out.println("<tr>");
                            out.println("<td>" + resultSet.getString("college_name") + "</td>");
                            out.println("<td>" + resultSet.getString("court_name") + "</td>");
                            out.println("<td>" + resultSet.getString("period") + "</td>");
                            out.println("<td>" + resultSet.getDate("date") + "</td>");
                            // Add more table cells for additional columns if needed
                            out.println("</tr>");
                        }

                        out.println("</table>");
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        // Close the resources
                        if (resultSet != null) {
                            try {
                                resultSet.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                        if (statement != null) {
                            try {
                                statement.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                        if (connection != null) {
                            try {
                                connection.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                    }
                %>
            </div>
        </div>
    </header>
</body>
</html>
