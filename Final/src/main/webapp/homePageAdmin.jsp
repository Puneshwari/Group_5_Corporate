<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style> 
.topbar{
	/*background-color: brown; */
	background-color: rgb(74, 116, 120);
	padding: 8px 3px 8px 10px;
	position:absolute;
	top:0%;
	width:100%;
}
.center input[type=submit] {
    padding:20px 30px; 
    background:#ccc; 
    border:0 none; 
    cursor:pointer;
    /* -webkit-border-radius: 5px; */
    border-radius: 5px; 
    width: 360px;
    height: 60px;
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
	width:400px;
	
	border-radius:10px;
}



</style>
</head>

<body>
<div class="topbar">
<form action="indexAdmin.jsp">
  <span>    <input type="submit" value="Logout"></span>    
 </form>
 </div>

<div class="center">
 <form action="corpEntry.jsp">
      <input type="submit" value="Corporate Setup"><br><br>    
 </form>
  <form action="userEntry.jsp">
      <input type="submit" value="User Setup"><br><br>    
 </form>
  <form action="accountEntry.jsp">
      <input type="submit" value="Account Setup"><br><br>    
 </form>
 </div>
</body>
</html>