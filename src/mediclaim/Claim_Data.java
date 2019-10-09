package mediclaim;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Claim_Data
 */
@WebServlet("/Claim_Data")
public class Claim_Data extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Claim_Data() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
         HttpSession session=request.getSession(true);
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



		
	}

}
