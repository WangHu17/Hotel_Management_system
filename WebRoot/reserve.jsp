<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>预订</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/arrive.css">
	
	<script src="js/jquery.js"></script>
  </head>
  
  <body>
    <h2>订房</h2>
    <div class="nav client_nav selected"><i class="user_icon"></i>填写信息</div>
    <div class="nav finish"><i class="finish_icon"></i>订房完成</div>
    <div class="client_nav_after"></div>
    <div class="finish_after"></div>

    <div class="content content4">
      <h4>时间安排</h4>
      <div class="line"></div>
      入住时间<input type = "date" name = "checkInTime" class="box"><br>
      离开时间<input type = "date" name = "checkOutTime" class="box">
      <input type="button" value="确定" id="time" class="sure">
      <div class="emptyRoomBox">
          剩余空房间(请选择)<br><br>
      </div>
      
      
      <h4>个人信息</h4>
      <div class="line"></div>
      身份证号<input type = "text" name = "customerIDCard" class="box"><br>
      姓名<input type = "text" name = "customerName" class="box name">
      性别 &nbsp; 男<input type = "radio" name = "customerGender" value = "男" checked>  
           女<input type = "radio" name = "customerGender" value = "女"><br>
      电话号码<input type="text" name="customerPhoneNumber" class="box"><br>
      备注<input type = "text" name = "remarks" class="box bz"><br>
      <div>
        <input type = "reset" value = "重置" class="sure">
        <input type = "button" value = "提交" id="info" class="sure">
      </div>
      
    </div>

    <div class="content content2">
      <h3>恭喜您！ 订房成功！</h3>
      <div class="line"></div>
      <div class="title1">
        <h5>预定房间</h5>
        <h5>房间类型</h5>
      </div>
      <div style="clear: both">
        <input type="text" class="box reserveRoomNum" readonly="readonly">
        <input type="text" class="box reserveRoomType" readonly="readonly">
      </div>
      <div class="title1">
        <h5>入住时间</h5>
        <h5>离开时间</h5>
      </div>
      <div style="clear: both">
         <input type="text" class="box arriveTime" readonly="readonly">
         <input type="text" class="box leaveTime" readonly="readonly">  
      </div>
    </div>
 
    <script>
    	$(function(){
    		var $submitTime = $("#time");//提交时间查看空房间
            var $submitInfo = $("#info");//提交个人信息插入orders和customers
            var checkInTime = $("input[name=checkInTime]");//入住时间
            var checkOutTime = $("input[name=checkOutTime]");//离开时间
            var customerIDCard;//身份证号
            var customerGenderBox;//性别
            var customerName;//姓名
            var customerPhoneNumber;//电话号码
            var remarks;//备注
            var checkInDate;//转格式后储存的变量
            var checkOutDate;//转格式后储存的变量
            var roomNumber;//房间号
            var price;//价格
            var roomType;
            var roomUrl;//房间图片
            //转换格式（日期->字符串），以便插入数据库
            checkInTime.on('change', function(event) {
                event.preventDefault();
                checkInDate = $(this).val();
                console.log(checkInDate);
            });
            //转换格式（日期->字符串），以便插入数据库
            checkOutTime.on('change', function(event) {
                event.preventDefault();
                checkOutDate = $(this).val();
                console.log(checkOutDate);
            });
            
            //提交查询的该时间范围内空房
    		$submitTime.on('click',function(){
                if(checkInDate == undefined || checkOutDate == undefined){
                    alert("请选择时间！");
                }else{
                    $("#time").remove();
                    $(".emptyRoomBox").css("display","block");
                    $(".content4 h4").eq(1).css("marginTop","0");
                }
    			
    			$.ajax({
    				url:'SearchByTime',
    				type:'post',
    				dataType:'json',
    				data:{
    					'checkInTime':checkInDate,
                        'checkOutTime':checkOutDate
    				},
    				success:function(data){

    					$.each(data,function(index,ele){
                            var empty = $emptyRoom(index,ele);
                            $(".emptyRoomBox").append(empty);
                        });
                    },
                    error:function(data){

                        $.each(data,function(index,ele){
                            var empty = $emptyRoom(index,ele);
                            $(".emptyRoomBox").append(empty);
                        });
                    },
    			});
    		});
            //提交个人数据插入表格
            $submitInfo.on('click', function() {
                customerIDCard = $("input[name=customerIDCard]").val();//身份证号
                customerGenderBox = $("input[name=customerGender]");//性别
                var customerGender;
                for(var i=0;i<customerGenderBox.length; i++){
                    if(customerGenderBox[i].checked == true){
                        customerGender = customerGenderBox.eq(i).val();
                    }
                }
                customerName = $("input[name=customerName]").val();//姓名
                customerPhoneNumber = $("input[name=customerPhoneNumber]").val();//电话号码
                remarks = $("input[name=remarks]").val();//备注
                var emptyCheckBox = $("input[name=emptyRoom]");//空房间
                var emptyText;
                for(var i=0; i<emptyCheckBox.length; i++){
                    if(emptyCheckBox[i].checked == true){
                        emptyText = emptyCheckBox.eq(i).val();
                    }
                }
                var arr = emptyText.split(" ");
                roomNumber = arr[1];
                price = arr[5];
                roomType = arr[6];
                $.ajax({
                    url: 'checkinServlet',
                    type: 'post',
                    dataType: 'text',
                    data: {
                        'checkInTime':checkInDate,
                        'checkOutTime':checkOutDate,
                        'customerIDCard':customerIDCard,
                        'customerGender':customerGender,
                        'customerName':customerName,
                        'customerPhoneNumber':customerPhoneNumber,
                        'remarks':remarks,
                        'roomNumber':roomNumber,
                        'price':price,
                        'roomType':roomType
                    },
                    success:function(data){
                        //改变导航栏状态和content
                        $(".client_nav").removeClass('selected');
                        $(".client_nav_after").css("display","none");
                        $(".finish").addClass('selected');
                        $(".finish_after").css("display","block");
                        $(".content4").css("display","none");
                        $(".content2").css("display","block");
                        $(".reserveRoomNum").val(roomNumber);
                        $(".reserveRoomType").val(roomType);
                        $(".arriveTime").val(checkInDate);
                        $(".leaveTime").val(checkOutDate);
                    }
                });
    	    });
            function $emptyRoom(index,ele){
                var $empty = $("<input type=\"radio\" name=\"emptyRoom\" "+
        "value=\" "+(ele.roomNumber)+" "+(ele.price)+" "+(ele.roomType)+"\">"+ele.roomNumber+ele.roomType+" 价格："+ele.price+"元"+"<br><br>");
                return $empty;  
            }
        });
    </script>
  </body>
</html>
