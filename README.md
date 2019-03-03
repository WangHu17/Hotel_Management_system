# hotel_managerment_final
数据库和javaWeb的期末作业
# AJAX数据回传名字汇总
## 1.reserve.jsp
### 渲染位置(主要是看空房间)
#### 回传的参数
 - [ ] roomType(房间类型)
 - [ ] roomNumber(房间号)
 - [ ] price(房间价格)

## 2.arrive.jsp
### 渲染位置(主要是为了看到状态更新的值，主要是看orderStatus)
#### 回传的参数
 - [ ] orderNumber(订单号)
 - [ ] orderStatus(订单状态,分为“已入住”，“预订中”,“已退房”)
 - [ ] customerIDCard(顾客身份证号)                 
 - [ ] roomNumber(房间号)
 - [ ] checkInTime(入住时间)
 - [ ] checkOutTime(退房时间)
 - [ ] totalMoney(总花费，**可能会更新，因为会续住**)
 - [ ] orderTime(预订时间，当前的时间)
 
## 3.leave.jsp
### 渲染位置(同2)
#### 回传的参数
 - [ ] orderNumber(订单号)
 - [ ] orderStatus(订单状态,分为“已入住”，“预订中”,“已退房”)
 - [ ] customerIDCard(顾客身份证号)                 
 - [ ] roomNumber(房间号)
 - [ ] checkInTime(入住时间)
 - [ ] checkOutTime(退房时间)
 - [ ] totalMoney(总花费，**可能会更新，因为会续住**)
 - [ ] orderTime(预订时间，当前的时间)
 
## 4.timeExtension.jsp
### 价格渲染
#### 回传的参数
- [ ] addMoney(根据时间*房价得到的总价)
### 续住成功信息渲染
#### 回传的参数
- [ ] addMoney(根据时间*房价得到的总价)
- [ ] orderNumber（订单号）
- [ ] oldExpiryTime(以前的离开时间)
- [ ] newExpiryTime(续住以后的离开时间)
## 肖誉杰使用的文件
1. - **css**
	1. reset.css
	2. style.css
1. - **js**
	1. app.js
	2. login.js
	3. particles.min.js
1. - **img**
	1. bg.jpg
	2. name.jpg
	3. password.jpg
1. - **Servlet**
	1. loginServlet.java
	2. SearchByTime.java
	3. checkinServlet.java
	4. 查询.java(还没写)
1. - **jsp**
	1. index.jsp
	2. welcome.jsp
	3. reserve.jsp

## 王虎的管理文件
1. - **Servlet**
	1. arriveServlet.java
	2. getPriceServlet.java
	3. TimeExtensionServlet.jva
	4. leaveServlet.java
2. - **jsp**
	1. arrive.jsp
	2. leave.jsp
	3. timeExtension.jsp

## 公用文件
1. - **js**
	1. js/jquery.js
