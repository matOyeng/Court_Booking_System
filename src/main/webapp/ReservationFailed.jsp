<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reservation Failed</title>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
            color: #333;
            text-align: center;
        }

        h1 {
            font-size: 30px;
            margin-top: 50px;
        }

        .content {
            margin-top: 30px;
        }

        .link {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .link:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>Reservation Failed</h1>
    <div class="content">
        <p>Unfortunately, your reservation could not be completed. Please try again.</p>
        <a href="Book.jsp?id=<%= request.getParameter("id")%>" class="link">Reserve Again</a>
    </div>
</body>
</html>
