<%@page import="Home.Home"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="Home.Home" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<style type="text/css">
		
	body{ margin-top: 5%; margin-right: 10%; margin-left: 10%;
		background-image: url("wall5.jpg");
		font-family: 'Lato', sans-serif;
  	background-size: cover;
  background-attachment:fixed; 
  background-repeat: no-repeat;
  min-height:100%;}
  
.logout {
  width: 100px;
  cursor:pointer;
  border-radius:50px;
  padding:10px 20px 10px 0;
  color:Green;
  font-size:14px;
  text-align:left;
  text-indent:40px;
  display:block;
  margin:0 auto;
 
  /* Animations: */
  -webkit-transition-timing-function: ease-in-out;
  -webkit-transition-duration: .4s;
  -webkit-transition-property: all;
  
  -moz-transition-timing-function: ease-in-out;
  -moz-transition-duration: .4s;
  -moz-transition-property: all;
}

.logout:hover {
  background-position: 65px 5px;
  text-indent: 15px;  
}

.overlay {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: rgb(0,0,0);
    background-color: rgba(0,0,0, 0.9);
    overflow-x: hidden;
    transition: 0.5s;
}

.overlay-content {
    position: relative;
    top: 25%;
    width: 100%;
    text-align: center;
    margin-top: 30px;
}

.overlay a {
    padding: 8px;
    text-decoration: none;
    font-size: 36px;
    color: #818181;
    display: block;
    transition: 0.3s;
}

.overlay a:hover, .overlay a:focus {
    color: #f1f1f1;
}

.overlay .closebtn {
    position: absolute;
    top: 20px;
    right: 45px;
    font-size: 60px;
}

@media screen and (max-height: 450px) {
  .overlay a {font-size: 20px}
  .overlay .closebtn {
    font-size: 40px;
    top: 15px;
    right: 35px;
  }
}

 </style>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin</title>
</head>
<body>
<font color="white">
<%
	int check = 1;
	String a1 = null;
	String a2 = null;
	String temp = request.getParameter("ok");
	if(temp==null||temp.equals("null")){
		out.print("You have to login first!<br /><a href=\"index.html\">Login</a>");
	}
	else{
	check = Integer.parseInt(temp);
	if(check==1){
		a1 = request.getParameter("admin_i");
		a2 = request.getParameter("admin_p");
		
	}
	else{
		a1 = request.getParameter("user");
	}
	
	int l_admin = Home.checkPasswordadmin( a1, a2);
	int l_reg_user =0;
	if(l_admin!=1) l_reg_user = Home.checkPassword( a1, a2);
	
	
	//out.print(rr);
	if(l_admin==1||check==0){
		
		check=0;
		out.print("<h1>Your are logged in as admin to make changes.</h1>");
		out.print("<div id=\"myNav\" class=\"overlay\"><a href=\"javascript:void(0)\" class=\"closebtn\" onclick=\"closeNav()\">&times;</a><div class=\"overlay-content\">");
		out.print("<form action =\"addRestaurant.jsp\" method=\"post\" ><input type=\"hidden\"  name=\"user\" value="+a1+"><input type=\"hidden\" name=\"ok\" value="+check+"><input type=submit style=\"background-color: Transparent;border: none;color:white; font-size: 30px;\" value=\"Add restaurant\" ></form><br>");
		out.print("<form action =\"deleteRestaurant.jsp\" method=\"post\" ><input type=\"hidden\" name=\"user\" value="+a1+"><input type=\"hidden\" name=\"ok\" value="+check+"><input type=submit style=\"background-color: Transparent;border: none;color:white; font-size: 30px;\" value=\"Delete restaurant\" ></form><br>");
		out.print("<form action =\"deleteUser.jsp\" method=\"post\" ><input type=\"hidden\" name=\"user\" value="+a1+"><input type=\"hidden\" name=\"ok\" value="+check+"><input type=submit style=\"background-color: Transparent;border: none;color:white; font-size: 30px;\" value=\"Delete Users\" ></form>");
		out.print("<pre><a href=\"index.html\"><input type=\"button\" value=\"Logout\" class=\"logout\"/></a></pre>");
		out.print("</div></div>");
	}
	
	else if(l_reg_user==1||check==2){
		check=2;
		out.print("<h1>Your are logged in as register user to add restaurant</h1>");
		out.print("<div id=\"myNav\" class=\"overlay\"><a href=\"javascript:void(0)\" class=\"closebtn\" onclick=\"closeNav()\">&times;</a><div class=\"overlay-content\">");
		out.print("<form action =\"addRestaurant.jsp\" method=\"post\" ><input type=\"hidden\" name=\"user\" value="+a1+"><input type=\"hidden\" name=\"ok\" value="+check+"><input type=submit style=\"background-color: Transparent;border: none;color:white; font-size: 30px;\" value=\"Add restaurant\" ></form>");
		out.print("<pre><a href=\"index.html\"><input type=\"button\" value=\"Logout\" class=\"logout\"/></a></pre>");
		out.print("</div></div>");
	}
	else{
		
		
		out.print("<h1>Wrong username or password </h1>");
		out.print("<a href=index.html>Go to login page </a>");
		
	}
	out.print("<span style=\"font-size:30px;cursor:pointer\" onclick=\"openNav()\">Action</span>");
	}

%>
<script>
function openNav() {
  document.getElementById("myNav").style.width = "30%";
}

function closeNav() {
  document.getElementById("myNav").style.width = "0%";
}
</script>
</body>
</html>