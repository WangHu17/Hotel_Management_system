<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>退房</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/arrive.css">
	
  <script type="text/javascript" src="js/jquery.js"></script>
  </head>
  
  <body>

    <h2>退房</h2>
    <div class="nav client_nav selected"><i class="user_icon"></i>填写信息</div>
    <div class="nav finish"><i class="finish_icon"></i>退房完成</div>
    <div class="client_nav_after"></div>
    <div class="finish_after"></div>
    
    <div class="content content1">
      顾客身份证号
      <div class="line"></div>
      <input type = "text" name = "customerIDCard" class="box id">
      <input type="button" name="leaveSumbit" value="确定" class="sure">
    </div>

    <div class="content content2">
      <h4>个人信息</h4>
      <div class="line"></div>
      <div class="title">
        <h5>身份证号</h5>
        <h5>状态</h5>
      </div>
      <input type="text" class="box id1" readonly="readonly">
      <input type="text" class="box status" readonly="readonly">

      <h4>住房信息</h4>
      <div class="line"></div>
      <div class="title">
        <h5>入住时间</h5>
        <h5>房间号</h5>
      </div>
      <input type="text" class="box arrive_time" readonly="readonly">
      <input type="text" class="box room_num" readonly="readonly">
      <div class="title title3">
        <h5>离开时间</h5>
        <h5>总消费</h5>
      </div>
      <input type="text" class="box leave_time" readonly="readonly">
      <input type="text" class="box cost" readonly="readonly">

      <h4>预定信息</h4>
      <div class="line"></div>
      <div class="title">
        <h5>预定时间</h5>
        <h5>预定编号</h5>
      </div>
      <input type="text" class="box reserve_time" readonly="readonly">
      <input type="text" class="box reserve_num" readonly="readonly">
    </div>
  </body>


  <script>
          $(function(){
            var $submitID = $("input[name=leaveSumbit]");
            
            $submitID.on('click', function() {
              var customerIDCard = $("input[name=customerIDCard]").get(0).value;
              
              $.ajax({
                  url:'leaveServlet',
                  type:'post',
                  dataType:'json',
                  data: {
                    'customerIDCard':customerIDCard
                  },
                  success:function(data){
                    //改变导航栏状态和content
                    $(".client_nav").removeClass('selected');
                    $(".client_nav_after").css("display","none");
                    $(".finish").addClass('selected');
                    $(".finish_after").css("display","block");
                    $(".content1").css("display","none");
                    $(".content2").css("display","block");
                    //渲染信息
                    $.each(data,function(index, ele) {
                        $(".id1").val(ele.customerIDCard);
                        $(".status").val(ele.orderStatus);
                        $(".arrive_time").val(ele.checkInTime);
                        $(".room_num").val(ele.roomNumber);
                        $(".leave_time").val(ele.checkOutTime);
                        $(".cost").val(ele.totalMoney);
                        $(".reserve_time").val(ele.orderTime);
                        $(".reserve_num").val(ele.orderNumber);
                    });
                  } 
              });
            });
          });		
  </script>
</html>
