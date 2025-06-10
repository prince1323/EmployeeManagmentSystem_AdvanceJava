package employee.employees.assets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet implementation class viewEmployeesServlet
 */
@SuppressWarnings("serial")
@WebServlet("/viewEmployeesServlet")
public class viewEmployeesServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession hs = req.getSession(false);
		
		if(hs == null) {
			req.getRequestDispatcher("adminSessionExpired.jsp").forward(req, res);
		}
		else {
			ArrayList<EmployeeBean> empList = new ViewAllStudentsDAO().getAllEmployeeList();
			hs.setAttribute("employeeList", empList);
			req.getRequestDispatcher("displayEmployeeList.jsp").forward(req, res);
		}
	}
}
