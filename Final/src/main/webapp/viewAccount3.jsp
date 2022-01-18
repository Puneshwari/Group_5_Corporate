<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.topbar{
	/* background-color: brown; */
	background-color: rgb(219, 37, 77);
	padding: 8px 3px 8px 10px;
	position:absolute;
	top:0%;
	width:100%;
}
body{
	margin: 0;
	padding: 0;
	font-family: montserrat; 
     background: linear-gradient(120deg,#2980b9, #8e44ad);  
 /*   background: rgb(117,79,67); */
	height: 100vh;
	overflow: hidden;
}
.boss{
position: absolute;
	top: 50%;
	left:50%;
	transform: translate(-50%,-50%);

}
.center{	
	width:1110px;	
	border-radius:10px;
    background-color: white;
}

</style>
</head>
<body>
 <body>
 <header>
<div class="topbar">
<form action="homePageAdmin.jsp">
  <span>    <input type="submit" value="Go Home"></span>    
 </form>
 </div>
</header>
 
      <sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/SmartBank"
                           user="root"  password="Pune@1234"/>
                           
<sql:query dataSource="${dbsource}" var="result">
            SELECT * from AccSetup where LoginID = ?;
             <sql:param value="${param.LoginID}" />
            
        </sql:query>
<div class="boss">
<h1>Account Detail</h1>
 <div class="center">        
    <form>
    <table border="1">
    <tr>
       
       <th>Account Number</th>
       <th>Account Name</th>
       <th>Account Branch</th>
       <th>Account Currency</th>
       <th>Account Balance</th>
       <th>LoginID</th>
       <th>CorpID</th>
       <th colspan="2">Action</th>
       </tr>
       
       <c:forEach var="row" items="${result.rows }">
      <%-- <input type="hidden" value="${param.CorpID}" name="CorpID"/>  --%>
      <input type="hidden" value="${param.LoginID}" name="LoginID"/> 
      <%-- <input type="hidden" value="${row.AccNumber}" name="AccNumber"> --%>       
              <tr> 
           <td><input type="text" value="${row.AccNumber}" name="AccNumber" readonly="readonly"/></td>
           <td><input type="text" value="${row.AccName}" name="AccName" readonly="readonly"/></td>
           <td><input type="text" value="${row.AccBranch}" name="AccBranch" readonly="readonly"/></td>
           <td><input type="text" value="${row.AccCurrency}" name="AccCurrency" readonly="readonly"/></td>
           <td><input type="text" value="${row.AccBalance}" name="AccBalance" readonly="readonly"/></td>
           <td><input type="text" value="${row.LoginID}" name="LoginID" readonly="readonly"/></td>
           <td><input type="text" value="${row.CorpID}" name="CorpID" readonly="readonly"/></td>
                
           
           <td><a href= "AccServlet?AccNumber=${row.AccNumber}&action=delete">Close</a></td>
                 </tr>
       </c:forEach>
       </table>
       </form>
     </div>
   
    <div>   
     
  <form action="viewAccount.jsp">
        
      <tr><td><input type="submit" value="Back"/></td></tr>       
  </form>
  </div>
</div>    
  
 

</body>
</html>