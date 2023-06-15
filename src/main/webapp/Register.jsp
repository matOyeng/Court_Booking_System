<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
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

	.register-form {
		margin-top: 100px;
		display: flex;
		flex-direction: column;
		align-items: center;
		width: 400px;
		height: auto;
		padding: 20px;
		background-color: rgba(255, 255, 255, 0.8);
		border-radius: 10px;
	}

	.input-group {
		display: flex;
		flex-direction: row;
		align-items: center;
		width: 100%;
		margin-bottom: 10px;
	}

	.label {
		flex: 50%;
		font-size: 20px;
	}

	.user-input {
		flex: 50%;
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

	.register-button {
		margin-top: 20px;
	}

	.login-link {
		margin-top: 10px;
	}

	.login-button {
		font-size: 16px;
		text-decoration: none;
		color: #333;
	}

	.login-button:hover {
		text-decoration: underline;
	}

</style>
</head>
<body>
<div class="container">
        <div class="register-container">
            <%-- Check for error parameter and display appropriate error message --%>
            <% String error = request.getParameter("error"); %>
            <% if (error != null) { %>
                <div class="error">
                    <% if (error.equals("required")) { %>
                        <script>alert("User ID, name, email, password, and confirm password are required.");</script>
                    <% } else if (error.equals("email")) { %>
                    <script>alert("Please enter a valid email address.");</script>
                    <% } else if (error.equals("passwordMismatch")) { %>
                    <script>alert("Password and confirm password do not match.");</script>
                    <% } %>
                </div>
            <% } %>
	<form action="GetRequest" method="POST">
		<div class="register-form">
			<div class="input-group">
				<div class="label">User ID:</div>
				<div class="user-input">
					<input type="text" name="userid" placeholder="Enter your user ID">
				</div>
			</div>
			<div class="input-group">
				<div class="label">Name:</div>
				<div class="user-input">
					<input type="text" name="name" placeholder="Enter your name">
				</div>
			</div>
			<div class="input-group">
				<div class="label">Choose your role:</div>
				<div class="user-input">
					<select name="role" id="role">
						<option value="student">Student</option>
						<option value="lecturer">Lecturer</option>
						<option value="staff">Staff</option>
						<option value="admin">Admin</option>
					</select>
				</div>
			</div>
			<div class="input-group">
				<div class="label">Email:</div>
				<div class="user-input">
					<input type="text" name="email" placeholder="Enter your email">
				</div>
			</div>
			<div class="input-group">
				<div class="label">Password:</div>
				<div class="user-input">
					<input type="password" name="password" placeholder="Enter your password">
				</div>
			</div>
			<div class="input-group">
				<div class="label">Confirm Password:</div>
				<div class="user-input">
					<input type="password" name="confirmPassword" placeholder="Confirm your password">
				</div>
			</div>
			<div class="register-button">
				<input type="submit" value="REGISTER">
			</div>
			<div class="login-link">
				<a href="Login.jsp" class="login-button">Already have an account? Login here</a>
			</div>
		</div>
	</form>
	</div>
    </div>
</body>
</html>
