package employee.admin.assests;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class logoutServlet
 */
@WebServlet("/logoutServlet")
public class logoutServlet extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession hs = request.getSession(false);
		if(hs == null) {
			request.getRequestDispatcher("adminSessionExpired.jsp").forward(request, response);
		}
		else {
			hs.invalidate();
			request.getRequestDispatcher("adminLogin.html").forward(request, response);
		}
	}
}
