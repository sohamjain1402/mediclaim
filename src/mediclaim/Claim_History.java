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
 * Servlet implementation class Claim_History
 */
@WebServlet("/Claim_History")
public class Claim_History extends HttpServlet {
	public static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Claim_History() {
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
		HttpSession session=request.getSession(true);
		Claim_Bean Bean_Data = (Claim_Bean)session.getAttribute("claim_bean");
		



		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mediclaim","root" , "root");
			PreparedStatement ps=con.prepareStatement("select * from Claim_Registration where E_ID=?");
			
			ps.setString(1,request.getParameter("Employee_ID"));
			
			ResultSet rs=ps.executeQuery();
			
			ArrayList  Claim_History = new ArrayList();
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
				
				Claim_Bean ch=new Claim_Bean();
				
				ch.setE_id(eid);  //setbeanvariable(local variable) 
				ch.setE_name(ename);
				ch.setE_relation(erelation);
			    ch.setE_doa(doa);
			    ch.setE_dod(dod);
			    ch.setHospital_name(hospitalname);
			    ch.setDoctor_name(doctorname);
			    ch.setHospital_fees(hospitalfees);
			    ch.setPathology_fees(pathologyfees);
			    ch.setChemist_fees(chemistfees);
			    ch.setMiscellaneous_fees(miscellaneousfees);
			    ch.setBill_count(billcount);
			    ch.setTotal_bill(totalbill);
			    ch.setClaim_count(claimcount);
			    ch.setClaim_status(claimstatus);
			     Claim_History.add(ch);
			} 
		        session.setAttribute("Claim_History", Claim_History);//("key", object)
				
				
				RequestDispatcher rd=request.getRequestDispatcher("Claim_History.jsp");
				rd.forward(request,response);
				
			
			
			
		}
		catch (Exception e)
		{
		e.printStackTrace();	

		}



	}

}
