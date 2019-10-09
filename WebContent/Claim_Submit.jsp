<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="mediclaim.Claim_Bean" %>
     <%@  page import="java.util.ArrayList" %>
      <%@  page import="javax.servlet.http.*" %>
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
	
	ArrayList Claim_Data =(ArrayList)session.getAttribute("claim_data");%>
	<tr>
<th>EmployeeID</th>
<th>EmployeeName</th>

<th>Date of Admit</th>
<th>Date of Discharge</th>
<th>Hospital Name</th>

<th>Bill Count</th>
<th>Total Bill</th>
<th>Claim Count</th>

</tr>
<% 	
	for(int i=0; i<Claim_Data.size();i++)
	{
	
Claim_Bean Bean_Data = (Claim_Bean)Claim_Data.get(i);



%>
<tr>
<td>
<%
out.println(Bean_Data.getE_id());%>
</td>
<td>
<% 
out.println(Bean_Data.getE_name());%></td>


<td><% out.println(Bean_Data.getE_doa());%></td>

<td><%out.println(Bean_Data.getE_dod());%></td>

<td><%out.println(Bean_Data.getHospital_name());%></td>


<td><%out.println(Bean_Data.getBill_count());%></td>

<td><%out.println(Bean_Data.getTotal_bill());%></td>

<td><%out.println(Bean_Data.getClaim_count());%></td>
<td><a href="View_Claim?E_ID=<%=Bean_Data.getE_id()%>&Claim_No=<%=Bean_Data.getClaim_count()%>">View</a></td>
</tr>

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