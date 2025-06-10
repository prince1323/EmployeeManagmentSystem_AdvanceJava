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
 * Servlet implementation class deleteEmployeeServlet
 */
@WebServlet("/deleteEmployeeServlet")
public class deleteEmployeeServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String id = req.getParameter("id");
		
		HttpSession hs = req.getSession(false);
		
		if(hs == null) {
			req.getRequestDispatcher("adminSessionExpired.jsp").forward(req, res);
		}
		else {
			int k = new deleteEmployeeDAO().deleteEmployee(id);
			
			
			if(k > 0) {
				ArrayList<EmployeeBean> empList = (ArrayList<EmployeeBean>)hs.getAttribute("employeeList");
				int cnt = -1;
				for(EmployeeBean e : empList) {
					cnt++;
					if(e.getEmpId().equals(id)) {
						break;
					}
				}
				
				empList.remove(cnt);
				req.getRequestDispatcher("displayEmployeeList.jsp").forward(req, res);
			}
			else {
				req.getRequestDispatcher("failed.jsp").forward(req, res);
			}
		}
	}

}
