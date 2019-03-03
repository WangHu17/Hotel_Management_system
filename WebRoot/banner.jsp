<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="//at.alicdn.com/t/font_956203_b8tlsmdvn1d.css">
	<link rel="stylesheet" href="css/banner.css">
  </head>
  
  <body>
    <!-- 顶部菜单栏 -->
    <div id="banner">
    	<div class="banner-left fl">
    		<div class="search">
    			<i class="iconfont icon-yewubanli"></i>
    			<span class="word">业务办理</span>
    			<span class="triangle"></span>
    			<div class="searchBtn">
	    			<div class="content reserve">
	    				<i class="iconfont icon-jiantou"></i>
	    				<span>订房</span>
		    		</div>
					<div class="content timeExtension">
						<i class="iconfont icon-loading2-copy"></i>
						<span>续费</span>
					</div>
					<div class="content leave">
						<i class="iconfont icon-jiantou-copy"></i>
						<span>退房</span>
					</div>
				</div>
    		</div>
    		<div class="view">
    			<i class="iconfont icon-chaxun"></i>
    			<span class="word">视图查询</span>
    		</div>
			<div class="find">
    			<i class="iconfont icon-chaxun"></i>
    			<span class="word">订单浏览</span>
    		</div>
    	</div>
    	<div class="banner-right fr">
    		<i class="iconfont icon-member"></i>
    		客房管理员:<%=session.getAttribute("un")%>
    	</div>
		<div class="banner-time"></div>
    </div>
  </body>
  <script type="text/javascript" src="js/main.js"></script>
</html>
