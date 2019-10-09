<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="mediclaim.Employee_Bean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Employee_Bean Bean_Data = (Employee_Bean)request.getAttribute("update_employee");
String E_ID = Bean_Data.getE_id();
%>

<form action="Employee_Form_Controller" method="post">

<h2>Update Employee Detail </h2>
<hr>
Employee ID :
<input type="text" name="E_ID"  value=<%=Bean_Data.getE_id() %> readonly><br><br>
First Name :
<input type="text" name="E_Fname" required value=<%=Bean_Data.getE_fname() %>><br><br>
Last Name :
<input type="text" name="E_Lname"  required value=<%=Bean_Data.getE_lname() %>><br><br>
 Date Of Birth :
 <input type="date" name="E_Dob" value=<%=Bean_Data.getE_dob() %>><br><br>
 Date Of Joining :
 <input type="date" name="E_Doj" value=<%=Bean_Data.getE_doj() %>><br><br>
 Gender :
 <input type="text" name="E_Gender" value=<%=Bean_Data.getE_gender() %>><br><br>
 Address :  
<input type="text" name="E_address" value=<%=Bean_Data.getE_address() %>><br><br>
 Email :
<input type="Email" placeholder="Enter Email" name="E_Email" required value=<%=Bean_Data.getE_email() %>><br><br>
Contact No. :
<input type="number" name="E_Contact" required value=<%=Bean_Data.getE_contact() %>><br><br>
Department :
<input type="text" name="E_Department" required value=<%=Bean_Data.getE_department() %>><br><br>
Designation :
<input type="text" name="E_Designation" value=<%=Bean_Data.getE_designation() %>><br><br>
Coverage :
<input type="number" name="E_Coverage" value=<%=Bean_Data.getE_coverage() %>><br><br>
<button type="submit" >  Update  </button> 
<button type="reset">  Clear  </button>

</form>
</body>
</html>