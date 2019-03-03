<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>旅店管理系统</title>
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
  	<meta http-equiv="pragma" content="no-cache">
  	<meta http-equiv="cache-control" content="no-cache">
  	<meta http-equiv="expires" content="0">    
  	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
  	<meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="//at.alicdn.com/t/font_956203_ucvafkc14vr.css">
  	<link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/welcome.css">
    <script type="text/javascript" src="js/jquery.js"></script>
    </head>
    
  <body>
    
   <jsp:include page="banner.jsp"></jsp:include>
    
   <jsp:include page="main.jsp"></jsp:include>
    
   <jsp:include page="copyright.jsp"></jsp:include>
  </body>
</html>
