<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
<head>
<meta charset="ISO-8859-1">
<title>View</title>
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
 .center{
	/* position: absolute;
	top: 50%;
	left:50%;
	transform: translate(-50%,-50%); */
	width:500px;
	background-color: white;
	/* border-radius:10px; */
} 
.boss{
position: absolute;
	top: 50%;
	left:50%;
	transform: translate(-50%,-50%);

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
            SELECT * from CorpSetup where Status='Y';
                   
        </sql:query>
    
    <%-- <c:forEach items="${list}" var="u">
	<tr><td>${u.getId()}</td><td>${u.getName()}<td>${u.getEmail()}</td><td>${u.getGender()}</td><td>${u.getCountry()}</td><td><a href="editform.jsp?id=${u.getId()}">Edit</a></td><td><a href="deleteuser.jsp?id=${u.getId()}">Delete</a></td></tr>
</c:forEach> --%>

<div class="boss">
<h1>Corporate Details</h1>
 <div class="center"> 
    
        <form>
        <!-- <div class="tablebox"> -->
            <table border="1">              
                <tr>
                    <th>Corporate ID</th>
                    <th>Corporate Name</th>
                    <th>Corporate Address</th>
                    <th>Corporate Phone</th>
                   
                    <th colspan="2">Action</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><c:out value="${row.CorpID}"/></td>
                        <td><c:out value="${row.CorpName}"/></td>
                         <td><c:out value="${row.CorpAddress}"/></td>
                          <td><c:out value="${row.CorpPhone}"/></td>
                           
                          
                        <td><a href="modifyCorp.jsp?CorpID=${row.CorpID}">Modify</a></td>
                        <td><a href= "CorpServlet?CorpID=${row.CorpID}&action=delete">Delete</a></td>
                         
                    </tr>
                </c:forEach></table></form></div>
                
                <div>
					<form action="corpEntry.jsp">
 					<input type="submit" value="Back"/>
				</form></div>
            
            <!-- </div> -->
        
  
 
</div>

<!-- <nav>
<form action="homePage.jsp">
      <input type="submit" value="Go Home"><br><br>    
 </form>
 </nav> -->
        <!-- <a href="homePage.jsp">Go Home</a> -->
</body>
</html>