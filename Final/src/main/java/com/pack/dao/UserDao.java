package com.pack.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

//import com.pack.dao.MySqlConn;
import com.pack.model.User;



public class UserDao {
	
		
	
	public   int save(User u){
		int status=0;
		try{
			Connection con=MySqlConn.getCon();
			PreparedStatement ps=con.prepareStatement("Insert into  UserSetup (LoginID,Password,Department,UserAddress,UserPhone,CorpID,Status,perm)  values(?,?,?,?,?,?,?,?) " );

			ps.setString(1,u.getLoginID());
		    ps.setString(2, u.getPassword());
		    ps.setString(3, u.getDepartment());
		    ps.setString(4, u.getUserAddress());
		    ps.setString(5, u.getUserPhone());
		    ps.setString(5, u.getUserPhone());
		    ps.setInt(6,u.getCorpID());
		    ps.setString(7, "Y");
		    ps.setString(8,"N");
		    
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}
		return status;
		
		
	}
	public   int update(User u){
		 
		int status=0;
		try{
			Connection con=MySqlConn.getCon();
			
			PreparedStatement ps=con.prepareStatement("update UserSetup set Department=?,UserAddress=?,UserPhone=? where LoginID=? and Status='Y'");

			System.out.println("id= "+u.getLoginID()+" ");
			
			ps.setString(1, u.getDepartment());
			
			ps.setString(2,u.getUserAddress());
			ps.setString(3,u.getUserPhone());
			ps.setString(4,u.getLoginID());
			
			
			
			
			//ps.setString(1,u.getLoginID());
			
				/* ps.setString(1, u.getPassword());
				 *  ps.setString(3, u.getUserAddress());
				 * ps.setString(4, u.getPassword());
				 */
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}
		return status;

	}
//
//
	public   int delete(User u){
		int status=0;
		try{
			Connection con=MySqlConn.getCon();
			PreparedStatement ps=con.prepareStatement("update UserSetup set Status=? where LoginID=? and Status='Y'");

			ps.setString(1,"N");
			ps.setString(2,u.getLoginID());
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}

		return status;
	}
}
