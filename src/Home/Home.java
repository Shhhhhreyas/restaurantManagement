package Home;

import java.sql.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Home {

	static Connection getConnection() {
		String dbURL = "jdbc:postgresql://localhost:5432/cs387";
		String dbUser = "shreyas";
		String dbPass = "123456)(";
		Connection connection=null;
		try {
			Class.forName("org.postgresql.Driver");
			connection = DriverManager.getConnection(dbURL, dbUser, dbPass);
		} catch(ClassNotFoundException cnfe){
			System.out.println("JDBC Driver not found");
		} catch(SQLException sqle){
			System.out.println("Error in getting connetcion from the database");
		}

		return connection;
	}

	static void closeConnection(Connection connection) {
		try{
			connection.close();
		} catch(SQLException sqle) {
			System.out.println("Error in close database connetcion");
		}
	}

	public static List<String> getLocalities(){

		List<String> localitiesList = new ArrayList<String>();

		Connection connection=null;

		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select distinct locality from locality order by locality asc");
			ResultSet rs= pstmt.executeQuery();
			while (rs.next()){
				localitiesList.add(rs.getString(1));
			}

		} catch(SQLException sqle){
			System.out.println("SQL exception when getting localities  in function getlocalities");
		} finally{
			closeConnection(connection);
		}


		return localitiesList;

	}
	
	public static List<MenuList> getMenu(String rest_id){

		List<MenuList> menuList = new ArrayList<MenuList>();

		Connection connection=null;

		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select item_name,price from menu where r_id = ?");
			pstmt.setString(1, rest_id);
			ResultSet rs= pstmt.executeQuery();
			while (rs.next()){
				MenuList item_i = new MenuList();
				
				item_i.setMenuItem(rs.getString(1));
				item_i.setItemPrice(rs.getString(2));
				
				menuList.add(item_i);
			}

		} catch(SQLException sqle){
			System.out.println("SQL exception when getting menu items  in function getMenu; Error: "+sqle);
		} finally{
			closeConnection(connection);
		}


		return menuList;

	}
	
	public static String getlocality(String id){
	
		System.out.println("hi");

		String locality = "";

		Connection connection=null;

		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select locality from locality where restaurant_id=?");
			pstmt.setString(1, id);
			ResultSet rs= pstmt.executeQuery();
			while (rs.next()){
				locality = rs.getString(1);
			}

		} catch(SQLException sqle){
			System.out.println("SQL exception when getting locality in function getlocality");
		} finally{
			closeConnection(connection);
		}


		return locality;

	}

	public static void addRestaurantDetails(String id,String name,String location,String menuLink,String phone,int cost){

		Connection connection=null;
		System.out.println(id+name+location+menuLink+phone+cost);

		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("insert into restaurant values(?,?,?,?,'0',?,?)");
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, location);
			pstmt.setString(4, menuLink);
			pstmt.setString(5, phone);
			pstmt.setInt(6, cost);
			int rs= pstmt.executeUpdate();
			/*	while (rs.next()){

			}*/

		} catch(SQLException sqle){
			System.out.println("SQL exception when getting restaurant  in function addRestaurantDetails");
		} finally{
			closeConnection(connection);
		}

		return;
	}


	public static void addRestaurant(String id,String locality){

		Connection connection=null;

		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("insert into locality values(?,?)");
			pstmt.setString(1, locality);
			pstmt.setString(2, id);

			int rs= pstmt.executeUpdate();
			/*	while (rs.next()){

			}*/

		} catch(SQLException sqle){
			System.out.println("SQL exception when getting locality in function addRestaurant");
		} finally{
			closeConnection(connection);
		}

		return;
	}
	

	public static List<RestaurantDetails> getRestaurants(String locality){

		List<String> restId = new ArrayList<>();

		List<RestaurantDetails> detailList = new ArrayList<>();


		Connection connection=null;
		try{
			connection=getConnection();
			PreparedStatement pstmt1= connection.prepareStatement("select restaurant_id from locality where locality=?");
			
			pstmt1.setString(1, locality);
			ResultSet rs1= pstmt1.executeQuery();

			while (rs1.next()){
				restId.add(rs1.getString(1));
			}
			

			for(int i=0;i<restId.size();i++){

				String id = restId.get(i);
				
				RestaurantDetails obj = new RestaurantDetails();
				
				obj.setRestaurantId(id);
				
				PreparedStatement pstmt2= connection.prepareStatement("select restaurant_name from restaurant where restaurant_id=?");
				pstmt2.setString(1, id);
				ResultSet rs2= pstmt2.executeQuery();

				while (rs2.next()){
					
					obj.setRestaurantName(rs2.getString(1));
				}
				PreparedStatement pstmt3= connection.prepareStatement("select rating from restaurant where restaurant_id=?");
				pstmt3.setString(1, id);
				ResultSet rs3= pstmt3.executeQuery();

				while (rs3.next()){
					obj.setRating(rs3.getString(1));

				}

				PreparedStatement pstmt4= connection.prepareStatement("select location from restaurant where restaurant_id=?");
				pstmt4.setString(1, id);
				ResultSet rs4= pstmt4.executeQuery();

				while (rs4.next()){
					obj.setLocation(rs4.getString(1));

				}

				PreparedStatement pstmt5= connection.prepareStatement("select count(restaurant_id) from reviews where restaurant_id=?");
				pstmt5.setString(1, id);
				ResultSet rs5= pstmt5.executeQuery();

				while (rs5.next()){
					obj.setVotes(rs5.getString(1));
				}
				
				
				detailList.add(obj);
				
			}
			

		} catch(SQLException sqle){
			System.out.println("SQL exception when getting restaurant details list  in function getRestaurants");
		} finally{
			closeConnection(connection);
		}
		return detailList;

	}
	
	public static RestaurantDetails getAllDetails(String id){
		RestaurantDetails obj = new RestaurantDetails();

		Connection connection=null;

		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select restaurant_name,location,menu,rating,phone_no,cost from restaurant where restaurant_id=?");
			pstmt.setString(1, id);
			ResultSet rs1= pstmt.executeQuery();

			while (rs1.next()){
				obj.setRestaurantName(rs1.getString(1));
				obj.setLocation(rs1.getString(2));
				obj.setMenu(rs1.getString(3));
				obj.setRating(rs1.getString(4));
				obj.setPhone(rs1.getString(5));
				obj.setCost(rs1.getString(6));
				
			}
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting restaurant details list in function getAllDetails; Error: "+sqle);
		} finally{
			closeConnection(connection);
		}
		return obj;
		
		
		
	}
	
	public static void addReviews(int rating,String userId,String restaurantId)
	{
		Connection connection=null;

		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("insert into reviews values(?,?,?)");
			pstmt.setString(1, userId);
			pstmt.setString(2, restaurantId);
			pstmt.setInt(3, rating);

			int rs1= pstmt.executeUpdate();

			
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting restaurant details list in function addReviews");
			System.out.println(sqle.getMessage());
		} finally{
			closeConnection(connection);
		}
		
	}
	
	public static void addAccount(String id,String password){
		
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("insert into account values(?,?)");
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			
			
			pstmt.executeUpdate();
			
		
			
		} catch(SQLException sqle){
			System.out.println("SQL exception when trying to fetch Accounts Table; Error: "+sqle);
		} finally{
			closeConnection(connection);
		}
		
		return;
	}

	public static int checkPassword(String id,String password){
		int res=0;
		Connection connection=null;
		
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select password1 from account where user_id=?");
			pstmt.setString(1, id);
			ResultSet rs= pstmt.executeQuery();
			while (rs.next()){
			
				String s = rs.getString(1);

				
				if(s.equals(password))
				{	res=1;
				}
			}
			
		} catch(SQLException sqle){
			System.out.println("SQL exception when getting Accounts Table; Error: "+sqle);
		} finally{
			closeConnection(connection);
		}
		
		return res;
	}

	public static int checkPasswordadmin(String id,String password){
		int res=0;
		Connection connection=null;
	
		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select admin_pass from adminaccount where admin_id=?");
			pstmt.setString(1, id);
			ResultSet rs= pstmt.executeQuery();
		
			while (rs.next()){
		
				String s = rs.getString(1);

			
				if(s.equals(password))
				{
					res=1;
				}
			}
		
		}
		catch(SQLException sqle){
			System.out.println("SQL exception when getting Admin Table; Error: "+sqle);
		}
		finally{
			closeConnection(connection);
		}
	
		return res;
		}

	public static boolean deleteRestaurant(String id){
	
		Connection conn = null;
		Statement stmt = null;
		int rs=0;
	
		try{
			conn=getConnection();
			stmt = conn.createStatement();
			String sql = "DELETE FROM locality WHERE restaurant_id = '"+id+"';";
			rs = stmt.executeUpdate(sql);
		}
	
		catch(SQLException se){
			System.out.println("Unable to execute query; Error: "+se);
		}
		finally{
			closeConnection(conn);
		}
	
		int rs1=0;
	
		try{
			conn=getConnection();
			stmt = conn.createStatement();
			String sql = "DELETE FROM restaurant WHERE restaurant_id = '"+id+"';";
			rs1 = stmt.executeUpdate(sql);
		}
	
		catch(SQLException se){
			System.out.println("Unable to execute query; Error: "+se);
		}
		finally{
			closeConnection(conn);
		}
		if(rs==1&&rs1==1) return true;
		else return false;
		}

	public static List<String> getUsers(){
		List<String> userList = new ArrayList<String>();

		Connection connection=null;

		try{
			connection=getConnection();
			PreparedStatement pstmt= connection.prepareStatement("select user_id from account");
			ResultSet rs= pstmt.executeQuery();
			while (rs.next()){
				userList.add(rs.getString(1));
			}

		} catch(SQLException sqle){
			System.out.println("SQL exception when getting users in function getUsers; Error: "+sqle);
		} finally{
			closeConnection(connection);
		}


		return userList;
	
	}
	
	public static boolean deleteUsers(String[] users){
		
		Connection conn = null;
		Statement stmt = null;
		int rs=1;
		for(int i=0;i<users.length;i++) {
			if(rs==1) {
		try{
			conn=getConnection();
			stmt = conn.createStatement();
			String sql = "DELETE FROM account WHERE user_id = '"+users[i]+"';";
			rs = stmt.executeUpdate(sql);
		}
	
		catch(SQLException se){
			System.out.println("Unable to execute query; Error: "+se);
		}
		finally{
			closeConnection(conn);
		}
		}
			else {rs=0; break;}
		}
		if(rs==1) return true;
		else return false;
	}
}

