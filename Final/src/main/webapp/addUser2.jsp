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
            SELECT * from CorpSetup where CorpID=?;
            <sql:param value="${param.CorpID}"/>
            
        </sql:query>
        
 <header>
<div class="topbar">
<form action="homePageAdmin.jsp">
  <span>    <input type="submit" value="Go Home"></span>    
 </form>
 </div>
</header> 

<div class="center">   
<div> 
	<form action="UserServlet" method="get">
    <h1>Add New User</h1>
    
    <table border="0">

       <c:forEach var="row" items="${result.rows }">
        <input type="hidden" value="${param.CorpID}" name="CorpID" />
              <tr>
              <td>Corporate ID: <input type="text" value="${row.CorpID}" name="CorpID"/></td>
              </tr>
       </c:forEach>
       
       <tr><td>Login ID:</td><td><input type="text" name="LoginID" required/></td></tr>
      <tr><td>Password:</td><td><input type="text" name="Password" required/></td></tr>
  
   <tr><td>Department:</td><td><input type="text" name="Department" required/></td></tr>
   <tr><td>Address:</td><td><input type="text" name="UserAddress" required/></td></tr>
   <tr><td>Phone Number:</td><td><input type="text" name="UserPhone" pattern="[789][0-9]{9}" placeholder="10 digit start with 7,8,9" maxlength=10 minlength=10 required/></td></tr>
   </table>
   <div class="float-child">

<input type="submit" value="Add"/>
<input type="hidden" name="action" value="add"/>

</div> 
       </form></div>
 <div>    
       <div class="float-child">
<form action="addUser.jsp">
<input type="submit" value="Back"/>
</form>
</div> 
</div>
     </div>
</body>
</html>