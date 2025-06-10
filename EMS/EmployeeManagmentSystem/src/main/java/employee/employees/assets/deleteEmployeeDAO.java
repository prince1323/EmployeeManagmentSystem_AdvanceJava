package employee.employees.assets;
import java.sql.Connection;
import java.sql.PreparedStatement;

import DatabaseAssets.*;

public class deleteEmployeeDAO 
{
	int k;
	
	public int deleteEmployee(String id) {
		
		try 
		{
			Connection con = DBConnection.getConnectionLink();
			PreparedStatement ps = con.prepareStatement("delete from employeeManagmentSystemEmployeeTable1 where empid = ?");
			ps.setString(1, id);
			
			k = ps.executeUpdate();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		
		
		return k;
	}

}
