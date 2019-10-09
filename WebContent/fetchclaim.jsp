<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@  page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fetch Claim </title>
</head>
<body>
<%

String  EmpID= request.getParameter("E_ID");
String  EmpName= request.getParameter("E_Name");
String  EmpRelation= request.getParameter("E_Relation");
String  DOA= request.getParameter("E_Doa");
String  DOD= request.getParameter("E_Dod");
String  Hospital= request.getParameter("Hospital_Name");
String  Doctor= request.getParameter("Doctor_Name");
String  HospitalFees= request.getParameter("Hospital_Fees");
String  PathologyFees= request.getParameter("Pathology_Fees");
String  ChemistFees= request.getParameter("Chemist_Fees");
String  MiscellaneousFees= request.getParameter("Miscellaneous_Fees");
String  BillCount= request.getParameter("Bill_Count");
String  TotalBill= request.getParameter("Total_Bill");



%>
<%
try{ int Claim_Count=1;
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mediclaim","root" , "root");
	PreparedStatement cc=con.prepareStatement("select Claim_Count from Claim_Registration where E_ID=?");
	cc.setString(1,EmpID);
	ResultSet rs=cc.executeQuery();
	 while(rs.next())
	 {
		 Claim_Count++;
		 
		 
	 }	 
	 
	PreparedStatement ps=con.prepareStatement("insert into Claim_Registration values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	ps.setString(1,EmpID);
	ps.setString(2,EmpName);
	ps.setString(3,EmpRelation);
	ps.setString(4,DOA);
	ps.setString(5,DOD);
	ps.setString(6,Hospital);
	ps.setString(7,Doctor);
	ps.setString(8,HospitalFees);
	ps.setString(9,PathologyFees);
	ps.setString(10,ChemistFees);
	ps.setString(11,MiscellaneousFees);
	ps.setString(12,BillCount);
	ps.setString(13,TotalBill);
	ps.setInt(14,Claim_Count);
	ps.setString(15, "submitted");
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