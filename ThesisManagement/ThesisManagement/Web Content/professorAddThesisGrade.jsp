<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.Dao"%>
<!DOCTYPE html>
<html>

<head>
<title>Add Thesis Grade</title>
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
		HttpSession stud_email = request.getSession();
		String student_email = stud_email.getAttribute("student_email").toString();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/thesismanagement?useSSL = false", "root", "An534090");
			Statement statement = connection.createStatement();
			String sql = "select * from thesismanagement.student where email = '" + student_email + "'";
			ResultSet resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
		%>
		
		<div align="center">
			<form action="<%=request.getContextPath()%>/AddGrade" method="post">
			<table>
				<tr>
					<td>
						<input type="hidden" name="email" value="<%=resultSet.getString("email")%>" />
						<input type="hidden" name="comes_from" value="professor" />
					</td>
					<td><input type="text" name="lesson_name" value="Thesis" /></td>
					<td><input type="text" name="lesson_grade" placeholder="Lesson Grade" /></td>
				</tr>				
			</table>
			<input type="submit" value="Add Grade"/>
			</form>
		</div>
	</div>
	</div>
	
	<%
		}
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
	%>	
	

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="Javascript/sidebar.js"></script>
    
</body>
</html>
