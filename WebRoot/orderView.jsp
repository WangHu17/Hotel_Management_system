<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="Bean.orderViewBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订单视图</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" href="css/other.css">
  </head>
  
  <body>
  	<jsp:include page="showView.jsp"></jsp:include>
   <h4>订单视图</h4>
   <table id="hor-minimalist-b" summary="Employee Pay Sheet">
	    <thead>
	    	<tr>
                <th scope="col">订单号</th>
                <th scope="col">订单状态</th>
                <th scope="col">客户姓名</th>
                <th scope="col">房间号</th>
                <th scope="col">房间类型</th>
                <th scope="col">预定时间</th>
                <th scope="col">入住时间</th>
                <th scope="col">退房时间</th>
                <th scope="col">顾客电话号码</th>
                <th scope="col">总金额</th>
	        </tr>
	    </thead>
    	<tbody>
    	   <%
            List<orderViewBean> list = (List<orderViewBean>) request.getAttribute("list");
            if(list == null || list.size() <  1){
                out.print("<tr><td bgcolor='#FFFFFF' colspan='5'>没有任何信息</td></tr>");
            }else{
                for(orderViewBean e: list){
                    
        %>
        <tr>
            <td bgcolor="#FFFFFF"><%=e.getOrderNumber()%></td>
            <td bgcolor="#FFFFFF"><%=e.getOrderStatus()%></td>
            <td bgcolor="#FFFFFF"><%=e.getCustomerName()%></td>
            <td bgcolor="#FFFFFF"><%=e.getRoomNumber()%></td>
            <td bgcolor="#FFFFFF"><%=e.getRoomType()%></td>
            <td bgcolor="#FFFFFF"><%=e.getOrderTime()%></td>
            <td bgcolor="#FFFFFF"><%=e.getCheckInTime()%></td>
            <td bgcolor="#FFFFFF"><%=e.getCheckOutTime()%></td>
            <td bgcolor="#FFFFFF"><%=e.getCustomerPhoneNumber()%></td>
            <td bgcolor="#FFFFFF"><%=e.getTotalMoney()%></td>
        </tr>
        <%
            }
        }
         %>
    	</tbody>
	</table>

  </body>
</html>
