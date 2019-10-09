<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
      <%@page import="mediclaim.Employee_Bean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Accountant Validation</title>
</head>
<body>
<% 
String Acc_ID =request.getParameter("AccountantID");
out.println(Acc_ID);
String Acc_Password = request.getParameter("ACpassword");
out.println(Acc_Password);

%>

<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mediclaim","root","root");
	PreparedStatement ps=con.prepareStatement("select * from accountant where AccountantID=? and ACpassword=?");
	ps.setString(1, Acc_ID);
	ps.setString(2, Acc_Password);
	ResultSet rs=ps.executeQuery();
	
	if (rs.next())
	{
		
		RequestDispatcher rd= request.getRequestDispatcher("accountanthome.jsp");
		rd.forward(request, response);
		
	}
	
	
	else{
		RequestDispatcher rd= request.getRequestDispatcher("accountantlogin.jsp");
		rd.forward(request, response);
		
		
	}
	
}



catch (Exception e)
{
	
e.printStackTrace();
}


%>
</body>
</html>