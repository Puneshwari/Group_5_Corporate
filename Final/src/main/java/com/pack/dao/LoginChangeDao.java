package com.pack.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;


public class LoginChangeDao {

	public int change(String password1,String password2) {
	
			 
			int status=0;
			try{
				Connection con=MySqlConn.getCon();

				PreparedStatement ps=con.prepareStatement("update UserSetup set perm=?,password=? where password=?");
				//System.out.println("id= "+u.getCorpID()+" "+u.getCorpName()+" "+u.getCorpAddress()+" " + u.getCorpPhone());
				
				   ps.setString(1,"Y");
				   ps.setString(2, password2);
				   ps.setString(3,password1);
				
				status=ps.executeUpdate();
			}catch(Exception e){System.out.println(e);}
			return status;

		}
		
	}



