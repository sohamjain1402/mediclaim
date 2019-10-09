package mediclaim;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Claim_Update
 */
@WebServlet("/Claim_Update")
public class Claim_Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Claim_Update() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
       try{
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mediclaim","root" , "root");
			
			PreparedStatement ps=con.prepareStatement("select * from Claim_Registration where E_ID=? and Claim_Count=?");
			
			ps.setString(1,request.getParameter("Employee_ID"));
			System.out.println(request.getParameter("Employee_ID"));
			ps.setString(2,request.getParameter("Claim_No"));
			System.out.println(request.getParameter("Employee_ID"));
			ResultSet rs=ps.executeQuery();
			
			Claim_Bean cu=new Claim_Bean();
			
			if(rs.next())	
			{
				
			cu.setE_id(rs.getString("E_ID"));  //setbeanvariable(local variable) 
			cu.setE_name(rs.getString ("E_Name"));
			cu.setE_relation(rs.getString ("E_Relation"));
		    cu.setE_doa(rs.getString("E_Doa"));
		    cu.setE_dod(rs.getString("E_Dod"));
		    cu.setHospital_name(rs.getString("Hospital_Name"));
		    cu.setDoctor_name(rs.getString("Doctor_Name"));
		    cu.setHospital_fees(rs.getString("Hospital_Fees"));
		    cu.setPathology_fees(rs.getString("Pathology_Fees"));
		    cu.setChemist_fees(rs.getString("Chemist_Fees"));
		    cu.setMiscellaneous_fees(rs.getString("Miscellaneous_Fees"));
		    cu.setBill_count(rs.getString("Bill_Count"));
		    cu.setTotal_bill(rs.getString("Total_Bill"));
		    cu.setClaim_count(rs.getString("Claim_Count"));		
		    cu.setClaim_status(rs.getString("Claim_Status"));
			} 
		
		       request.setAttribute("claim_update", cu);
				
				
				RequestDispatcher rd=request.getRequestDispatcher("Claim_Update.jsp");
				rd.forward(request,response);
				
			
	
		}
		catch (Exception e)
		{
		e.printStackTrace();	

		}
		
	}

}
