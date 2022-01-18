<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style> 
.topbar{
	/* background-color: brown; */
	background-color: rgb(219, 37, 77);
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
    -webkit-border-radius: 5px;
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
<header>
<div class="topbar">
<form action="homePageAdmin.jsp">
  <span>    <input type="submit" value="Go Home"></span>    
 </form>
 </div>
</header> 

<div class="center">
 <form action="addCorp.html">
      <input type="submit" value="Add Corporate"><br><br>    
 </form>
  <form action="viewCorp.jsp">
      <input type="submit" value="View Corporate"><br><br>    
 </form>
 </div>

</html>