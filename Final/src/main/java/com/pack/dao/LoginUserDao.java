package  com.pack.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.pack.model.LoginUserBean;

public class LoginUserDao {

	public String check(LoginUserBean l) {
		
		String uname=l.getUname();
		String password=l.getPassword();
		
		String unameDB="";
		String passwordDB="";
		String perm="";
		
		try{
			Connection con=MySqlConn.getCon();
			Statement statement = con.createStatement();
			ResultSet resultSet = statement.executeQuery("Select LoginID,Password,perm from UserSetup where status='Y'");
		    			
			while(resultSet.next())
			{
				unameDB=resultSet.getString("LoginID");
				passwordDB=resultSet.getString("Password");
				perm=resultSet.getString("perm");
				
				if(uname.equals(unameDB) && password.equals(passwordDB) && perm.equals("Y"))
				{
					return "Success";
				}
				else if(uname.equals(unameDB) && password.equals(passwordDB) && perm.equals("N"))
				{
					return"Change";
				}
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		
		}
		return "Fail";
	}
			
			
	

}

