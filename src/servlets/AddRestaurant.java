package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Home.Home;

/**
 * Servlet implementation class addRestaurant
 */
@WebServlet("/addRestaurant")
public class AddRestaurant extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddRestaurant() {
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
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String location = request.getParameter("address");
		String menuLink = request.getParameter("menu_link");
		String phone = request.getParameter("phone");
		int cost = Integer.parseInt(request.getParameter("cost"));
		String locality = request.getParameter("locality");
		String user = request.getParameter("user");
		int check = Integer.parseInt(request.getParameter("ok"));
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("addedRes.jsp");
		if(user.equals("null")||user==null) {
			request.setAttribute("user",user);
			dispatcher.forward(request, response);
		}
		
		else {
			Home.addRestaurantDetails(id,name,location,menuLink,phone,cost);
			Home.addRestaurant(id, locality);
			request.setAttribute("user",user);
			request.setAttribute("ok", check);
			dispatcher.forward(request, response);
		}

		
		
	}

}
