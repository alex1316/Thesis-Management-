<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.Dao"%>
<!DOCTYPE html>
<html>

<head>
<title>Assign Thesis</title>
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
			
		<div align="center">
		<form action="<%=request.getContextPath()%>/ThesisActions" method="post">
		
		<select name="registration_number" class="form-control" style="width: 250px;">
			<option value="-1">Select student</option>
			<%		
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/thesismanagement?useSSL = false", "root", "An534090");
				Statement statement = connection.createStatement();
				
				// select only the students that don't already have a thesis assigned
				String sql = "SELECT * FROM thesismanagement.student t1 LEFT JOIN thesismanagement.theses t2 ON t2.registration_number = t1.registration_number WHERE t2.registration_number IS NULL";
				ResultSet resultSet = statement.executeQuery(sql);
				while (resultSet.next()) {
					%>
					<option value="<%=resultSet.getString("registration_number")%>"><%=resultSet.getString("first_name")%> <%=resultSet.getString("last_name")%> <%=resultSet.getString("registration_number")%></option>
					<%
				}
			connection.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
			%>
		</select>
		
		<br>
		
		<select name="email" class="form-control" style="width: 250px; ">
			<option value="-1">Select supervisor professor</option>
			<%		
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/thesismanagement?useSSL = false", "root", "An534090");
				Statement statement = connection.createStatement();
				String sql = "select * from thesismanagement.professor";
				ResultSet resultSet = statement.executeQuery(sql);
				while (resultSet.next()) {
					%>
					<option value="<%=resultSet.getString("email")%>"><%=resultSet.getString("first_name")%> <%=resultSet.getString("last_name")%> <%=resultSet.getString("email")%></option>
					<%
				}
			connection.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
			%>
		</select>
		
		<br>
		
		<h3>Thesis Details</h3>
		
		<br>
			
			<table>
				<tr>
					<td><input type="text" name="title" placeholder="Title" /></td>
				</tr>
				<tr>
					<td><input type="text" name="coding_language" placeholder="Coding Language" /></td>
				</tr>
				<tr>
					<td><input type="text" name="technologies_used" placeholder="Technologies Used" /></td>
				</tr>
				<tr>
					<td><input type="datetime-local" name="start_date" placeholder="Start Date" /></td>
				</tr>
			</table>
			
			<input type="submit" value="Assign" />
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
