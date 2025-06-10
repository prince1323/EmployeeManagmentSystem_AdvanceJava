package employee.employees.assets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class EditEmployeeServlet
 */
@SuppressWarnings("serial")
@WebServlet("/EditEmployeeServlet")
public class EditEmployeeServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession hs = req.getSession(false);
		if(hs == null){
			req.getRequestDispatcher("adminSessionExpired.jsp").forward(req, res);
		}
		else {
			// EditEmployeeServlet.java
			EditEmployeeDAO editEmployeeDAO = new EditEmployeeDAO();
			String empId = req.getParameter("id");
			EmployeeBean employee = editEmployeeDAO.getEmployeeWithId(empId);
			
			if(employee == null) {
				req.getRequestDispatcher("failed.jsp").forward(req, res);
			}
			else {
				req.setAttribute("employee", employee);
				req.getRequestDispatcher("editEmployee.jsp").forward(req, res);
			}
			
		}
	}

}
