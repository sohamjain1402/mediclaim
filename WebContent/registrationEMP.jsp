<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Employee Registration</title>
</head>
<body><br>
	<br>
	<br>
<form action="fetchregistration.jsp"style="text-align: center" method="post">
<h1>REGISTER</h1>
<p>Please fill in this form to create an account</p>
<hr>
Employee ID :
<input type="text" name="E_ID" required><br><br>
First Name :
<input type="text" name="E_Fname" required><br><br>
Last Name :
<input type="text" name="E_Lname"  required><br><br>
 Date Of Birth :
 <input type="date" name="E_Dob"><br><br>
 Date Of Joining :
 <input type="date" name="E_Doj"><br><br>
 Gender :
 <input type="text" name="E_Gender"><br><br>
 Address :  
<input type="text" name="E_address"><br><br>
 Email :
<input type="Email" placeholder="Enter Email" name="E_Email" required><br><br>
Contact No. :
<input type="number" name="E_Contact" required><br><br>
Department :
<input type="text" name="E_Department" required><br><br>
Designation :
<input type="text" name="E_Designation"><br><br>
Coverage :
<input type="number" name="E_Coverage"><br><br>
<button type="submit" >  Register  </button> 
<button type="reset">  Clear  </button>
</form>
</body>
</html>