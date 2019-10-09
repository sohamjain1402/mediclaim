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
 * Servlet implementation class View_Employee
 */
@WebServlet("/View_Employee")
public class View_Employee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public View_Employee() {
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
		Employee_Bean Employee_Data = (Employee_Bean)session.getAttribute("employee_bean");
		



		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mediclaim","root" , "root");
			PreparedStatement ps=con.prepareStatement("select * from employee where E_ID=?");
			ps.setString(1,request.getParameter("E_ID"));
			
			ResultSet rs=ps.executeQuery();
			
			ArrayList  View_Employee = new ArrayList();
		while(rs.next())
			{
						
				Employee_Bean ve=new Employee_Bean();
			
				ve.setE_id(rs.getString("E_ID"));  //setbeanvariable(local variable) 
				ve.setE_fname(rs.getString("E_Fname"));
				ve.setE_lname(rs.getString("E_Lname"));
			    ve.setE_dob(rs.getString("E_Dob"));
			    ve.setE_doj(rs.getString("E_Doj"));
			    ve.setE_gender(rs.getString("E_Gender"));
			    ve.setE_address(rs.getString("E_address"));
			    ve.setE_email(rs.getString("E_Email"));
			    ve.setE_contact(rs.getString("E_Contact"));
			    ve.setE_department(rs.getString("E_Department"));
			    ve.setE_designation(rs.getString("E_Designation"));
			    ve.setE_coverage(rs.getString("E_Coverage"));
			   
			     View_Employee.add(ve);
			} 
		        session.setAttribute("View_Employee", View_Employee);//("key", object)
				
				
				RequestDispatcher rd=request.getRequestDispatcher("View_Employee.jsp");
				rd.forward(request,response);
				
			
			
			
		}
		catch (Exception e)
		{
		e.printStackTrace();	

		}
		
	}

}
