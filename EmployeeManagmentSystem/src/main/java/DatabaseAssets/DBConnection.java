package DatabaseAssets;

import java.sql.*;

public class DBConnection 
{
	
	private static Connection con = null;
	
	static {
		try {
			Class.forName(dbInfo.driver);
			con = DriverManager.getConnection(dbInfo.dbUrl, dbInfo.dbUserName, dbInfo.dbPassword);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}

	
	public DBConnection() {
		super();
	}

	public static Connection getConnectionLink() {
		return con;
	}

}
