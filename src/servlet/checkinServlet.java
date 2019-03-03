package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

public class checkinServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		//初始化
		String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String url = "jdbc:sqlserver://localhost:1433;Database=hotel_db";
		String user = "sa";
		String pwd = "160510111xyj";
		//从页面获取参数
		String checkinTime = request.getParameter("checkInTime");
		String checkOutTime = request.getParameter("checkOutTime");
		String customerName = request.getParameter("customerName");
		String customerIDCard = request.getParameter("customerIDCard");
		String customerGender = request.getParameter("customerGender");
		String remarks = request.getParameter("remarks");
		String roomNumber = request.getParameter("roomNumber");
		String customerPhoneNumber = request.getParameter("customerPhoneNumber");
		String price = request.getParameter("price");
		String orderStatus = "预订中";
		//获取当前时间
		Date now = new Date(); 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");//可以方便地修改日期格式
		String orderTime = dateFormat.format(now);
		// System.out.print(orderTime);
		Connection conn;
		String sql_customer = "insert customers values('"+customerIDCard+"','"+customerGender+"','"+customerName+"','"+customerPhoneNumber+"',"+price+")";
		String sql_orders = "insert orders values('"+orderStatus+"','"+customerIDCard+"','"+roomNumber+"','"+checkinTime+"','"+checkOutTime+"',"+price+",'"+orderTime+"')";
		try {
			Class.forName(driverName);
			try {
				conn = DriverManager.getConnection(url,user,pwd);
				Statement st = conn.createStatement();
				st.executeUpdate(sql_customer);
				st.executeUpdate(sql_orders);
				System.out.print("插入成功！");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
