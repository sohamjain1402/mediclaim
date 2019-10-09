<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

try{
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mediclaim","root","root");
	
	PreparedStatement ps=con.prepareStatement("select AccountantID ,ACpassword from Accountant");
	ResultSet rs = ps.executeQuery();

while(rs.next()){
 out.println(rs.getString("AccountantID"));
 out.println(rs.getString("ACpassword")); 
}
}catch (Exception e){
	e.printStackTrace();
}
%>




</table>

</body>
</html>