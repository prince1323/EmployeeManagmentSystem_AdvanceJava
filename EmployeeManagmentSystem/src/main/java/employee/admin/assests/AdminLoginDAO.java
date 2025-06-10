package employee.admin.assests;

import java.sql.Connection;
import DatabaseAssets.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class AdminLoginDAO 
{
	public AdminBean adminBean = null;
	
	public AdminBean adminLogin(String s, String p) {
		
		try 
		{

			Connection con = DBConnection.getConnectionLink();
			PreparedStatement ps = con.prepareStatement("select * from employeeManagmentSystemAdminTable1 where username = ? and password = ?");
			ps.setString(1, s);
			ps.setString(2, p);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				adminBean = new AdminBean();
				adminBean.setfName(rs.getString(1)); // first name
				adminBean.setlName(rs.getString(2)); // last name
				adminBean.setuName(rs.getString(3)); // username
				adminBean.setuPass(rs.getString(4)); // password
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return adminBean;
	}

}
