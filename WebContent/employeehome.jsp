<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="mediclaim.Employee_Bean" %>
    <%@page import="mediclaim.Claim_Bean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Home</title>
</head>
<body >
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


<%Employee_Bean Bean_Data = (Employee_Bean)session.getAttribute("employee_bean");
String E_ID =Bean_Data.getE_id(); %>
<div class="topnav">
	<a class="active" href="Claim_Registration.jsp">Register Claim</a>
	<a href="Claim_History?Employee_ID=<%=E_ID%>">Claim History</a>
	<a href="employeelogin.jsp">LOG Out</a>
</div>

<br><br><br>
 
Welcome :
<%
String E_Fname =Bean_Data.getE_fname();
String E_Lname =Bean_Data.getE_lname();
String E_Dob =Bean_Data.getE_dob();
String E_Doj =Bean_Data.getE_doj();
String E_Gender =Bean_Data.getE_gender();
String E_Address =Bean_Data.getE_address();
String E_Email =Bean_Data.getE_email();
String E_Contact =Bean_Data.getE_contact();
String E_Department =Bean_Data.getE_department();
String E_Designation =Bean_Data.getE_designation();
String E_Coverage =Bean_Data.getE_coverage();

out.println(E_Fname);
out.println(E_Lname);
%>
<br>
<br>
Employee ID :
<%
out.println(E_ID);
%>
<br><br>
Date Of Birth :
<%
out.println(E_Dob);
%>
<br><br>
Date Of Joining :
<%
out.println(E_Doj);
%>
<br><br>
Gender :
<%
out.println(E_Gender);
%>
<br><br>
Address :
<%
out.println(E_Address);
%>
<br><br>
Email :
<%
out.println(E_Email);
%>
<br><br>
Contact No. :
<%
out.println(E_Contact);
%>
<br><br>
Department :
<%
out.println(E_Department);
%>
<br><br>
Designation :
<%
out.println(E_Designation);
%>
<br><br>
Coverage :
<%
out.println(E_Coverage);

%>

</body>
</html>