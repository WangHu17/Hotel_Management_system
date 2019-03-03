package servlet;

import java.io.IOException;
import java.io.PrintWriter;
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

import Bean.incomeViewBean;
import Bean.orderViewBean;
import Bean.roomInfoViewBean;
import Bean.timeExtensionOrdersViewBean;

public class FindViewServlet extends HttpServlet {

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
		String viewType = request.getParameter("viewType");
		System.out.println(viewType);
		String sql_income = "select * from incomeView";//收入视图查询语句
		String sql_order = "select * from orderView";//订单视图查询语句
		String sql_roomInfoView = "select * from roomInfoView";//房间信息视图
		String sql_timeExtension = "select * from timeExtensionOrdersView";//续费订单视图
		Connection conn;
		try {
			Class.forName(driverName);
			try {
				conn = DriverManager.getConnection(url,user,pwd);
				Statement st = conn.createStatement();
				if(viewType.equals("incomeView"))//执行收入视图查询
				{
					System.out.println("执行收入视图成功!");
					ResultSet rs = st.executeQuery(sql_income);
					List<incomeViewBean> list = new ArrayList<incomeViewBean>();
					while(rs.next()){
						Date checkOutTime = rs.getDate("checkOutTime");
						int totalIncome = rs.getInt("totalIncome");
						int num = rs.getInt("num");
						incomeViewBean incomeView = new incomeViewBean();
						incomeView.setCheckOutTime(checkOutTime);
						incomeView.setNum(num);
						incomeView.setTotalIncome(totalIncome);
						list.add(incomeView);
					}
					request.setAttribute("list",list);
				}
				else if(viewType.equals("orderView")){//执行订单视图查询
					System.out.println("执行订单视图成功!");
					ResultSet rs = st.executeQuery(sql_order);
					List<orderViewBean> list = new ArrayList<orderViewBean>();
					while(rs.next()){
						int orderNumber = rs.getInt("orderNumber");
						String orderStatus = rs.getString("orderStatus");
						String customerName = rs.getString("customerName");
						String roomNumber = rs.getString("roomNumber");
						String roomType = rs.getString("roomType");
						Date orderTime = rs.getDate("orderTime");
						Date checkInTime = rs.getDate("checkInTime");
						Date checkOutTime = rs.getDate("checkOutTime");
						String customerPhoneNumber = rs.getString("customerPhoneNumber");
						int totalMoney = rs.getInt("totalMoney");
						orderViewBean orderView = new orderViewBean();
						orderView.setOrderNumber(orderNumber);
						orderView.setOrderStatus(orderStatus);
						orderView.setRoomNumber(roomNumber);
						orderView.setRoomType(roomType);
						orderView.setOrderTime(orderTime);
						orderView.setCheckInTime(checkInTime);
						orderView.setCheckOutTime(checkOutTime);
						orderView.setCustomerPhoneNumber(customerPhoneNumber);
						orderView.setCustomerName(customerName);
						orderView.setTotalMoney(totalMoney);
						list.add(orderView);
					}
					request.setAttribute("list",list);
				}
				else if(viewType.equals("roomInfoView")){
					System.out.println("执行房间信息视图成功!");
					ResultSet rs = st.executeQuery(sql_roomInfoView);
					List<roomInfoViewBean> list = new ArrayList<roomInfoViewBean>();
					while (rs.next()) {
						String roomNumber = rs.getString("roomNumber");
						String roomType = rs.getString("roomType");
						String remarks = rs.getString("remarks");
						int price = rs.getInt("price");
						roomInfoViewBean roomInfoView = new roomInfoViewBean();
						roomInfoView.setPrice(price);
						roomInfoView.setRemarks(remarks);
						roomInfoView.setRoomNumber(roomNumber);
						roomInfoView.setRoomType(roomType);
						list.add(roomInfoView);
					}
					request.setAttribute("list",list);
				}
				else if(viewType.equals("timeExtensionOrdersView")){
					System.out.println("执行续费订单视图成功!");
					ResultSet rs = st.executeQuery(sql_timeExtension);
					List<timeExtensionOrdersViewBean> list = new ArrayList<timeExtensionOrdersViewBean>();
					while(rs.next()){
						int orderNumber = rs.getInt("orderNumber");
						String customerName = rs.getString("customerName");
						String customerPhoneNumber = rs.getString("customerPhoneNumber");
						String roomNumber = rs.getString("roomNumber");
						Date checkInTime = rs.getDate("checkInTime");
						Date oldExpiryDate = rs.getDate("oldExpiryDate");
						Date newExpiryDate = rs.getDate("newExpiryDate");
						int addMoney = rs.getInt("addMoney");
						timeExtensionOrdersViewBean timeExtensionOrdersView = new timeExtensionOrdersViewBean();
						timeExtensionOrdersView.setOrderNumber(orderNumber);
						timeExtensionOrdersView.setCustomerName(customerName);
						timeExtensionOrdersView.setRoomNumber(roomNumber);
						timeExtensionOrdersView.setCustomerPhoneNumber(customerPhoneNumber);
						timeExtensionOrdersView.setCheckInTime(checkInTime);
						timeExtensionOrdersView.setOldExpiryDate(oldExpiryDate);
						timeExtensionOrdersView.setNewExpiryDate(newExpiryDate);
						timeExtensionOrdersView.setAddMoney(addMoney);
						list.add(timeExtensionOrdersView);
					}
					request.setAttribute("list",list);
				}
				else{
					System.out.println("进入视图失败！");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(viewType.equals("incomeView")){
			request.getRequestDispatcher("incomeView.jsp").forward(request, response);
		}else if(viewType.equals("orderView")){
			request.getRequestDispatcher("orderView.jsp").forward(request, response);
		}else if(viewType.equals("roomInfoView")){
			request.getRequestDispatcher("roomInfoView.jsp").forward(request, response);
		}
		else if(viewType.equals("timeExtensionOrdersView")){
			request.getRequestDispatcher("timeExtensionOrdersView.jsp").forward(request, response);
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
