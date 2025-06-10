package employee.employees.assets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class addEmployeeServlet
 */
@SuppressWarnings("serial")
@WebServlet("/addEmployeeServlet")
public class addEmployeeServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		EmployeeBean eb = new EmployeeBean();
		
		eb.setEmpId(req.getParameter("empID"));
		eb.setEmpName(req.getParameter("empName"));
		eb.setEmpDepartment(req.getParameter("empDept"));
		eb.setEmpDesignation(req.getParameter("empDesignation"));
		eb.setEmpDOJ(req.getParameter("empDOJ"));
		
//		PrintWriter out = res.getWriter();
//		out.println(eb.getEmpId());
//		out.println(eb.getEmpName());
//		out.println(eb.getEmpDepartment());
//		out.println(eb.getEmpDesignation());
//		out.println(eb.getEmpDOJ());
		
		HttpSession hs = req.getSession(false);
		
		if(hs == null) {
			req.getRequestDispatcher("adminSessionExpired.jsp").forward(req, res);
		}
		else {
			hs.setAttribute("addableEmployee", eb);
			
			int z = new AddEmployeeDAO().insertEmployee(eb, hs);
			
			if(z == 1) {
				
				req.getRequestDispatcher("SuccessfullyAdded.jsp").forward(req, res);
			}
			else {
				req.getRequestDispatcher("failed.jsp");
			}
		}
		
		
	}

}
