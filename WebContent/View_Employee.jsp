<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@  page import="java.sql.*" %>
     <%@page import="mediclaim.Employee_Bean" %>
     <%@  page import="javax.servlet.http.*" %>
     <%@  page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table border=2>
<%
try{
	
	ArrayList  View_Employee =(ArrayList)session.getAttribute("View_Employee");%>
	<tr>
<th>EmployeeID</th>
<th>EmployeeFName</th>
<th>EmployeeLName</th>
<th>EmployeeDOB</th>
<th>EmployeeDOJ</th>
<th>EmployeeGender</th>
<th>EmployeeAddress</th>
<th>EmployeeEmail</th>
<th>EmployeeContact</th>
<th>EmployeeDepartment</th>
<th>EmployeeDesignation</th>
<th>EmployeeCoverage</th>

</tr>
<% 	
	for(int i=0; i<View_Employee.size();i++)
	{
	
Employee_Bean ebv = (Employee_Bean)View_Employee.get(i);



%>
<tr>
<td>
<%
String E_id = ebv.getE_id();
out.println(ebv.getE_id());%>
</td>
<td>
<% 
out.println(ebv.getE_fname());%></td>
<td><% out.println(ebv.getE_lname());%></td>
<td><% out.println(ebv.getE_dob());%></td>
<td><% out.println(ebv.getE_doj());%></td>
<td><% out.println(ebv.getE_gender());%></td>
<td><% out.println(ebv.getE_address());%></td>
<td><% out.println(ebv.getE_email());%></td>
<td><% out.println(ebv.getE_contact());%></td>
<td><% out.println(ebv.getE_department());%></td>
<td><% out.println(ebv.getE_designation());%></td>
<td><% out.println(ebv.getE_coverage());%></td>
<br>
<br>
<button><a href="Employee_Update?E_ID=<%=E_id%>">Update</a></button>

<br>
<%
}
%>
</table>


<%

}catch(Exception e)
{

e.printStackTrace();

}
%>

</body>
</html>