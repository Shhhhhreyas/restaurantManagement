<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="Home.Home"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	html {
    background-repeat: no-repeat;
  	min-height:100%;
	}
	body{ 
    background-image:url("del.jpeg");

    height: 100%;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		int check = Integer.parseInt(request.getParameter("ok"));
		String user = request.getParameter("user");
		boolean res = Home.deleteRestaurant(id);
		
		if(res){
			out.println("<h1 style=\"color:#EC22B8\">The restaurant was successfully deleted.</h1> <form method=\"post\" action=\"result3.jsp\">");
			out.println("<input type=\"hidden\" name=\"user\" value="+user+"><input type=\"hidden\" name=\"ok\" value="+check+"><input type=submit style=\"background-color:#FFFFC0;font-size: larger;color:teal\" value=Home name=submit></form>");
		}
		
		else {
			out.println("<h1 style=\"color:#EC22B8\">The restaurant deleting was a failure.</h1> <form method=\"post\" action=\"result3.jsp\">");
			out.println("<input type=\"hidden\" name=\"user\" value="+user+"><input type=\"hidden\" name=\"ok\" value="+check+"><input type=submit style=\"background-color:#FFFFC0;font-size: larger;color:teal\" value=Home name=submit></form>");
		}
	%>
</body>
</html>