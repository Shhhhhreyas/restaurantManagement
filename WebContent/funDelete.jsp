<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="Home.Home"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
		
	body {
	margin-top: 5%; margin-right: 10%; margin-left: 10%;
	background-image: url("wall5.jpg");
  	background-size: 100% 100%;
  	background-attachment:fixed; }
 </style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String user = request.getParameter("user");
	if(user==null||user.equals("null")) out.println("You are not an Admin. <a href=\"index.html\">Click to login</a>");
	else{
		String[] selectedUsers = request.getParameterValues("userD");
		System.out.println(Arrays.toString(selectedUsers));
		boolean res = Home.deleteUsers(selectedUsers);
		
		if(res){
			out.println("<h1 style=\"color:white\">User(s) have been deleted successfully.</h1><br /><form method=\"post\" action=\"result3.jsp\">");
			out.println("<input type=\"hidden\" name=\"user\" value="+user+"><input type=\"hidden\" name=\"ok\" value=0><input type=submit style=\"background-color:#FFFFC0;font-size: larger;color:teal\" value=Home name=submit></form>");
		}
		
		else out.println("There was error in deleting the user(s).<br /><a href=\"result3.jsp\">Home</a>");
	}
	%>
</body>
</html>