package employee.admin.assests;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@SuppressWarnings("serial")
@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		
		String userN = req.getParameter("username");
		String userP = req.getParameter("password");

		AdminBean ab = new AdminLoginDAO().adminLogin(userN, userP);
		

		if (ab == null) {
			req.getRequestDispatcher("failed.jsp").forward(req, res);
		} else {
			HttpSession hs = req.getSession();
			hs.setAttribute("adminLoginBean", ab);
			hs.setAttribute("adminName", ab.getfName());
			req.getRequestDispatcher("adminHome.jsp").forward(req, res);
		}
		
	}

}
