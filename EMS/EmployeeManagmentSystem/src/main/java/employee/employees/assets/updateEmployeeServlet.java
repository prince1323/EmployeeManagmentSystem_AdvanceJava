package employee.employees.assets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class UpdateEmployeeServlet
 */
@SuppressWarnings("serial")
@WebServlet("/updateEmployeeServlet")
public class updateEmployeeServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		 String id = req.getParameter("empID");
		 String name = req.getParameter("empName");
		 String dept = req.getParameter("empDept");
		 String desig = req.getParameter("empDesignation");
		 String doj = req.getParameter("empDOJ");
		 
		 EmployeeBean eb = new EmployeeBean();
		 eb.setEmpId(id);
		 eb.setEmpName(name);
		 eb.setEmpDepartment(dept);
		 eb.setEmpDesignation(desig);
		 eb.setEmpDOJ(doj);
		 
		 int k = new EditEmployeeDAO().updateEmployee(eb);
		
		 if(k > 0) {
			 req.getRequestDispatcher("successfullyUpdated.jsp").forward(req, res);;
		 }
		 else {
			 req.getRequestDispatcher("operationFailed.jsp").forward(req, res);
		 }
		 
	}

}
