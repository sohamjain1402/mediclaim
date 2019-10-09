<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="mediclaim.Employee_Bean" %>
    <%@page import="mediclaim.Claim_Bean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Validation</title>
</head>
<body>
<%
String EmpID = request.getParameter("E_ID");
String Emp_Password = request.getParameter("E_Password");


%>

<%
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mediclaim","root","root");
	PreparedStatement ps=con.prepareStatement("select * from employee where E_ID=? and E_Password=?");
	ps.setString(1,EmpID);
	ps.setString(2,Emp_Password);
	ResultSet rs=ps.executeQuery();
	
	if(rs.next())
	{
		String Eid =rs.getString("E_ID"); //table column name
		String Efname =rs.getString("E_Fname");  //table column name
		String Elname =rs.getString("E_Lname");  //table column name
		String EDob =rs.getString("E_Dob");  //table column name
		String EDoj =rs.getString("E_Doj");  //table column name
		String EGender =rs.getString("E_Gender");  //table column name
		String EAddress =rs.getString("E_address");  //table column name
		String EEmail =rs.getString("E_Email");  //table column name
		String EContact =rs.getString("E_Contact");  //table column name
		String EDepartment =rs.getString("E_Department");  //table column name
		String EDesignation =rs.getString("E_Designation");  //table column name
		String ECoverage =rs.getString("E_Coverage");  //table column name
		String EPassword =rs.getString("E_Password");  //table column name
		Employee_Bean eb=new Employee_Bean();
		
		eb.setE_id(Eid);
		eb.setE_fname(Efname);
		eb.setE_lname(Elname);
		eb.setE_dob(EDob);
		eb.setE_doj(EDoj);
		eb.setE_gender(EGender);
		eb.setE_address(EAddress);
		eb.setE_email(EEmail);
		eb.setE_contact(EContact);
		eb.setE_department(EDepartment);
		eb.setE_designation(EDesignation);
		eb.setE_coverage(ECoverage);
		eb.setE_password(EPassword);
		
		
		session.setAttribute("employee_bean",eb);//("key", object)
		
		
		RequestDispatcher rd=request.getRequestDispatcher("employeehome.jsp");
		rd.forward(request,response);
		
	}
	else
	{
		
		RequestDispatcher rd=request.getRequestDispatcher("employeelogin.jsp");
		request.setAttribute("key", "Invalid user ID ");
		rd.forward(request,response);
	   
	}
	
	
	%>
	<%
}catch (Exception e)
{
	
	
	e.printStackTrace();
}
%>





</body>
</html>