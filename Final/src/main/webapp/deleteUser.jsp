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
</head>
<body>
<sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/SmartBank"
                           user="root"  password="Pune@1234"/>
                           
 <sql:query dataSource="${dbsource}" var="result">
    SELECT * from UserSetup;
            
 </sql:query>
   <c:forEach  var="row"  items="${result.rows}">
         <form action="UserServlet" method="get">
       <table>
         <tr><td>  <c:out value="${row.LoginID}"></c:out> </td>
         <td><c:out value="${row.CorpID}"></c:out></td>
         <td>  <input type="hidden" value="${row.CorpID}" name="CorpID"> 
          <input type="hidden" value="${row.LoginID}" name="LoginID">
          <input type="hidden" name="action" value="delete"/>   
          <input type="submit" name="delete"  value="Delete"/></td></tr>      
         
        </table>
                           
         </form>
   
   </c:forEach>

</body>
</html>