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
 * Servlet implementation class View_Claim
 */
@WebServlet("/View_Claim")
public class View_Claim extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public View_Claim() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mediclaim","root","root");
			PreparedStatement ps=con.prepareStatement("select * from Claim_Registration where E_ID=? and Claim_Count=?");
			ps.setString(1,request.getParameter("E_ID"));
			ps.setString(2,request.getParameter("Claim_No") );
			ResultSet rs=ps.executeQuery();
			
			if (rs.next())
			{
				
				Claim_Bean vc=new Claim_Bean();
				
				vc.setE_id(rs.getString("E_ID"));  //setbeanvariable(local variable) 
				vc.setE_name(rs.getString ("E_Name"));
				vc.setE_relation(rs.getString ("E_Relation"));
			    vc.setE_doa(rs.getString("E_Doa"));
			    vc.setE_dod(rs.getString("E_Dod"));
			    vc.setHospital_name(rs.getString("Hospital_Name"));
			    vc.setDoctor_name(rs.getString("Doctor_Name"));
			    vc.setHospital_fees(rs.getString("Hospital_Fees"));
			    vc.setPathology_fees(rs.getString("Pathology_Fees"));
			    vc.setChemist_fees(rs.getString("Chemist_Fees"));
			    vc.setMiscellaneous_fees(rs.getString("Miscellaneous_Fees"));
			    vc.setBill_count(rs.getString("Bill_Count"));
			    vc.setTotal_bill(rs.getString("Total_Bill"));
			    vc.setClaim_count(rs.getString( "Claim_Count"));
			    vc.setClaim_status(rs.getString( "Claim_Status"));
			    request.setAttribute("view_claim",vc);
				RequestDispatcher rd= request.getRequestDispatcher("View_Claim.jsp");
				rd.forward(request, response);
				
			}
			
			
			
			
		}



		catch (Exception e)
		{
			
		e.printStackTrace();
		}

		
		
		// TODO Auto-generated method stub
		
	}

}
