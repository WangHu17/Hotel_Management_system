<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="Bean.roomInfoViewBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>房间信息视图</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<jsp:include page="showView.jsp"></jsp:include>
   	<h4>房间信息视图</h4>
		

	<table id="hor-minimalist-b" summary="Employee Pay Sheet">
	    <thead>
	    	<tr>
	        	<th scope="col">房间号</th>
	            <th scope="col">房间类型</th>
	            <th scope="col">房间备注</th>
	            <th scope="col">价格</th>
	        </tr>
	    </thead>
	    <tbody>
	    <%
			List<roomInfoViewBean> list = (List<roomInfoViewBean>) request.getAttribute("list");
			if(list == null || list.size() <  1){
				out.print("<tr><td bgcolor='#FFFFFF' colspan='5'>没有任何信息</td></tr>");
			}else{
				for(roomInfoViewBean e: list){
					
		%>
		<tr>
			<td bgcolor="#FFFFFF"><%=e.getRoomNumber()%></td>
			<td bgcolor="#FFFFFF"><%=e.getRoomType()%></td>
			<td bgcolor="#FFFFFF"><%=e.getRemarks()%></td>
			<td bgcolor="#FFFFFF"><%=e.getPrice() %></td>
		</tr>
		<%
			}
		}
		 %>	
    	</tbody>
	</table>


  </body>
</html>
