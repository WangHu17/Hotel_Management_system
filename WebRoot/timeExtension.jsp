
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>续费</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="css/arrive.css">
    <script type="text/javascript" src="js/jquery.js"></script>

  </head>

  <body>
    <h1></h1>
    	
    


    <h2>续费</h2>
    <div class="nav client_nav selected"><i class="user_icon"></i>续费信息</div>
    <div class="nav finish"><i class="finish_icon"></i>续费成功</div>
    <div class="client_nav_after"></div>
    <div class="finish_after"></div>
    
    <div class="content content1">
      <h4>续费要求</h4>
      <div class="line"></div>
      续费房间号<input type="text" name="roomNumber" class="box ex_num"><br>
      续费天数<input type="text" name="addDay" class="box ex_days"><br>
        
      <div class="content3">
          <h4>续费之后</h4>
          <div class="line"></div>
          续费价格<input class="price" readonly="readonly">
          <div class="title1">
            <h5>新到期时间</h5>
            <h5>旧到期时间</h5>
          </div>
          <div style="clear: both">
             <input type="text" class="box newExpiryTime" readonly="readonly">
             <input type="text" class="box oldExpiryTime" readonly="readonly">  
          </div>
          订单编号 
          <input type="text" class="box order_num" readonly="readonly">
      </div>

      <div>
        <input type="button" name="getPrice" value="确认" class="sure sure1">
        <input type="button" name = "submitTimeExtension" value="提交" class="sure submit">
      </div>

    </div>

    <div class="content content2">
      <h3>恭喜您！ 续费成功！</h3>
      <div class="line"></div>
      <div class="title1">
        <h5>新到期时间</h5>
        <h5>旧到期时间</h5>
      </div>
      <div style="clear: both">
         <input type="text" class="box newExpiryTime" readonly="readonly">
         <input type="text" class="box oldExpiryTime" readonly="readonly">  
      </div>
    </div>

  </body>


  <script>
          $(function(){
            var $getPrice = $("input[name=getPrice]");
            var $submitTimeExtension = $("input[name=submitTimeExtension]");
            var addMoney;
            var orderNumber;
            var oldExpiryTime;
            var newExpiryTime;
            var roomNumber;
            //确定按钮
            $getPrice.on('click', function() {
            	var addDay = $("input[name=addDay]").val();
            	roomNumber = $("input[name=roomNumber]").val();
	            
	              $.ajax({
	                  url:'getPriceServlet',
	                  type:'post',
	                  dataType:'json',
	                  data: {
	                    'addDay':addDay,
	                    'roomNumber':roomNumber
	                  },
	                  success:function(data){
                          $(".content3").css("display","block");
	                      console.log(data);
	                      addMoney = data[0].addMoney;
	                      orderNumber = data[0].orderNumber;
	                      oldExpiryTime = data[0].oldExpiryTime;
	                      newExpiryTime = data[0].newExpiryTime;
                          $(".price").val(addMoney);
                          $(".newExpiryTime").val(newExpiryTime);
                          $(".oldExpiryTime").val(oldExpiryTime);
                          $(".order_num").val(orderNumber);
	                  } 
	                });
	            });
            //提交按钮
            $submitTimeExtension.on('click', function() {
                //改变导航栏状态和content
                $(".client_nav").removeClass('selected');
                $(".client_nav_after").css("display","none");
                $(".finish").addClass('selected');
                $(".finish_after").css("display","block");
                $(".content1").css("display","none");
                $(".content2").css("display","block");

            	$.ajax({
            		url: 'TimeExtensionServlet',
            		type: 'post',
            		dataType: 'json',
            		data: {
            			'addMoney':addMoney,
            			'orderNumber':orderNumber,
            			'oldExpiryTime':oldExpiryTime,
            			'newExpiryTime':newExpiryTime
            		},
            		success:function(data){
                        
            			console.log("续房成功！");
            		},
                    error:function(e) {
                        console.log('错误！');
                        console.log(e);
                    },
            	});
            });
          });   
  </script>
</html>
