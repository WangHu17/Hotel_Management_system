package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

public class getPriceServlet extends HttpServlet {

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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String url = "jdbc:sqlserver://localhost:1433;Database=hotel_db";
		String user = "sa";
		String pwd = "160510111xyj";
		
		String roomNumber = request.getParameter("roomNumber");
		String addDay = request.getParameter("addDay");
		String sql = "declare @addMoney int,@orderNumber int,@oldExpiryTime date,@newExpiryTime date exec dbo.getPrice '"+roomNumber+"',"+addDay+",@addMoney output,@orderNumber output,@oldExpiryTime output,@newExpiryTime output select @addMoney as addMoney,@orderNumber as orderNumber,@oldExpiryTime as oldExpiryTime,@newExpiryTime as newExpiryTime";
		Connection conn = null;
		try {
			Class.forName(driverName);
			try {
				conn = DriverManager.getConnection(url,user,pwd);
				Statement st = conn.createStatement();
				ResultSet rs = st.executeQuery(sql);
				List<Map> list = new ArrayList<Map>();
 				while(rs.next()){
					String addMoney = rs.getString("addMoney");
					String orderNumber = rs.getString("orderNumber");
					String oldExpiryTime = rs.getString("oldExpiryTime");
					String newExpiryTime = rs.getString("newExpiryTime");
					Map e = new HashMap();
					e.put("addMoney", addMoney);
					e.put("orderNumber",orderNumber);
					e.put("oldExpiryTime",oldExpiryTime);
					e.put("newExpiryTime",newExpiryTime);
					list.add(e);
				}
				JSONArray json = JSONArray.fromObject(list);
				System.out.println(json);
				out.print(json);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
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
