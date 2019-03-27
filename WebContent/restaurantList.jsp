<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	html {
    height: 100%;
	}
	body{ 
    background-image:url("r.jpeg");
    height: 100%; 
	background-repeat: no-repeat;
  	min-height:100%;
    background-position: center;
    background-size: cover;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Restaurant List</title>
	</head>
	<body >
	<div align="center">
	<br><br><br>
	
	<%
	List<String> listOfId = new ArrayList<String>();
	List<String> listOfNames = new ArrayList<String>();
	List<String> listOfVotes = new ArrayList<String>();
	List<String> listOfLocations = new ArrayList<String>();
	List<String> listOfRatings = new ArrayList<String>();
	String locality;
	String user;
	
	listOfNames = (ArrayList)request.getAttribute("restaurantNameList");
	listOfVotes = (ArrayList)request.getAttribute("restaurantVotesList");
	listOfLocations = (ArrayList)request.getAttribute("restaurantLocationList");
	listOfRatings = (ArrayList)request.getAttribute("restaurantRatingList");
	listOfId = (ArrayList)request.getAttribute("restaurantIdList");

	
	locality = (String)request.getAttribute("locality");
	user = (String)request.getAttribute("user");

	out.print("<h1 align=\"center\" style=color:#1E25C4>Restaurants in "+locality+"</h1><br><br><br>");
	out.print("<table>");
for (int i = 0; i < listOfNames.size(); ++i) {
		
		String id = listOfId.get(i);
		String name = listOfNames.get(i);
		String vote = listOfVotes.get(i);
		String location = listOfLocations.get(i);
		String rating = listOfRatings.get(i);
		
		out.print("<tr><td><font color=#EE1AD1 size=\"5\">"+name+"</font></td><td><font color=\"green\" size=\"4\">Rating</font></td><td><font color=#B0CA0C size=\"4\">Votes</td></tr><tr><td>"+location+"</td><td>"+rating+"</td><td>"+vote+"</td></tr><tr><td></td><td></td></tr>  ");
		out.print("<tr><td><form action =\"restaurantDetail.jsp\" method=\"post\" ><input type=\"hidden\" name=\"id\" value="+id+"><input type=\"hidden\" name=\"user\" value="+user+"><input type=submit style=\"background-color:#FFFFC0;font-size: larger;color:teal\" value=\"Click for Details\" ></form></td></tr> <tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>");


}
	
out.print("</table>");
				
				
	%>
	
	
	

</div>
</div>

</body>
</html>