<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>旅店管理系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <link rel="stylesheet" href="css/styles.css">
  <link rel="stylesheet" href="css/default.css">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="//at.alicdn.com/t/font_956203_hmjb6zplhjn.css">
  <script type="text/javascript" src="js/jquery.js"></script>
  <script type="text/javascript" src="http://cdn.bootcss.com/jqueryui/1.11.0/jquery-ui.min.js"></script>
  </head>
  
  <body>
  <div class='login'>
    <div class='login_title'>
      <span>旅店管理系统登录</span>
    </div>
    <div class='login_fields'>
      <div class='login_fields__user'>
        <div class='icon'>
          <img src='img/user_icon_copy.png'>
        </div>
        <input placeholder='用户名' type='text' id="username">
          <div class='validation'>
            <img src='img/tick.png'>
          </div>
        </input>
      </div>
      <div class='login_fields__password'>
        <div class='icon'>
          <img src='img/lock_icon_copy.png'>
        </div>
        <input placeholder='密码' type='password' id="password">
        <div class='validation'>
          <img src='img/tick.png'>
        </div>
      </div>
      <div class='login_fields__submit'>
        <input type='submit' value='登录' id="ok">
        <div class='forgot'>
          <a href='#'>忘记密码?</a>
        </div>
      </div>
    </div>
     <div class='error'>
      <h2>验证失败</h2>
      <a href="index.jsp">请重新登录!</a>
    </div>
    <div class='success'>
      <h2>验证成功</h2>
      <%  
        if(session.getAttribute("un") != null){
      %>
      <p>欢迎登录~<%=session.getAttribute("un")%></p>
      <%}%>
      <h3 class="mainJsp">进入首页</h3>
    </div>
    <div class='disclaimer'>
      <p>旅店管理系统是一个...........</p>
    </div>
  </div>
  <div class='authent'>
    <img src='img/puff.svg'>
    <p>正在验证,请稍等</p>
  </div>
  <script type="text/javascript" src='js/stopExecutionOnTimeout.js?t=1'></script>
  </body>
  <script type="text/javascript" src="js/login.js"></script>
</html>
