<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@  page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Using get method  to  read form data</title>
</head>
<body>
<%

String status=" ";
String EmpID=request.getParameter("E_ID");

String Efname=request.getParameter("E_Fname");

String Elname=request.getParameter("E_Lname");

String EDob=request.getParameter("E_Dob");

String EDoj=request.getParameter("E_Doj");

String EGender=request.getParameter("E_Gender");

String EAddress=request.getParameter("E_address");

String EEmail=request.getParameter("E_Email");

String EContact=request.getParameter("E_Contact");

String EDepartment=request.getParameter("E_Department");

String EDesignation=request.getParameter("E_Designation");

String ECoverage=request.getParameter("E_Coverage");
 

%>

<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mediclaim","root","root");
	PreparedStatement ps=con.prepareStatement("insert into employee values(?,?,?,?,?,?,?,?,?,?,?,?,1234)");
	ps.setString(1,EmpID);
	ps.setString(2,Efname);
	ps.setString(3,Elname);
	ps.setString(4,EDob);
	ps.setString(5,EDoj);
	ps.setString(6,EGender);
	ps.setString(7,EAddress);
	ps.setString(8,EEmail);
	ps.setString(9,EContact);
	ps.setString(10,EDepartment);
	ps.setString(11,EDesignation);
	ps.setString(12,ECoverage);
	ps.executeUpdate();
	
	out.println("Your Data Has Been Saved Succesfully");
}
catch (Exception e)
{
e.printStackTrace();	

}


%>
</body>
</html>