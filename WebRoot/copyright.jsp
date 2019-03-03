<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'copyright.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style>
		#copyright {
			width: 100%;
			height: 25px;
			background: black;
			text-align: center;
			line-height: 25px;
			font-size: 12px;
			position: absolute;
			bottom: 0;
			left: 0;
			color: white;
		}
	</style>

  </head>
  
  <body>
    <div id="copyright">
    	CopyRight@2018 旅店管理系统 本系统由肖誉杰,王虎,李泽宇制作
    </div>
  </body>
</html>
