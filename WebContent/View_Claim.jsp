<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="mediclaim.Claim_Bean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

Claim_Bean view_claim = (Claim_Bean)request.getAttribute("view_claim");%>
<br>
<br>
Employee ID :
<% out.println(view_claim.getE_id());%>
<br>
<br>
Employee Name :
<%out.println(view_claim.getE_name());%>
<br>
<br>
Employee Relation :
<%out.println(view_claim.getE_relation());%>
<br>
<br>
Date Of Admit :
<%out.println(view_claim.getE_doa());%>
<br>
<br>
Date Of Dischrage :
<%out.println(view_claim.getE_dod());%>
<br>
<br>
Hospital Name :
<%out.println(view_claim.getHospital_name());%>
<br>
<br>
Doctor Name :
<%out.println(view_claim.getDoctor_name());%>
<br>
<br>
Hospital Fees :
<%out.println(view_claim.getHospital_fees());%>
<br>
<br>
Pathology Fees :
<%out.println(view_claim.getPathology_fees());%>
<br>
<br>
Chemist Fees :
<%out.println(view_claim.getChemist_fees());%>
<br>
<br>
Miscellaneous Fees :
<%out.println(view_claim.getMiscellaneous_fees());%>
<br>
<br>
Total Bill :
<%out.println(view_claim.getTotal_bill());%>
<br>
<br>
Bill Count :
<%out.println(view_claim.getBill_count());%>
<br>
<br>
Claim Count :
<%out.println(view_claim.getClaim_count());%>
<br>
<button><a href="Claim_Processing?E_ID=<%=view_claim.getE_id() %>&status=<%="approve"%>&Claim_No=<%=view_claim.getClaim_count()%>">Approve</a></button>
<button><a href="Claim_Processing?E_ID=<%=view_claim.getE_id() %>&status=<%="reject"%>&Claim_No=<%=view_claim.getClaim_count()%>">Reject</a></button>
<button><a href="Claim_Processing?E_ID=<%=view_claim.getE_id() %>&status=<%="resend"%>&Claim_No=<%=view_claim.getClaim_count()%>">Resend</a></button>

</body>
</html>