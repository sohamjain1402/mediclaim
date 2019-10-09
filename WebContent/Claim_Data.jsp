<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@  page import="java.sql.*" %>
     <%@page import="mediclaim.Claim_Bean" %>
     <%@  page import="javax.servlet.http.*" %>
     <%@  page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

Claim_Bean Bean_Data = (Claim_Bean)session.getAttribute("claim_bean");

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mediclaim","root" , "root");
	PreparedStatement ps=con.prepareStatement("select * from Claim_Registration where Claim_Status=?");
	ps.setString(1,"submitted");
	ResultSet rs=ps.executeQuery();
	ArrayList Claim_List = new ArrayList();
			while(rs.next())
	{
		String  eid=rs.getString("E_ID");
		String  ename=rs.getString ("E_Name");
		String  erelation=rs.getString ("E_Relation");
		String  doa= rs.getString("E_Doa");
		String  dod= rs.getString("E_Dod");
		String  hospitalname= rs.getString("Hospital_Name");
		String  doctorname= rs.getString("Doctor_Name");
		String  hospitalfees= rs.getString("Hospital_Fees");
		String  pathologyfees= rs.getString("Pathology_Fees");
		String  chemistfees= rs.getString("Chemist_Fees");
		String  miscellaneousfees= rs.getString("Miscellaneous_Fees");
		String  billcount= rs.getString("Bill_Count");
		String  totalbill= rs.getString("Total_Bill");
		String  claimcount= rs.getString( "Claim_Count");
		String  claimstatus= rs.getString( "Claim_Status");
		
		Claim_Bean cb=new Claim_Bean();
		
		cb.setE_id(eid);  //setbeanvariable(local variable) 
		cb.setE_name(ename);
		cb.setE_relation(erelation);
	    cb.setE_doa(doa);
	    cb.setE_dod(dod);
	    cb.setHospital_name(hospitalname);
	    cb.setDoctor_name(doctorname);
	    cb.setHospital_fees(hospitalfees);
	    cb.setPathology_fees(pathologyfees);
	    cb.setChemist_fees(chemistfees);
	    cb.setMiscellaneous_fees(miscellaneousfees);
	    cb.setBill_count(billcount);
	    cb.setTotal_bill(totalbill);
	    cb.setClaim_count(claimcount);
	    cb.setClaim_status(claimstatus);
	    Claim_List.add(cb);
	} 
        session.setAttribute("claim_data",Claim_List);//("key", object)
		
		
		RequestDispatcher rd=request.getRequestDispatcher("Claim_Submit.jsp");
		rd.forward(request,response);
		
	
	
	
}
catch (Exception e)
{
e.printStackTrace();	

}



%>

</body>
</html>