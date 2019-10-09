<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Claim Registration</title>
</head>
<body>
<br>
	<br>
	<br>
	<script>
	function add()
	{
		var hospital =document.getElementById("Hospital_Fees").value;
		var pathology =document.getElementById("Pathology_Fees").value;
		var chemist =document.getElementById("Chemist_Fees").value;
		var miscellaneous =document.getElementById("Miscellaneous_Fees").value;
		var sum=parseDouble(hospital)+parseDouble(pathology)+parseDouble(chemist)+parseDouble(miscellaneous);
		document.getElementById("Total_Bill").value = sum;
	}
	</script>
<form action="fetchclaim.jsp"style="text-align: center" method="post">
<h1>REGISTER Your Claim</h1>
<p>Please fill in this form to Register your Claim</p>
<hr>
Employee ID :
<input type="text" name="E_ID" required /><br><br>
Employee Name :
<input type="text" name="E_Name" required /><br><br>
Relation :
<input type="text" name="E_Relation"  required /><br><br>
 Date Of Admit :
 <input type="date" name="E_Doa" /><br><br>
 Date Of Discharge :
 <input type="date" name="E_Dod" /><br><br>
 Hospital Name :
 <input type="text" name="Hospital_Name" /><br><br>
 Doctor's Name  :  
<input type="text" name="Doctor_Name" /><br><br>
 Hospital Fees :
<input type="number" placeholder="Enter fees" name="Hospital_Fees" required /><br><br>
Pathology Fees :
<input type="number" name="Pathology_Fees" required /><br><br>
Chemist Fees :
<input type="number" name="Chemist_Fees" required /><br><br>
Miscellaneous Fees :
<input type="number" name="Miscellaneous_Fees" /><br><br>
Bill Count :
<input type="number" placeholder="total No. Of Bills "name="Bill_Count" /><br><br>
Total bill :
<input type="number" name="Total_Bill" onclick="add()" /><br><br>
<button type="submit" >  Claim  </button> 
<button type="reset">  Clear  </button>
</form>

</body>
</html>