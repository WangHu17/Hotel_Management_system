package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

public class SearchInfoServlet extends HttpServlet {

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
		PrintWriter out = response.getWriter();
		//初始化
		String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String url = "jdbc:sqlserver://localhost:1433;Database=hotel_db";
		String user = "sa";
		String pwd = "160510111xyj";
		String orderProperty = request.getParameter("orderProperty");//获取查询订单的类别
		String SearchInfo = request.getParameter("SearchInfo");
		SearchInfo = URLDecoder.decode(SearchInfo,"utf-8");
		System.out.println(orderProperty);
		System.out.println(SearchInfo);
		String sql_order = "declare @Type varchar(25),@para varchar(25) set @Type = '"+orderProperty+"' set @para = '"+SearchInfo+"' exec ChooseSearchInfo @para,@Type";//订单视图查询语句
		Connection conn = null;
		try {
			Class.forName(driverName);
			try {
				conn = DriverManager.getConnection(url,user,pwd);
				Statement st = conn.createStatement();
				ResultSet rs = st.executeQuery(sql_order);
				List<Map> list = new ArrayList<Map>();
				if(rs.next()){
					do{
						String orderNumber = rs.getString("orderNumber");
						String orderStatus = rs.getString("orderStatus");
						String customerName = rs.getString("customerName");
						String roomNumber = rs.getString("roomNumber");
						String roomType = rs.getString("roomType");
						String orderTime = rs.getString("orderTime");
						String checkInTime = rs.getString("checkInTime");
						String checkOutTime = rs.getString("checkOutTime");
						String customerPhoneNumber = rs.getString("customerPhoneNumber");
						String totalMoney = rs.getString("totalMoney");
						Map e = new HashMap();
						e.put("orderNumber", orderNumber);
						e.put("orderStatus",orderStatus);
						e.put("customerName",customerName);
						e.put("roomNumber",roomNumber);
						e.put("roomType",roomType);
						e.put("orderTime",orderTime);
						e.put("checkInTime",checkInTime);
						e.put("checkOutTime",checkOutTime);
						e.put("customerPhoneNumber",customerPhoneNumber);
						e.put("totalMoney",totalMoney);
						list.add(e);
					}while(rs.next());
				}else{
					System.out.println("没有结果");
				}
				JSONArray json = JSONArray.fromObject(list);
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
		doGet(request, response);
	}

}
