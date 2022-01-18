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
	/* position: absolute;
	top: 50%;
	left:50%;
	transform: translate(-50%,-50%); */ 
	width:550px;	
	/* border-radius:10px; */
	 background-color: white; 
}
.topbar{
	/* background-color: brown; */
	background-color: rgb(219, 37, 77);
	padding: 8px 3px 8px 10px;
	position:absolute;
	top:0%;
	width:100%;
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

 <body>
 
      <sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/SmartBank"
                           user="root"  password="Pune@1234"/>
 
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from CorpSetup where Status='Y';
            
        </sql:query>
        
   <header>
<div class="topbar">
<form action="homePageAdmin.jsp">
  <span>    <input type="submit" value="Go Home"></span>    
 </form>
 </div>
</header> 

<div class="boss">
<h1>Corporate List</h1> 
   <div class="center">
         
        <form>
        
            <table border="1" style="width:550px">
                
                
                <tr>
                    <th>Corporate ID</th>
                    <th>Corporate Name</th>
                    
                    <th>Action</th>
           
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><c:out value="${row.CorpID}"/></td>
                        <td><c:out value="${row.CorpName}"/></td>
                              
                        <td><a href="addUser2.jsp?CorpID=${row.CorpID}">Add User</a></td>
                                              
                    </tr>
                </c:forEach>
            </table>
            
        </form></div>
        <div>
<form action="userEntry.jsp">
<input type="submit" value="Back"/>
</form>
</div>
        
        <!-- <a href="index.jsp">Go Home</a> -->

</div>
</body>
</html>