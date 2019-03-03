<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="Bean.incomeViewBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.util.*" %>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>收入视图</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style>
		h4 {
			text-align: center;
			margin: 0 auto;
		}
	</style>
  </head>
  <body>
  	<jsp:include page="showView.jsp"></jsp:include>

  	<h4>收入视图</h4>

  	<table id="hor-minimalist-b" summary="Employee Pay Sheet">
	    <thead>
	    	<tr>
	        	<th scope="col">退房时间</th>
	            <th scope="col">总价</th>
	            <th scope="col">订单个数</th>
	        </tr>
	    </thead>
	    <tbody>
	    <%
			List<incomeViewBean> list = (List<incomeViewBean>) request.getAttribute("list");
			if(list == null || list.size() <  1){
				out.print("<tr><td>暂无信息</td></tr>");
			}else{
				for(incomeViewBean e: list){
		%>
		<tr >
			<td><%=e.getCheckOutTime()%></td>
			<td><%=e.getTotalIncome()%></td>
			<td><%=e.getNum()%></td>
		</tr>
		<%
			}
		}
		 %>	
    	</tbody>
	</table>
    
  </body>
</html>
