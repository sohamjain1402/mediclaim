<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="mediclaim.Employee_Bean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Accountant Home</title>
</head>
<body>
<%Employee_Bean Employee_Data = (Employee_Bean)session.getAttribute("employee_bean");
 %>
<div class="topnav">
	<a class="active" href="registrationEMP.jsp">Register Employee</a>
	<a href="Employee_List">Employee List</a>
	<a href="Claim_Data">Claim List</a>
	<a href="accountantlogin.jsp">Log Out</a>
</div>
<style>
.topnav {
  background-color: #333;
  overflow: hidden;
}

/* Style the links inside the navigation bar */
.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

/* Change the color of links on hover */
.topnav a:hover {
  background-color: #ddd;
  color: black;
}

/* Add a color to the active/current link */
.topnav a.active {
  background-color: #4CAF50;
  color: white;
}
</style>
</body>
</html>