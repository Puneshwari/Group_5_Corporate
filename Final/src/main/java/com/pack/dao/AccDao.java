package com.pack.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.pack.model.Acc;

public class AccDao {
	
	public   int save(Acc a){
		int status=0;
		try{
			Connection con=MySqlConn.getCon();
			PreparedStatement ps=con.prepareStatement("Insert into  AccSetup (AccNumber,AccName,AccBranch,AccCurrency,AccBalance,CorpID,status)  values(?,?,?,?,?,?,?) " );
			
			ps.setString(1,a.getAccNumber());
		    ps.setString(2, a.getAccName());
		    ps.setString(3, a.getAccBranch());
		    ps.setString(4, a.getAccCurrency());
		    ps.setString(5, a.getAccBalance());
		   
		    ps.setInt(6, a.getCorpID());
		    ps.setString(7, "Y");
		  
		    
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}
		return status;
		
		
	}

	public   int delete(Acc a){
		int status=0;
		try{
			Connection con=MySqlConn.getCon();
			PreparedStatement ps=con.prepareStatement("update AccSetup set Status=? where AccNumber=?");
			ps.setString(1,"N");
			ps.setString(2,a.getAccNumber());
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}

		return status;
	}
}
