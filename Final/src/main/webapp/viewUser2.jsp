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
	width:1010px;	
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
            SELECT * from UserSetup where CorpID = ? and Status='Y';
             <sql:param value="${param.CorpID}" />
            
        </sql:query>
<div class="boss">
<h1>User Detail</h1>
 <div class="center">        
    <form>
    <table border="1" width="40%">
    <tr>
        <th>CorpID </th>
       <th>Login Id </th>
       <th>Password </th>
       <th>Department </th>
       <th>Address </th>
       <th>PhNo </th>
      
       <th colspan="2">Action</th>
       </tr>
       
       <c:forEach var="row" items="${result.rows }">
      <input type="hidden" value="${param.CorpID}" name="CorpID"/> 
                
              <tr> 
               <td><input type="text" value="${row.CorpID}" name="CorpID" readonly="readonly"/></td>
              <td><input type="text" value="${row.LoginId}" name="LoginID"   readonly="readonly"/></td>
              <td><input type="text" value="${row.Password}" name="Password"  readonly="readonly"/></td>
              <td><input type="text" value="${row.Department}" name="Department"  readonly="readonly" required /></td>
             <td><input type="text" value="${row.UserAddress}" name="UserAddress"  readonly="readonly" required/></td>
              <td><input type="tel" value="${row.UserPhone}" name="UserPhone" pattern="[789][0-9]{9}"  maxlength=10 minlength=10 required  readonly="readonly"/></td> 
         
                 
           <td><a href="modifyUser.jsp?LoginID=${row.LoginID}">Modify</a></td>
           <td><a href= "UserServlet?LoginID=${row.LoginID}&action=delete">Delete</a></td>
                 </tr>
       </c:forEach>
       </table>
       </form>
     </div>
   
    <div>    
  <form action="viewUser.jsp">
        
      <tr><td><input type="submit" value="Back"/></td></tr>       
  </form>
  </div>
</div>    
  
 

</body>
</html>