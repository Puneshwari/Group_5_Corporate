package com.pack.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.pack.model.Corp;


public class CorpDao {
	public   int save(Corp u){
		int status=0;
		try{
			Connection con=MySqlConn.getCon();
			PreparedStatement ps=con.prepareStatement("insert into CorpSetup(CorpName,CorpAddress,CorpPhone,Status)  values(?,?,?,?)");
			
			ps.setString(1,u.getCorpName());
		    ps.setString(2, u.getCorpAddress());
		    ps.setString(3, u.getCorpPhone());
		    ps.setString(4, "Y");
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}
		return status;
		
		
	}
	public   int update(Corp u){
		 
		int status=0;
		try{
			Connection con=MySqlConn.getCon();

			PreparedStatement ps=con.prepareStatement("update CorpSetup set CorpName=?,CorpAddress=?,CorpPhone=? where CorpID=?");
			System.out.println("id= "+u.getCorpID()+" "+u.getCorpName()+" "+u.getCorpAddress()+" " + u.getCorpPhone());
			ps.setInt(4,u.getCorpID());
			ps.setString(1,u.getCorpName());
			 ps.setString(2, u.getCorpAddress());
			    ps.setString(3, u.getCorpPhone());
			
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}
		return status;

	}


	public   int delete(Corp u){
		int status=0;
		try{
			Connection con=MySqlConn.getCon();
			PreparedStatement ps=con.prepareStatement("update CorpSetup set Status=? where CorpID=?");
			ps.setString(1,"N");
			ps.setInt(2,u.getCorpID());
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}

		return status;
	}
}