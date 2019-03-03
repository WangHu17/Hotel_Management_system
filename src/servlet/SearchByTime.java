package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.text.DateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;

import net.sf.json.JSONArray;


import com.sun.corba.se.pept.transport.Connection;

public class SearchByTime extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String DriverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String url = "jdbc:sqlserver://localhost:1433;Database=hotel_db";
		String user = "sa";
		String pwd = "160510111xyj";
		String checkinTime = request.getParameter("checkInTime");
		String checkOutTime = request.getParameter("checkOutTime");
//		try {
//			java.util.Date checkInDate = fmt.parse(checkinTime);
//			java.util.Date checkOutDate = fmt.parse(checkOutTime);
//		} catch (ParseException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
		String sql = "select room.roomType,roomTypeAndPrice.price,room.roomNumber from room inner join roomTypeAndPrice on room.roomType = roomTypeAndPrice.roomType where roomNumber not in (select orders.roomNumber from orders where((orders.checkInTime  between '"+checkinTime+"' and '"+checkOutTime+"')) or ((orders.checkOutTime between '"+checkinTime+"' and '"+checkOutTime+"')))";
		java.sql.Connection conn;
		try {
			Class.forName(DriverName);
			try {
				conn = DriverManager.getConnection(url,user,pwd);
				PreparedStatement ps = conn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				List<Map> list = new ArrayList<Map>();
 				while(rs.next()){
					String roomType = rs.getString("roomType");
					String roomNumber = rs.getString("roomNumber");
					String price = rs.getString("price");
<<<<<<< HEAD
=======
//					Map<String,String> e = new HashMap();
>>>>>>> wh
					Map e = new HashMap();
					e.put("roomType", roomType);
					e.put("roomNumber",roomNumber);
					e.put("price", price);
					list.add(e);
				}
				JSONArray json = JSONArray.fromObject(list);
				out.print(json);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
				doGet(request,response);
	}

}
