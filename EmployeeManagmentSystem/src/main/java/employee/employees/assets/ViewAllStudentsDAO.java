package employee.employees.assets;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DatabaseAssets.*;

public class ViewAllStudentsDAO 
{
	public ArrayList<EmployeeBean> empList = new ArrayList<>();
	
	public ArrayList<EmployeeBean> getAllEmployeeList()
	{
		try 
		{
			Connection con = DBConnection.getConnectionLink();
			PreparedStatement ps = con.prepareStatement("select * from employeeManagmentSystemEmployeeTable1");
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				EmployeeBean eb = new EmployeeBean();

				eb.setEmpId(rs.getString(1));
				eb.setEmpName(rs.getString(2));
				eb.setEmpDepartment(rs.getString(3));
				eb.setEmpDesignation(rs.getString(4));
				eb.setEmpDOJ(rs.getString(5));
				
				empList.add(eb);
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return empList;
	}

}
