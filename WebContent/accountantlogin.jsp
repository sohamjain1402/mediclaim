<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

     pageEncoding="ISO-8859-1"%>
      
<html>
<head>
<title>Login Page</title>
</head>
<body><br>
<br>
<br>
<style>
/* Bordered form */
form {
  border: 3px solid #f1f1f1;
}

/* Full-width inputs */
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
button {
  background-color: blue;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

/* Add a hover effect for buttons */
button:hover {
  opacity: 0.8;
}

/* Extra style for the cancel button (red) */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: blue;
}

/* Center the avatar image inside this container */
.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
}

/* Avatar image */
img.avatar {
  width: 40%;
  border-radius: 50%;
}

/* Add padding to containers */
.container {
  padding: 16px;
}

/* The "Forgot password" text */
span.psw {
  float: right;
  padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
    display: block;
    float: none;
  }
  .cancelbtn {
    width: 100%;
  }
}

</style>
<form name="loginForm" method="post" action="Accountant_Validation">
<table width="20%"  align="center" style="marginng-top:60px;">

<tr>
<td colspan=2><center><font size=4><b>ACCOUNTANT LOGIN</b></font></center></td>
</tr>

<tr>
<td>UserID:</td>
<td><input type="text" size=25 name="AccountantID" placeholder="Type Id Here"></td>
</tr>

<tr>
<td>Password:</td>
<td><input type="password" size=25 name="ACpassword" required="password"></td>
</tr>

<tr>
<td ><input type="Reset"></td>
<td><input type="submit" onclick="return check(this.form)" value="Login"></td>
</tr>

</table>
</form>
</body>
</html>
