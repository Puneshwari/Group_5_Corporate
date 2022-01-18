<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
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
	width:400px;
	background:white;
	border-radius:10px;
}

.center h1{
	text-align:center;
	padding:0 0 20px 0;
	border-bottom: 1px solid silver;
}

.center form{
	padding: 0 40px;
	box-sizing:border-box;

}

form .txt_field{
	position: relative;
	border-bottom: 2px solid #adadad;
	margin: 30px 0;
}

.txt_field input{
	width: 100%;
	padding:0 5px;
	height:40px;
	font-size:16px;
	border:none;
	background:none;
	outline:none;
}

.txt_field label{
	position:absolute;
	top: 50%;
	left:5px;
	color:#adadad;
	transform: translateY(-50%);
	font-size: 16px;
	pointer-events: none;
	transition: .5s;
	
}

.txt_field span::before{
	content: '';
	position: absolute;
	top: 40px;
	left:0;
	width:0%;
	height:2px;
	background: #2691d9;
	transition: .5s;
}

.txt_field input:focus ~ label,
.txt_field input.valid ~ label{
 top: -5px;
 color: #2691d9;
}

.txt_field input:focus ~ span::before,
.txt_field input.valid ~ span::before{
width: 100%;
}

input[type="submit"]{
	width: 100%;
	height: 50px;
	border: 1px solid;
	background: #2691d9;
	border-radius:25px;
	font-size:18px;
	color:#e9f4fb;
	font-weight: 700;
	cursor: pointer;
	outline: none;
}

.quote{
	margin: 30px 0;
	text-align: center;
	font-size: 16px;
	color: #666666;
}
</style>
</head>
<body>
<div class="center">
    <h1>Admin Login</h1>
    <form action="LoginAdmin"  >
     <div class="txt_field">
      <input type="text" name="uname" required>
      <span></span>
      <label>User Name</label>
     </div>
     <div class="txt_field">
      <input type="password" name="password" required>
      <span></span>
      <label>Password</label>
      </div>
      <input type="submit" value="Login">
      <div class="quote">
        <a href="indexUser.jsp">Enter as User</a>
      </div>
    </form>
   </div>
</body>     
</html>  

