<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="Home.Home"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Restaurant</title>
<style type="text/css">
		body
		{
			margin-top: 15%; margin-right: 10%; margin-left: 10%;
			background-image: url("images/background.jpg");
			background-attachment:fixed;
			/* Center and scale the image nicely */
    		background-position: center;
    		background-repeat: no-repeat;
    		background-size: cover;
		}	
  		h2
  		{
  		font-size: 300%; color:black; font-family:Helvetica;
  		text-shadow: 5px 5px 5px #FF0000;
  		}
	
		h3
		{
		font-size: 200%;
		text-shadow: 3px 3px 3px #FFFFFF;
		}

		p
		{
		font-size: 200%; color:blue;
		text-shadow: 2px 2px 2px #000000;
		}
 </style>
 
 <script>

var name="";

function selectRestaurant() {
	var x = document.getElementById("myRestaurants").selectedIndex;
	var y = document.getElementById("myRestaurants").options;
	// 	    alert("Index: " + y[x].index + " is " + y[x].text);

	 name = y[x].text;
	//window.alert(name);
}
</script>
</head>
<body>
	<% 
		String user = request.getParameter("user");
		int check = Integer.parseInt(request.getParameter("ok"));
		out.println("<p>"+"User: " +user+"</p>");
	%>
	<div height="50px" style="color: red">
		<h2 align="center">Restaurant Deletion</h2>
	</div>
	<div align="center">
		<h3 align="center">Select the locality</h3>
		<form method="post" action="ListRestaurants">
			<% 
				out.print("<input type=\"hidden\" name=\"user\" value="+user+">");
				out.print("<input type=\"hidden\" name=\"ok\" value="+check+">");
				out.print("<input type=\"hidden\" name=\"action\" value=\"delete\">");
			%>
			<select id="myRestaurants" name="rest">
			<%
				List<String> localityList = Home.getLocalities();
				for(int i=0;i<localityList.size();i++)
				{
					String s = localityList.get(i);
					out.print("<option  value=\""+s+"\">"+s+"</option>");
				}  
			%>

			</select> <input type="submit" value="Submit" />
		</form>



	</div>
	<br>
	<br>

	<div></div>

	
</body>
</html>