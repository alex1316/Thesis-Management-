<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.Dao"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
<html>

<head>
<title>Arrange Appointment</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">

<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"></script>
<script src="Javascript/loadSidebar.js"></script>

</head>

<body onload='loadHtml("side", "professorStudentSidebar.html")'>
	
	<div class="wrapper">
	
		<div id='side' class='side'></div>

		<!-- Page Content  -->
		<div id="content">
		
			<div class="container-fluid">
				<button type="button" id="sidebarCollapse" class="btn btn-info">
					<i class="fas fa-align-left"></i> 
					<span>Toggle Sidebar</span>
				</button>	
			</div>
			
			<br><br>
	<%
	HttpSession prof = request.getSession();
	String professor_email = prof.getAttribute("email").toString();
	
	HttpSession stud = request.getSession();
	String registration_number = stud.getAttribute("registration_number").toString();
	%>
	
	<div class="form">
		<h1>Arrange Appointment</h1>
		<form action="<%=request.getContextPath()%>/ArrangeAppointment" method="post">
		
			<input type="hidden" name="email" value=<%= professor_email %> />
			<input type="hidden" name="registration_number" value=<%= registration_number %> />
			<input type="text" name="reason" placeholder="Appointment Reason" />	
			<input type="datetime-local" name="datetime" />
			<input type="submit" value="Arrange" />
			
		</form>
	</div>
	
	</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="Javascript/sidebar.js"></script>
    
</body>
</html>
