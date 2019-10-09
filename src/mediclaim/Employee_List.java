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
 * Servlet implementation class Employee_List
 */
@WebServlet("/Employee_List")
public class Employee_List extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Employee_List() {
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
			PreparedStatement ps=con.prepareStatement("select * from employee");
			
			
			ResultSet rs=ps.executeQuery();
			
			ArrayList  Employee_List = new ArrayList();
		while(rs.next())
			{
						
				Employee_Bean el=new Employee_Bean();
			
				el.setE_id(rs.getString("E_ID"));  //setbeanvariable(local variable) 
				el.setE_fname(rs.getString("E_Fname"));
				el.setE_lname(rs.getString("E_Lname"));
			    el.setE_dob(rs.getString("E_Dob"));
			    el.setE_doj(rs.getString("E_Doj"));
			    el.setE_gender(rs.getString("E_Gender"));
			    el.setE_address(rs.getString("E_address"));
			    el.setE_email(rs.getString("E_Email"));
			    el.setE_contact(rs.getString("E_Contact"));
			    el.setE_department(rs.getString("E_Department"));
			    el.setE_designation(rs.getString("E_Designation"));
			    el.setE_coverage(rs.getString("E_Coverage"));
			   
			     Employee_List.add(el);
			} 
		        session.setAttribute("Employee_List", Employee_List);//("key", object)
				
				
				RequestDispatcher rd=request.getRequestDispatcher("Employee_List.jsp");
				rd.forward(request,response);
				
			
			
			
		}
		catch (Exception e)
		{
		e.printStackTrace();	

		}


	}

}
