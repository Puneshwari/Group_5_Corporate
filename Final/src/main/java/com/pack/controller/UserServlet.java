package com.pack.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pack.dao.UserDao;
import com.pack.model.User;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDao userDao=new UserDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String action=request.getParameter("action");
		System.out.println(action);
		switch(action)
		{
		
		
		case "add":
			insert(request,response);
		    break;
		case "update":
			update(request,response);
			break;
		
		  case "delete": 
			  delete(request,response); 
			  break;
		 
		}
	}
	protected void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 User  u=new User();
	    u.setCorpID(Integer.parseInt(request.getParameter("CorpID")));
		u.setLoginID(request.getParameter("LoginID"));
		u.setPassword(request.getParameter("Password"));
		u.setDepartment(request.getParameter("Department"));
		u.setUserAddress(request.getParameter("UserAddress"));
		u.setUserPhone(request.getParameter("UserPhone"));
		
		
				 
		int i=userDao.save(u);
		if(i>0){
		response.sendRedirect("addUserSuccess.jsp");
	}  
		   else{ response.sendRedirect("addUserError.jsp");
		 
		}
		}
	
	protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	
		User u=new  User(); 
		  System.out.println("in update of servlet");
		  u.setCorpID(Integer.parseInt(request.getParameter("CorpID")));
		  u.setLoginID(request.getParameter("LoginID"));
		  u.setDepartment(request.getParameter("Department"));
		  u.setUserAddress(request.getParameter("UserAddress"));
		  u.setUserPhone(request.getParameter("UserPhone"));
			
		  System.out.println("in servlet " + " "+ u.getCorpID() + u.getLoginID());
		  //System.out.println("in servlet "+c.getCorpID()+" "+c.getCorpName()+" "+c.getCorpAddress());
		  int i=userDao.update(u); 
		  if(i>0){
			  			  response.sendRedirect("modifyUserSuccess.jsp");
		  }else
		  { response.sendRedirect("modifyUserError.jsp"); }
		 
			
	}
		 
		
		 
		
	protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User u=new  User(); 
		// u.setCorpID(Integer.parseInt(request.getParameter("CorpID")));
		 u.setLoginID(request.getParameter("LoginID"));
	   // System.out.println("inside delete" + u.getLoginID() + " " + u.getCorpID());
		  int i=userDao.delete(u);
		  if(i>0){
  			  response.sendRedirect("deleteUserSuccess.jsp");
}else
{ response.sendRedirect("deleteUserError.jsp"); }
 
		 

}

		 

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
