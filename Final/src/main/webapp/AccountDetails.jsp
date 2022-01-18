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
body{
	margin: 0;
	padding: 0;
	font-family: montserrat; 
     background: linear-gradient(120deg,#2980b9, #8e44ad);  
 /*   background: rgb(117,79,67); */
	height: 100vh;
	overflow: hidden;
}
.center{
	position: absolute;
	top: 50%;
	left:50%;
	transform: translate(-50%,-50%);
	width:400px;	
	border-radius:10px;
}
.topbar{
	/* background-color: brown; */
	background-color: rgb(219, 37, 77);
	padding: 8px 3px 8px 10px;
	position:absolute;
	top:0%;
	width:100%;
}
.float-child {
    width: 40%;
    float: left;
    padding: 20px;
   
} 

</style>
</head>
<body>
 <body>
 
      <sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/SmartBank"
                           user="root"  password="Pune@1234"/>
                           
                           
                           <sql:query dataSource="${dbsource}" var="result">
            SELECT * from AccSetup where AccNumber=?;
            <sql:param value="${param.AccNumber}"/>
            
        </sql:query>
        
 <header>
<div class="topbar">
<form action="homePageUser.jsp">
  <span>    <input type="submit" value="Go Home"></span>    
 </form>
 </div>
</header> 

<div class="center">   
<div> 
<form>
    <h1>Account Details</h1>
    
    <table border="0">

       <c:forEach var="row" items="${result.rows }">
              <tr><td>Corporate ID:</td><td> <input type="text" value="${row.CorpID}" name="CorpID"/></td></tr>
              <tr><td>Account Number:</td><td><input  type="text" value="${row.AccNumber}" name="AccNumber"/></td></tr>
              <tr><td>Account Name:</td><td><input  type="text" value="${row.AccName}" name="AccName"/></td></tr>
              <tr><td>Account Currency:</td><td><input  type="text" value="${row.AccCurrency}" name="AccCurrency"/></td></tr>
              <tr><td>Account Branch:</td><td><input  type="text" value="${row.AccBranch}" name="AccBranch"/></td></tr>
              <tr><td>Available Balance:</td><td><input  type="text" value="${row.AccBalance}" name="LoginID"/></td></tr>
             
       </c:forEach></table></form>
</div> 
   
<div class="float-child">
	<form action="homePageUser.jsp">
	<input type="submit" value="Back"/></form>
</div> 
</div>
    
</body>
</html>