<%@page import="com.sun.glass.ui.Menu"%>
<%@page import="Home.Home"%>
<%@page import="Home.RestaurantDetails"%>
<%@page import="Home.MenuList"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Restaurant Details</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/w3.css">
<link rel="stylesheet" type="text/css" href="css/font.css">
<style>
body, html {
    height: 100%;
    font-family: "Inconsolata", sans-serif;
}
.bgimg {
    background-position: center;
    background-size: cover;
    background-image: url("rest.jpg");
    min-height: 75%;
}
.menu {
    display: none;
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
div#line1 span#a {
  display: inline;
}

div#line1:hover span#a {
  display: none;
}

div#line1 span#b {
  display: none;
}

div#line1:hover span#b {
  display: inline;
}

</style>
</head>
<body>
<%
	String user = request.getParameter("user");
	String check = request.getParameter("ok");
%>
<div class="w3-top">
  <div class="w3-row w3-padding w3-black">
    <div class="w3-col s3">
      <form action="home.jsp" method="post">
        <input type="hidden" name="user" value="<%out.print(user);%>">
		<input type="hidden" name="ok" value="<%out.print(check);%>">
      	<button type="submit" class="w3-button w3-block w3-black">HOME</button>
      </form>
    </div>
    <div class="w3-col s3">
      <a href="#about" class="w3-button w3-block w3-black">ABOUT</a>
    </div>
    <div class="w3-col s3">
      <a href="#menu" class="w3-button w3-block w3-black">MENU</a>
    </div>
    <div class="w3-col s3">
      <a href="#where" class="w3-button w3-block w3-black">WHERE</a>
    </div>
  </div>
</div>

<% 

	RestaurantDetails Object = new RestaurantDetails();
	
	String id = request.getParameter("id");
	System.out.println("restaurnrtDE"+id);
	
	String locality = Home.getlocality(id);
		
	Object = Home.getAllDetails(id);
	
	String name = Object.getRestaurantName();
	String location = Object.getLocation();
	String menuLink = Object.getMenu();
	String cost = Object.getCost();
	String rating = Object.getRating();
	String phone = Object.getPhone();
	
	List<MenuList> menu = new ArrayList<MenuList>();
	menu = Home.getMenu(id);
	%>
	
	<header class="bgimg w3-display-container" id="home">
  <div class="w3-display-bottomleft w3-center w3-padding-large w3-hide-small">
    <span class="w3-tag">Open from 6am to 5pm</span>
  </div>
  <div class="w3-display-middle w3-center">
    <span class="w3-text-white" style="font-size:90px"><%out.print(name); %></span>
    </div>
  <div class="w3-display-bottomright w3-center w3-padding-large">
    <span class="w3-text-white"><%out.print(location); %></span>
  </div>
</header>
<div class="w3-sand w3-large">
<div class="w3-container" id="about">
  <div class="w3-content" style="max-width:700px">
    <h5 class="w3-center w3-padding-64"><span class="w3-tag w3-wide">ABOUT THE RESTAURANT</span></h5>
    <p><strong>Opening hours:</strong> everyday from 6am to 5pm.</p>
    <p><strong>Address:</strong> <%out.print(location); %></p>
    <p><strong>Contact Number:</strong> <%out.print(phone); %></p>
    <p><strong>Cost:</strong> <%out.print(cost); %></p>
    <p><strong>Rating:</strong> <%out.print(rating); %></p>
  </div>
</div>
<div class="w3-container" id="menu">
  <div class="w3-content" style="max-width:700px">
 
    <h5 class="w3-center w3-padding-48"><span class="w3-tag w3-wide">THE MENU</span></h5>
  
    <div class="w3-row w3-center w3-card w3-padding">
      <a href="javascript:void(0)" onclick="openMenu(event, 'Eat');" id="myLink">
        <div class="w3-col s6 tablink">Item</div>
      </a>
      <a href="javascript:void(0)" onclick="openMenu(event, 'Drinks');">
        <div class="w3-col s6 tablink"></div>
      </a>
    </div>
    <div id="Eat" class="w3-container menu w3-padding-48 w3-card">
    <%
    	for(int i=0;i<menu.size();i++){
    		out.print("<div id=\"line1\"><table border=\"0\"><tr><td><h5><span id=\"a\">"+menu.get(i).getMenuItem()+"</span></h5>");
    		out.print("<h5><span id=\"b\">Rs."+menu.get(i).getItemPrice()+"</span></h5>");
    		out.print("</td></tr></table></div>");
    	}
    %>
    </div>
    
    <div id="Drinks" class="w3-container menu w3-padding-48 w3-card">
    <%
    	for(int i=0;i<menu.size();i++){
    		out.print("<h5><span id=\"b\">Rs."+menu.get(i).getItemPrice()+"</span></h5>");
    	}
    %>
     </div>
</div>
<div class="w3-container" id="where" style="padding-bottom:32px;">
  <div class="w3-content" style="max-width:700px">
    <h5 class="w3-center w3-padding-48"><span class="w3-tag w3-wide">WHERE TO FIND US</span></h5>
    <p><%out.print(name+", "+location); %></p>
    </div>
    </div>
    <div id="googleMap" style="width:100%;height:400px;">
    <%String address ="https://maps.google.com/maps?q="+name+","+location+"&ie=UTF8&t=&z=17&iwloc=B&output=embed";
	address = "\"" + address+ "\"";
	
	
	out.print("<h2 align=\"center\"><i>"+name+"</i></h2><br><br>");
	
	out.print("<div align=\"center\">");
	out.print("<iframe width=\"1500\" height=\"300\"");
	out.print("src="+address+" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" >");
	out.print("</iframe>");
	out.print("</div> <br><br>");
	
	out.print("<div height=\"750\" width=\"1200\">");
	
		
	
	out.println("<div height=\"750\" width=\"500\" style=\"float:left; \" >");
	%>
	</div>
	<div class="w3-container" id="where" style="padding-bottom:32px;">
  <div class="w3-content" style="max-width:700px">
	<p><strong>Rate Us:</strong></p>
	<%
	out.print("<form action=\"Reviews\" id=\"usrform\" method=\"post\">");
	out.print( "<input type=\"radio\" name=\"rating\" value=\"1\" > 1 ");
	out.print( "<input type=\"radio\" name=\"rating\" value=\"2\" > 2 ");
	out.print( "<input type=\"radio\" name=\"rating\" value=\"3\" > 3 ");
	out.print( "<input type=\"radio\" name=\"rating\" value=\"4\" > 4 ");
	out.print( "<input type=\"radio\" name=\"rating\" value=\"5\" checked> 5 <br><br>");
	out.print("<input type=\"hidden\" name=\"user\" value="+user+">");
	out.print("<input type=\"hidden\" name=\"restaurantID\" value="+id+">");
	out.print("<button class=\"button button1\" type=\"submit\" value=\"Submit\">Submit</button>");
	out.print("</form>");
	%>
	</div></div>
</div>
<footer class="w3-center w3-light-grey w3-padding-48 w3-large">
  <p>That's All Folks!</p>
</footer>
<script>
function openMenu(evt, menuName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("menu");
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
     tablinks[i].className = tablinks[i].className.replace(" w3-dark-grey", "");
  }
  document.getElementById(menuName).style.display = "block";
  evt.currentTarget.firstElementChild.className += " w3-dark-grey";
}
document.getElementById("myLink").click();
</script>
</body>
</html>