# 开发环境
- 数据库：SQL Server 2014
- 编译器：MyEclipse
- 浏览器：Chrome
- 服务器：Wampserver64
# 技术栈
java、jsp、sql、html、css、JavaScript、jQuery、ajax
# 项目功能模块图
![image](https://user-images.githubusercontent.com/39235304/124359154-510c7080-dc56-11eb-8d01-b4338a666b6d.png)
# 数据库表关系图
![image](https://user-images.githubusercontent.com/39235304/124359177-6b464e80-dc56-11eb-9f2e-466a47f78cad.png)
# 项目截图
## 登录页面
![image](https://user-images.githubusercontent.com/39235304/124359192-7e591e80-dc56-11eb-8a18-e6ffb78e8767.png)
## 首页
![image](https://user-images.githubusercontent.com/39235304/124359257-bceed900-dc56-11eb-898b-21547c6c80e7.png)
## 订房页面
![image](https://user-images.githubusercontent.com/39235304/124359276-d3953000-dc56-11eb-91a6-82ab390fc8a9.png)
![image](https://user-images.githubusercontent.com/39235304/124359337-15be7180-dc57-11eb-9971-b6c8e0b9b016.png)
## 入住页面
![image](https://user-images.githubusercontent.com/39235304/124359287-e0198880-dc56-11eb-8a30-ae5ce8a80b2f.png)
![image](https://user-images.githubusercontent.com/39235304/124359324-0fc89080-dc57-11eb-83e0-e4e7e1a78257.png)
## 续费页面
![image](https://user-images.githubusercontent.com/39235304/124359302-ee67a480-dc56-11eb-85e3-47a314d31ccd.png)
![image](https://user-images.githubusercontent.com/39235304/124359321-0a6b4600-dc57-11eb-8315-eb7ffea15e01.png)
## 退房页面
![image](https://user-images.githubusercontent.com/39235304/124359314-f9bad000-dc56-11eb-95ab-0ab916c39880.png)
![image](https://user-images.githubusercontent.com/39235304/124359320-0a6b4600-dc57-11eb-914f-f2c5d0a47b08.png)
## 各视图页面
![image](https://user-images.githubusercontent.com/39235304/124359367-32f34000-dc57-11eb-9248-e100219002ae.png)
![image](https://user-images.githubusercontent.com/39235304/124359369-34bd0380-dc57-11eb-8111-5a11a1547d56.png)
![image](https://user-images.githubusercontent.com/39235304/124359372-35ee3080-dc57-11eb-8ae4-00d3ccf8d117.png)
![image](https://user-images.githubusercontent.com/39235304/124359376-3981b780-dc57-11eb-911d-a53798a3feca.png)
## 订单查询页面
![image](https://user-images.githubusercontent.com/39235304/124359384-430b1f80-dc57-11eb-93c3-0202da8bcece.png)
![image](https://user-images.githubusercontent.com/39235304/124359397-4e5e4b00-dc57-11eb-8038-ee6c12a72e17.png)
## 娱乐功能
![image](https://user-images.githubusercontent.com/39235304/124359404-56b68600-dc57-11eb-8db8-1cf3ed0ad375.png)
### 扫雷
![image](https://user-images.githubusercontent.com/39235304/124359419-67ff9280-dc57-11eb-91c5-dcd2c6697290.png)
### 贪吃蛇
![image](https://user-images.githubusercontent.com/39235304/124359423-6df57380-dc57-11eb-898c-1acb78251197.png)
### 消灭星星
![image](https://user-images.githubusercontent.com/39235304/124359427-7352be00-dc57-11eb-8085-ca7d13705bb2.png)
### 坚持30s
![image](https://user-images.githubusercontent.com/39235304/124359430-7c438f80-dc57-11eb-9505-767bf149662d.png)
### 音乐播放器
![image](https://user-images.githubusercontent.com/39235304/124359433-82d20700-dc57-11eb-84a2-8683d0f0441d.png)
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
