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
	left:30%;
	transform: translate(-50%,-50%);
	width:500px;
	
	/* border-radius:10px; */
}
.topbar{
	/* background-color: brown; */
	background-color: rgb(219, 37, 77);
	padding: 8px 3px 8px 10px;
	position:absolute;
	top:0%;
	width:100%;
}
</style>
</head>
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
            SELECT * from UserSetup where LoginID=?;
            <sql:param value="${param.LoginID}" />
        </sql:query>
<div class="center">            
        <h1>Modify User</h1>
        <form action="UserServlet" method="get">
        <table >
                <tr>
                    <th>Corp:</th>
                    <th>Login ID:</th>
                    <th>Password:</th>
                    <th>Dept:</th>
                    <th>Address:</th>
                    <th>Phone No:</th>
                    <th>Action:</th>
                </tr>
                
             <c:forEach var="row" items="${result.rows}" >  
                <input type="hidden" value="${param.LoginID}" name="LoginID" />
                   <tr> 
                 <td><input type="text"   value="${row.CorpID}" name="CorpID" readonly="readonly"/></td> 
                <td><input type="text"   value="${row.LoginId}" name="LoginID" readonly="readonly"/></td> 
                <td><input type="text"   value="${row.Password}" name="Password" readonly="readonly"/></td> 
                <td><input type="text"  value="${row.Department}" name="Department" required/></td>
                <td><input type="text"  value="${row.UserAddress}" name="UserAddress" required/></td>
                <td><input type="text"  value="${row.UserPhone}" name="UserPhone" pattern="[789][0-9]{9}"  maxlength=10 minlength=10 required/></td>
                   
                        
                <td><input type="hidden" value="update" name="action"/>
                <input type="submit" value="Modify"/></td>
                </tr>
             </c:forEach>  
        </table>
        </form>
        </div>
<nav>
<form action="homePage.jsp">
     <input type="submit" value="Go Home"><br><br>    
 </form>
 </nav>
        <!-- <a href="index.jsp">Go Home</a> -->
</body>
</html>