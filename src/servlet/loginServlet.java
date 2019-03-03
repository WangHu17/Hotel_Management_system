package servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class loginServlet extends HttpServlet {

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
		String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String url = "jdbc:sqlserver://localhost:1433;Database=db";
		String user = "sa";
		String pwd = "160510111xyj";
		String username = request.getParameter("user");
		String upwd = request.getParameter("pwd");
		PrintWriter out = response.getWriter();
		Connection conn;
		try {
			Class.forName(driverName);
			try{
				conn = DriverManager.getConnection(url,user,pwd);
				String sql = "select *from usertab where uid = ?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, username);
				ResultSet rs = ps.executeQuery();
				String mima = "";
				while(rs.next()){
					mima = rs.getString("upwd").trim();
				}

				if(mima.equals(upwd)){
					HttpSession session = request.getSession();
					session.setAttribute("un", username);
					out.println("true");
					//request.getRequestDispatcher("welcome.jsp").forward(request, response);
				}
				else{
					out.println("false");
					//request.getRequestDispatcher("index.jsp").forward(request, response);
				}
			}catch(SQLException e){
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
