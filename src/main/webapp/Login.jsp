<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.ben.MySQL" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
	body {
		background-image: url("upm.png");
		background-repeat: no-repeat;
		background-size: cover;
		display: flex;
		justify-content: center;
		align-items: center;
		height: 100vh;
	}

	.container {
		background-color: rgba(255, 255, 255, 0.8);
		padding: 20px;
		border-radius: 10px;
	}

	.login-container {
		display: flex;
		flex-direction: column;
		align-items: center;
		width: 400px;
	}

	.login-field {
		display: flex;
		align-items: center;
		margin-bottom: 10px;
	}

	.label {
		width: 100px;
		font-size: 20px;
	}

	.input {
		flex-grow: 1;
	}

	input[type="text"],
	input[type="password"] {
		width: 250px;
		height: 30px;
		font-size: 16px;
	}

	select {
		width: 250px;
		height: 30px;
		font-size: 16px;
	}

	.button {
		margin-top: 20px;
		display: flex;
		justify-content: center;
	}

	.register-link {
		margin-top: 10px;
	}

	.register-button {
		font-size: 16px;
		text-decoration: none;
		color: #333;
	}

	.register-button:hover {
		text-decoration: underline;
	}

</style>
</head>
<body>
<%-- Check for error parameter and display appropriate alert message --%>
    <%
        String error = request.getParameter("error");
        if (error != null && error.equals("required")) {
    %>
            <script>alert("User ID and password are required.");</script>
    <%
        } else if (error != null && error.equals("incorrect")) {
    %>
            <script>alert("Incorrect password. Please try again.");</script>
    <%
        }
    %>
	<div class="container">
		<div class="login-container">
			<form action="UserLogin" method="POST">
				<div class="login-field">
					<div class="label">User ID:</div>
					<div class="input">
						<input type="text" name="userid" placeholder="Enter your username">
					</div>
				</div>
				<div class="login-field">
					<div class="label">Choose your role:</div>
					<div class="input">
						<select name="role" id="role">
							<option value="student">Student</option>
							<option value="lecturer">Lecturer</option>
							<option value="staff">Staff</option>
							<option value="admin">Admin</option>
						</select>
					</div>
				</div>
				<div class="login-field">
					<div class="label">Password:</div>
					<div class="input">
						<input type="password" name="password" placeholder="Enter your password">
					</div>
				</div>
				<div class="button">
					<input type="submit" value="LOGIN">
				</div>
			</form>
			<div class="register-link">
				<a href="Register.jsp" class="register-button">Don't have an account? Register here</a>
			</div>
		</div>
	</div>
</body>
</html>
