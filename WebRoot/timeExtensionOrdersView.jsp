<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="Bean.timeExtensionOrdersViewBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>续费订单视图</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  </head>
  
  <body>
  <jsp:include page="showView.jsp"></jsp:include>
  <h4>续费订单视图</h4>

	

	<table id="hor-minimalist-b" summary="Employee Pay Sheet">
	    <thead>
	    	<tr>
	    		<th scope="col">订单号</th>
	    		<th scope="col">客户姓名</th>
	    		<th scope="col">联系电话</th>
	    		<th scope="col">房间号</th>
	    		<th scope="col">入住时间</th>
	    		<th scope="col">前到期时间</th>
	    		<th scope="col">现到期时间</th>
	    		<th scope="col">加钱数目</th>
	        </tr>
	    </thead>
	    <tbody>
	   <%
			List<timeExtensionOrdersViewBean> list = (List<timeExtensionOrdersViewBean>) request.getAttribute("list");
			if(list == null || list.size() <  1){
				out.print("<tr><td bgcolor='#FFFFFF' colspan='5'>没有任何信息</td></tr>");
			}else{
				for(timeExtensionOrdersViewBean e: list){
					
		%>
		<tr>
			<td bgcolor="#FFFFFF"><%=e.getOrderNumber()%></td>
			<td bgcolor="#FFFFFF"><%=e.getCustomerName()%></td>
			<td bgcolor="#FFFFFF"><%=e.getCustomerPhoneNumber()%></td>
			<td bgcolor="#FFFFFF"><%=e.getRoomNumber() %></td>
			<td bgcolor="#FFFFFF"><%=e.getCheckInTime() %></td>
			<td bgcolor="#FFFFFF"><%=e.getOldExpiryDate() %></td>
			<td bgcolor="#FFFFFF"><%=e.getNewExpiryDate() %></td>
			<td bgcolor="#FFFFFF"><%=e.getAddMoney() %></td>
		</tr>
		<%
			}
		}
		 %>		
    	</tbody>
	</table>

  </body>
</html>
