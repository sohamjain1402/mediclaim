package mediclaim;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class Accountant_Validation
 */
@WebServlet("/Accountant_Validation")
public class Accountant_Validation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Accountant_Validation() {
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
		
		PrintWriter out = response.getWriter();
		String Acc_ID =request.getParameter("AccountantID");
		
		String Acc_Password = request.getParameter("ACpassword");


	

		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mediclaim","root","root");
			PreparedStatement ps=con.prepareStatement("select * from accountant where AccountantID=? and ACpassword=?");
			ps.setString(1, Acc_ID);
			ps.setString(2, Acc_Password);
			ResultSet rs=ps.executeQuery();
			
			if (rs.next())
			{
				
				RequestDispatcher rd= request.getRequestDispatcher("accountanthome.jsp");
				rd.forward(request, response);
				
			}
			
			
			else{
				RequestDispatcher rd= request.getRequestDispatcher("accountantlogin.jsp");
				request.setAttribute("error" , "Invalid User ID or Password");
				rd.forward(request, response);
				
				
			}
			
		}



		catch (Exception e)
		{
			
		e.printStackTrace();
		}


		
	}

}
