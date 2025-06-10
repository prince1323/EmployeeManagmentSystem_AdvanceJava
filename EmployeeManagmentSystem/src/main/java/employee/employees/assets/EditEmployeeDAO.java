package employee.employees.assets;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DatabaseAssets.DBConnection;

public class EditEmployeeDAO 
{
	public EmployeeBean getEmployeeWithId(String id) {
		
		EmployeeBean eb = null;
		
		try 
		{
			Connection con = DBConnection.getConnectionLink();
			PreparedStatement ps = con.prepareStatement("select * from employeeManagmentSystemEmployeeTable1 where empid = ?");
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				eb = new EmployeeBean();
				eb.setEmpId(id);
				eb.setEmpName(rs.getString(2));
				eb.setEmpDepartment(rs.getString(3));
				eb.setEmpDesignation(rs.getString(4));
				eb.setEmpDOJ(rs.getString(5));
				
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return eb;
	}
	
	public int updateEmployee (EmployeeBean e) {
		int k=0;
		
		
		try 
		{
			Connection con = DBConnection.getConnectionLink();
			PreparedStatement ps = con.prepareStatement("update employeeManagmentSystemEmployeeTable1 set empname = ?, empdepartment = ?, empdesignation = ?, empdoj = ? where empid = ?");
			ps.setString(1, e.getEmpName());
			ps.setString(2, e.getEmpDepartment());
			ps.setString(3, e.getEmpDesignation());
			ps.setString(4, e.getEmpDOJ());
			ps.setString(5, e.getEmpId());
			
			k = ps.executeUpdate();
			
			
		} 
		catch (Exception e2) 
		{
			e2.printStackTrace();
		}
		
		return k;
	}

}
