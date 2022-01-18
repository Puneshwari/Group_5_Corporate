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
.center{
	position: absolute;
	top: 50%;
	left:50%;
	transform: translate(-50%,-50%);
	width:500px;
	
	/* border-radius:10px; */
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
            SELECT * from CorpSetup where CorpID=? and Status='Y';
            <sql:param value="${param.CorpID}" />
        </sql:query>
        
<div class="center">            
        <h1>Modify Form</h1>   
        <form action="CorpServlet">
            <table border="1">
               
                <tr>
                    <th> Name</th>
                      <th>Address</th>
                        <th>Phone </th>            
                </tr>
                
                 <c:forEach var="row" items="${result.rows}" >  
                 <tr>
                 
                <td><input type="hidden" value="${param.CorpID}" name="CorpID" readonly="readonly" />                               
                    <input type="text"   value="${row.CorpName}" name="CorpName" readonly="readonly"/></td> 
                <td><input type="text"   value="${row.CorpAddress}" name="CorpAddress" required/></td> 
                <td><input type="tel"   value="${row.CorpPhone}" name="CorpPhone"  pattern="[789][0-9]{9}"  maxlength=10 minlength=10 required/></td>           
              </tr>
              </c:forEach>  
            </table>
                        
         <div class="float-child">

		<input type="submit" value="Update"/>
		<input type="hidden" name="action" value="update"/>

		</div>
		</form>
         
        </div>
        
<!--  <nav>
<form action="homePage.jsp">
     <input type="submit" value="Go Home"><br><br>    
 </form>
 </nav> -->
        <!-- <a href="homePage.jsp">Go Home</a> -->
</body>
</html>