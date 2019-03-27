package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Home.RestaurantDetails;

/**
 * Servlet implementation class ListRestaurants
 */
@WebServlet("/ListRestaurants")
public class ListRestaurants extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListRestaurants() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String locality = request.getParameter("rest");
		
		String user = request.getParameter("user");
		int check = Integer.parseInt(request.getParameter("ok"));
		
		String view_delete = request.getParameter("action");
		System.out.println("restaurant "+view_delete);
		
		List<RestaurantDetails> restaurantDetailList = new ArrayList<>();
		
		restaurantDetailList = Home.Home.getRestaurants(locality);

		
		
		List<String> restaurantNameList = new ArrayList<>();
		List<String> restaurantLocationList = new ArrayList<>();
		List<String> restaurantRatingList = new ArrayList<>();
		List<String> restaurantVotesList = new ArrayList<>();
		List<String> restaurantIdList = new ArrayList<>();
		
		for(int i=0;i<restaurantDetailList.size();i++){
			
			String s1 =restaurantDetailList.get(i).getRestaurantName();

			restaurantNameList.add(s1);
			
			String s2 =restaurantDetailList.get(i).getLocation();
			restaurantLocationList.add(s2);
			
			String s3 =restaurantDetailList.get(i).getRating();
			restaurantRatingList.add(s3);
		
			String s4 =restaurantDetailList.get(i).getVotes();
			restaurantVotesList.add(s4);
			
			restaurantIdList.add(restaurantDetailList.get(i).getRestaurantId());
	
			}
	

		request.setAttribute("restaurantNameList", restaurantNameList);
		request.setAttribute("restaurantLocationList", restaurantLocationList);
		request.setAttribute("restaurantRatingList", restaurantRatingList);
		request.setAttribute("restaurantVotesList", restaurantVotesList);
		request.setAttribute("restaurantIdList", restaurantIdList);
		request.setAttribute("locality", locality);
		request.setAttribute("user", user);
		request.setAttribute("ok", check);

		
		RequestDispatcher dispatcher = null;
		if(view_delete.equals("view")) dispatcher = request.getRequestDispatcher("restaurantList.jsp");
		else if(view_delete.equals("delete")) dispatcher = request.getRequestDispatcher("deleteRestaurantList.jsp");
		dispatcher.forward(request, response);
		
		
	}
	
	
}
