<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="mediclaim.Claim_Bean" %>
    <%@ page import="mediclaim.Employee_Bean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Claim_Bean Bean_Data =(Claim_Bean) request.getAttribute("claim_update");
String eid = Bean_Data.getE_id();
%>

<form action="Claim_Form_Controller?Employee_ID=<%=eid%>&Claim_No=<%=Bean_Data.getClaim_count()%>"style="text-align: center" method="post">
<h1>Update Your Claim</h1>
<p>Please fill in this form to Update your Claim</p>
<hr>

Employee Name :
<input type="text" name="E_Name" value=<%=Bean_Data.getE_name()%> /><br><br>
Relation :
<input type="text" name="E_Relation"  required value=<%=Bean_Data.getE_relation() %> /><br><br>
 Date Of Admit :
 <input type="date" name="E_Doa" value=<%=Bean_Data.getE_doa() %> /><br><br>
 Date Of Discharge :
 <input type="date" name="E_Dod"  value=<%=Bean_Data.getE_dod() %> /><br><br>
 Hospital Name :
 <input type="text" name="Hospital_Name" value=<%=Bean_Data.getHospital_name() %> /><br><br>
 Doctor's Name  :  
<input type="text" name="Doctor_Name" value=<%=Bean_Data.getDoctor_name() %> /><br><br>
 Hospital Fees :
<input type="number" placeholder="Enter fees" name="Hospital_Fees" required value=<%=Bean_Data.getHospital_fees() %>/><br><br>
Pathology Fees :
<input type="number" name="Pathology_Fees" requiredvalue=<%=Bean_Data.getPathology_fees() %> /><br><br>
Chemist Fees :
<input type="number" name="Chemist_Fees" required value=<%=Bean_Data.getChemist_fees() %> /><br><br>
Miscellaneous Fees :
<input type="number" name="Miscellaneous_Fees" value=<%=Bean_Data.getMiscellaneous_fees() %> /><br><br>
Bill Count :
<input type="number" placeholder="total No. Of Bills "name="Bill_Count" value=<%=Bean_Data.getBill_count() %> /><br><br>
Total bill :
<input type="number" name="Total_Bill" onclick="add()" /><br><br>
<button type="submit" >  Update  </button> 
<button type="reset">  Clear  </button>
</form>

</body>
</html>