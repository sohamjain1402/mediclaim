<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"<html>
<head>
<title>Login Page</title>
</head>
<body><br>
<br>
<br>
<%
String msd=(String)request.getAttribute("key");
if (msd!=null)
{
	%>
	<div class="error" style="text-align: center; color:red;"><font size=4></font>
	<%
	
out.println(msd);	
}
%>
</div>
<form name="loginForm" method="post" action="Employee_Validation.jsp">
<table width="40%"  align="center" style="margin-top:100px;">

<tr>
<td colspan=2><center><font size=6><b>EMPLOYEE LOGIN</b></font></center></td>
</tr>

<tr>
<td>Username:</td>
<td><input type="text" size=40 name="E_ID" placeholder="Type Id Here"></td>
</tr>

<tr>
<td>Password:</td>
<td><input type="Password" size=40 name="E_Password" required="password"></td>
</tr>

<tr>
<td ><input type="Reset"></td>
<td><input type="submit" onclick="return check(this.form)" value="Login"></td>
</tr>

</table>
</form>
</body>
</html>