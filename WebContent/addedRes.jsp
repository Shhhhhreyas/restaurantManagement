<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	html {
    height: 100%;
	}
	body { margin-top: 5%; margin-right: 10%; margin-left: 10%;
		background-image: url("wall5.jpg");
  	background-size: 100% 100%;
  background-attachment:fixed; }
 </style>
<meta charset="UTF-8">
<title>Resutl_Add_Restaurant</title>
</head>
<body>
<%
	String user = (String)request.getAttribute("user");
	int check = Integer.parseInt(request.getParameter("ok"));
	if(user.equals("null")||user==null){
	out.println("You are not a registered user. You can not add restaurant.");
}

else if(user!="null"){
	out.println("<h1 style=\"color:blue\">The restaurant has been successfully added.<h1><form method=\"post\" action=\"result3.jsp\">");
	out.println("<input type=\"hidden\" name=\"user\" value="+user+"><input type=\"hidden\" name=\"ok\" value="+check+"><input type=submit style=\"background-color:transparent;font-size: large;color:teal\" value=Home name=submit></form>");
}
%>
</body>
</html>