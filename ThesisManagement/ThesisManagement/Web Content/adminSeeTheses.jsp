<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.Dao"%>
<!DOCTYPE html>
<html>

<head>
<title>See Theses</title>
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

<body onload='loadHtml("side", "adminSidebar.html")'>
	
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
			
		<table style = "margin-left: auto; margin-right: auto">
		<thead>
			<tr>
				<td>Students Registration Number</td>
				<td>Students Name</td>
				<td>Professors Email</td>
				<td>Professors Name</td>
				<td>Thesis Title</td>
			</tr>
		</thead>
		
		<%
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/thesismanagement?useSSL = false", "root", "An534090");
			
			// get students data about the specific thesis
			Statement statement = connection.createStatement();
			String sql = "select * from thesismanagement.theses inner join thesismanagement.student on theses.registration_number = student.registration_number";
			ResultSet resultSet = statement.executeQuery(sql);
			
			// get professors data about the specific thesis
			Statement statement2 = connection.createStatement();
			String sql2 = "select * from thesismanagement.theses inner join thesismanagement.professor on theses.email = professor.email";
			ResultSet resultSet2 = statement2.executeQuery(sql2);
			
			while (resultSet.next() && resultSet2.next()) {
		%>
		<tbody>
			<tr>
				<td><%=resultSet.getString("registration_number")%></td>
				<td><%=resultSet.getString("first_name")%> <%=resultSet.getString("last_name")%></td>
				<td><%=resultSet.getString("email")%></td>
				<td><%=resultSet2.getString("first_name")%> <%=resultSet2.getString("last_name")%></td>
				<td><%=resultSet.getString("title")%></td>

				<td><a href="ThesisActions?registration_number=<%=resultSet.getString("registration_number")%>">
						<button type="button">Delete</button>
					</a>
				</td>
			</tr>
		</tbody>
		<%
		}
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>

	</table>
	
	</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript" src="Javascript/sidebar.js"></script>
	<script type="text/javascript" src="Javascript/confirmPassword.js"></script>
	
</body>
</html>
