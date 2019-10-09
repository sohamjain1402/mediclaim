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
	
	ArrayList  obj =(ArrayList)session.getAttribute("Employee_List");%>
	<tr>
<th>EmployeeID</th>
<th>EmployeeFName</th>

<th>EmployeeLName</th>

</tr>
<% 	
	for(int i=0; i<obj.size();i++)
	{
	
Employee_Bean eb = (Employee_Bean)obj.get(i);



%>
<tr>
<td>
<%
out.println(eb.getE_id());%>
</td>
<td>
<% 
out.println(eb.getE_fname());%></td>


<td><% out.println(eb.getE_lname());%></td>
<td><a href="View_Employee?E_ID=<%=eb.getE_id()%>">View</a></td>

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