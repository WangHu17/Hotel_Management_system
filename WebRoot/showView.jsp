<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

<head>
    <base href="<%=basePath%>">
    <title>视图</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="css/other.css">
    <link rel="stylesheet" href="//at.alicdn.com/t/font_956203_nnf0jf3nqpj.css">
    <script type="text/javascript" src="js/jquery.js"></script>
    <style>
        *{
          padding: 0;
          margin: 0;
        }
        #myform {
          width: 100%;
          height: 40px;
          display: flex;
          flex-direction: row;
          justify-content: space-around;
          align-items: center;
          text-align: center;
          color: black;
          cursor: pointer;
        }
        
        input,button {
          border: none;
          outline: none;
          cursor: pointer;
          font-size: 18px;
      }
       #myform button {
          width: 25%;
          background: purple;
          color: white;
          height: 100%;
          transition: .5s;
       }
       #myform button:hover {
        background: white;
        color: black;
       }
       h4 {
        text-align: center;
        margin: auto;
       }
       body {
        background: rgba(128, 0, 128, .1);
       }
    </style>
</head>

<body>
    <form id="myform" action="FindViewServlet" method="post">
        <button value="incomeView" name="viewType">收入视图</button>
        <button value="orderView" name="viewType">订单视图</button>
        <button value="roomInfoView" name="viewType">房间视图</button>
        <button value="timeExtensionOrdersView" name="viewType">续费视图</button>
    </form>
</body>

</html>