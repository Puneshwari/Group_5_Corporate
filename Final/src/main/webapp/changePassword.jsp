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
<style>
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
	/* width:400px;
	border-radius:10px; */
	
}
.bord{
	border: 5px solid black;
	margin: 20px;
	width:400px;
	padding: 50px 0px 50px 120px;
}
</style>
</head>
<body>


 <sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/SmartBank"
                           user="root"  password="Pune@1234"/>
                           
          <sql:query dataSource="${dbsource}" var="result">
            SELECT * from UserSetup where  LoginID=?;
             <sql:param value="${LoginID}"/>
                   
        </sql:query>
       
       <div class="center"> 
       <div class="bord">
       <div>
       <h1>Change Password</h1>
       <form action="LoginChangePassword">
       <table>           
         <c:forEach var="row" items="${result.rows}" > 
       <tr><td> Old password:<br><br></td><td><input type="password" name="password1"   value="${row.password}" readonly="readonly"/><br><br></td> </tr>
         </c:forEach>
           
       <tr><td> Change Password:</td><td><input type="text" name="password2" required/></td></tr>
        </table>
        <input type="submit" value="save"/>
        </form>
        </div>
 </div>           
       </div>
</body>
</html>