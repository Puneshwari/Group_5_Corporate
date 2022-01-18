package com.pack.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pack.dao.AccDao;
import com.pack.model.Acc;


/**
 * Servlet implementation class AccServlet
 */
@WebServlet("/AccServlet")
public class AccServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AccDao accDao=new AccDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccServlet() {
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
		
		
		  case "delete": 
			  delete(request,response); 
			  break;
		 
		}
	}
	protected void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Acc a = new Acc();
		 
	    a.setCorpID(Integer.parseInt(request.getParameter("CorpID")));		
		a.setAccNumber(request.getParameter("AccNumber"));
		a.setAccName(request.getParameter("AccName"));
		a.setAccBranch(request.getParameter("AccBranch"));
		a.setAccCurrency(request.getParameter("AccCurrency"));
		a.setAccBalance(request.getParameter("AccBalance"));
		
		
		
				 
		int i=accDao.save(a);
		if(i>0){
		response.sendRedirect("addAccountSuccess.jsp");
	}  
		   else{ response.sendRedirect("addAccountError.jsp");
		 
		}
		}
	
	
	protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Acc a = new Acc();
			
			          
			  a.setAccNumber(request.getParameter("AccNumber"));
			 
		     
	      System.out.println("inside delete" + a.getAccNumber());
		  int i=accDao.delete(a);
		  if(i>0){
 			  response.sendRedirect("closeAccountSuccess.jsp");
}else
{ response.sendRedirect("closeAccountError.jsp"); }

		 

}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
