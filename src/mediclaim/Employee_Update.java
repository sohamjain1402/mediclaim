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

/**
 * Servlet implementation class Employee_Update
 */
@WebServlet("/Employee_Update")
public class Employee_Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Employee_Update() {
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
			PreparedStatement ps=con.prepareStatement("select * from employee where E_ID=?");
			ps.setString(1,request.getParameter("E_ID"));
			
			ResultSet rs=ps.executeQuery();
			Employee_Bean ue=new Employee_Bean();
			
		if(rs.next())
			{
						
				ue.setE_id(rs.getString("E_ID"));  //setbeanvariable(local variable) 
				ue.setE_fname(rs.getString("E_Fname"));
				ue.setE_lname(rs.getString("E_Lname"));
			    ue.setE_dob(rs.getString("E_Dob"));
			    ue.setE_doj(rs.getString("E_Doj"));
			    ue.setE_gender(rs.getString("E_Gender"));
			    ue.setE_address(rs.getString("E_address"));
			    ue.setE_email(rs.getString("E_Email"));
			    ue.setE_contact(rs.getString("E_Contact"));
			    ue.setE_department(rs.getString("E_Department"));
			    ue.setE_designation(rs.getString("E_Designation"));
			    ue.setE_coverage(rs.getString("E_Coverage"));
			   
			    
			} 
		       request.setAttribute("update_employee", ue);
				
				
				RequestDispatcher rd=request.getRequestDispatcher("Employee_Update.jsp");
				rd.forward(request,response);
				
			
	
		}
		catch (Exception e)
		{
		e.printStackTrace();	

		}
		
		
	}

}
