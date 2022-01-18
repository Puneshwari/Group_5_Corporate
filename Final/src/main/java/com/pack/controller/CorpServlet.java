package com.pack.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pack.dao.CorpDao;
import com.pack.model.Corp;


/**
 * Servlet implementation class CorpServlet
 */
@WebServlet("/CorpServlet")
public class CorpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CorpDao corpDao=new CorpDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CorpServlet() {
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
		  Corp  c=new Corp();
			
		c.setCorpName(request.getParameter("CorpName"));
		c.setCorpAddress(request.getParameter("CorpAddress"));
		c.setCorpPhone(request.getParameter("CorpPhone"));
		
				 
		int i=corpDao.save(c);
		if(i>0){
		response.sendRedirect("corpSuccess.jsp");
	}  
		   else{ response.sendRedirect("corpError.jsp");
		 
		}
		}
		 
		
		protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			 
			 
			 
			
		Corp c=new Corp(); 
			  System.out.println("in update of servlet");
			  c.setCorpID(Integer.parseInt(request.getParameter("CorpID")));
			  c.setCorpName(request.getParameter("CorpName"));
				c.setCorpAddress(request.getParameter("CorpAddress"));
				c.setCorpPhone(request.getParameter("CorpPhone"));
	         
			  
			  System.out.println("in servlet "+c.getCorpID()+" "+c.getCorpName()+" "+c.getCorpAddress());
			  int i=corpDao.update(c); 
			  if(i>0){
				  			  response.sendRedirect("modifyCorpSuccess.jsp");
			  }else
			  { response.sendRedirect("modifyError.jsp"); }
			 
				
		}
		 
		
		 
		protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			Corp c=new Corp(); 
			 c.setCorpID(Integer.parseInt(request.getParameter("CorpID")));
		 
			  int i=corpDao.delete(c);
			  if(i>0){
	  			  response.sendRedirect("deleteCorpSuccess.jsp");
	}else
	{ response.sendRedirect("corpDeleteError.jsp"); }
	 
			 

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
