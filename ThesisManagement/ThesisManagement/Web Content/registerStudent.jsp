<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<head>
<title>Student Registration</title>

<meta charset="UTF-8">
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
</head>
</head>

<body>
	<div align="center">
		<h3>Enter your data below</h3>
		<form action="<%=request.getContextPath()%>/Register" method="post">
			<table>
				<tr>
					<td><input type="text" name="email" placeholder="E-mail" /></td>
				</tr>
				<tr>
					<td><input type="password" name="password" id="password" placeholder="Password" /></td>
				</tr>
				<tr>
					<td><input type="password" name="confirm_password" id="confirm_password" placeholder="Confirm Password" /></td>
				</tr>
				<tr>
					<td><input type="text" name="first_name" placeholder="First Name" /></td>
				</tr>
				<tr>
					<td><input type="text" name="last_name" placeholder="Last Name" /></td>
				</tr>
				<tr>
					<td><input type="text" name="phone_number" placeholder="Phone Number" /></td>
				</tr>
				<tr>
					<td><input type="text" name="registration_number" placeholder="Registration Number" /></td>
				</tr>
			</table>
			<input type="submit" value="Register" />
		</form>
	</div>
<script type="text/javascript" src="Javascript/confirmPassword.js"></script>
</body>
</html>
