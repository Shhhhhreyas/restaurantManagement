<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="Home.Home"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Users</title>
<style>
/* The container */
.container {
    display: block;
    position: relative;
    padding-left: 35px;
    margin-bottom: 12px;
    cursor: pointer;
    font-size: 22px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}

/* Hide the browser's default checkbox */
.container input {
    position: absolute;
    opacity: 0;
    cursor: pointer;
}

/* Create a custom checkbox */
.checkmark {
    position: relative;
    top:0;
    height: 25px;
    width: 25px;
    background-color: #eee;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
    background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.container input:checked ~ .checkmark {
    background-color: #2196F3;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
    content: "";
    position: absolute;
    display: none;
}

/* Show the checkmark when checked */
.container input:checked ~ .checkmark:after {
    display: block;
}

/* Style the checkmark/indicator */
.container .checkmark:after {
    left: 9px;
    top: 5px;
    width: 5px;
    height: 10px;
    border: solid white;
    border-width: 0 3px 3px 0;
    -webkit-transform: rotate(45deg);
    -ms-transform: rotate(45deg);
    transform: rotate(45deg);
}
body{
	background-image: url("wall5.jpg");
	background-size: 100% 100%;
  background-attachment:fixed;
  
}

h1 {
    text-align: center;
    color: #78F4C5;
}

.button {
    background-color: ; /* Green */
    border: none;
    color: black;
    padding: 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}
.button1 {border-radius: 18px;}

.button1:hover {
    background-color: #4CAF50;
    color: white;
}
</style>
</head>

<body "style= align:center" >
	<form method="post" action="funDelete.jsp">
		<h1>Select Users to delete</h1>
		<%
			String user = request.getParameter("user");
			if(user==null || user.equals("null")){
				out.println("You are not an admin. Please login as admin to delete users.<br /><a href=\"index.html\">Click here to Login</a>");
		
			}
	
			else{
				out.print("<input type=\"hidden\" name=\"user\" value="+user+">");
		
			
			List<String> userList = Home.getUsers();
						
			for(int i=0;i<userList.size();i++){
				String s = userList.get(i);
				out.println("<center><div style=\"align-items: center;color:#FBE2F8;\";><label class=\"container\">"+s);
				out.println("<input type=\"checkbox\" value=\""+s+"\" name=userD>");
				out.println("<span class=\"checkmark\" ></span>");
				out.println("</label>");
			}
			}
		%>
		<INPUT TYPE=submit class="button button1" name=submit Value="Submit"></div></center>
	</form>
</body>
</html>