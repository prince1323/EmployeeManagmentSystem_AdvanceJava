package employee.employees.assets;

import java.sql.Connection;
import java.sql.PreparedStatement;
import DatabaseAssets.DBConnection;
import jakarta.servlet.http.HttpSession;

public class AddEmployeeDAO {
    EmployeeBean eb = null;

    public AddEmployeeDAO() {
        super();
    }
    
    // Pass HttpSession as a parameter
    public int insertEmployee(EmployeeBean e, HttpSession session) {
        try {
            Connection con = DBConnection.getConnectionLink();
            PreparedStatement ps = con.prepareStatement(
                "insert into employeeManagmentSystemEmployeeTable1 values (?,?,?,?,?)"
            );

            // Correctly get the session attribute
            eb = (EmployeeBean) session.getAttribute("addableEmployee");

            ps.setString(1, eb.getEmpId());
            ps.setString(2, eb.getEmpName());
            ps.setString(3, eb.getEmpDepartment());
            ps.setString(4, eb.getEmpDesignation());
            ps.setString(5, eb.getEmpDOJ());

            int k = ps.executeUpdate();
            
            if (k > 0) {
                return 1;
            }
        } catch (Exception e2) {
            e2.printStackTrace();
        }
        
        return 0;
    }
}
