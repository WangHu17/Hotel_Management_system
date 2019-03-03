create database db

USE [db]
GO
/****** Object:  Table [dbo].[usertab]    Script Date: 12/05/2018 21:46:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usertab](
	[uid] [nchar](15) NOT NULL,
	[upwd] [nchar](12) NOT NULL
) ON [PRIMARY]
GO
create database hotel_db
CREATE TABLE roomTypeAndPrice
(
	--房间类型（主码）
	roomType VARCHAR(32),
	--价格
	price int check(price > 0),
	--主键
	PRIMARY KEY (roomType)
)
CREATE TABLE room
(
	roomNumber CHAR(6),
	roomType VARCHAR(32) NOT NULL,
	remarks VARCHAR(32),
	PRIMARY KEY (roomNumber),
	FOREIGN KEY (roomType) REFERENCES roomTypeAndPrice(roomType)
)

CREATE TABLE customers
(
	--顾客身份证
	customerIDCard CHAR(18),
	--性别
	customerGender CHAR(4) check (customerGender ='男' or customerGender='女'),  --限制 男或女  
	--姓名
	customerName VARCHAR(16) NOT NULL,  
	--手机号码
	customerPhoneNumber CHAR(11) , 
	--消费金额
	totalAmount INT check(totalAmount > 0),  
	--主键
	PRIMARY KEY (customerIDCard)
)

CREATE TABLE orders
(
	--订单号
	orderNumber int identity(1,1) NOT NULL  , 
	--订单状态
	orderStatus CHAR(18) check (orderStatus = '预订中' or orderStatus = '已入住'or orderStatus = '已退房'),
	--客户身份证
	customerIDCard CHAR(18),
	--入住房间号
	roomNumber CHAR(6) NOT NULL,
	--入住时间
	checkInTime DATE NOT NULL,
	--离店时间
	checkOutTime DATE NOT NULL,
	--需付金额(由于可能续费，不能作为外键)
	totalMoney INT check(totalMoney > 0) NOT NULL,
	--预订时间
	orderTime DATE NOT NULL,
	--主键
	PRIMARY KEY (orderNumber),
	--外键
	FOREIGN KEY (customerIDCard) REFERENCES customers(customerIDCard),

	FOREIGN KEY (roomNumber) REFERENCES room(roomNumber),

)

CREATE TABLE timeExtension    
(
	--操作记录号
	operatingID int identity(1,1) check(operatingID > 0) not null,
	--操作的订单号(是记录中的订单号，外码，参照订单表)
	orderNumber int not null,
	--住房原到期日期
	oldExpiryDate DATE NOT NULL,
	--住房新到期日期
	newExpiryDate DATE NOT NULL,
	--需要添加的金额
	addMoney INT check(addMoney > 0) NOT NULL,
	--主键
	PRIMARY KEY (operatingID),
	--外键
	FOREIGN KEY (orderNumber) REFERENCES orders(orderNumber)

)

-- 创建更新的顾客消费总金额的触发器
IF OBJECT_ID('insertAddMoneyToOrdersTrigger','TR') IS NOT NULL
DROP TRIGGER insertAddMoneyToOrdersTrigger
CREATE trigger insertAddMoneyToOrdersTrigger 
ON timeExtension 
after insert 
as
begin
	declare @addMoney int
	declare @orderNumber int
	declare @customerIDCard char(18)
	declare @newExpiryDate date
	select @orderNumber=orderNumber from inserted
	select @addMoney=addMoney from inserted
	select @newExpiryDate=newExpiryDate from inserted
	--更新orders
	update orders
	set orders.checkOutTime = @newExpiryDate,totalMoney = totalMoney + @addMoney
	where orderNumber = @orderNumber
	--选出ID
	select @customerIDCard = customerIDCard
	from orders
	where orderNumber = @orderNumber
	--更新customers
	update customers
	set customers.totalAmount = customers.totalAmount+ @addMoney
	where customerIDCard = @customerIDCard
end

-- 创建收入视图
drop view incomeView
create view incomeView
as
-- 选择退房时间，总金额，订单数量
select checkOutTime, sum(totalMoney) totalIncome, count(*) num from orders 
group by checkOutTime
--测试收入视图
--select * from incomeView

--创建房间信息视图
create view roomInfoView
as
select top 100 percent room.*,rp.price
from room join roomTypeAndPrice as rp 
on room.roomType = rp.roomType
order by rp.price desc
--测试房间信息视图
--select * from roomInfoView

--创建续费订单视图
create 	view timeExtensionOrdersView
as 
select
	timeExtension.orderNumber,
	customers.customerName,
	customers.customerPhoneNumber,
	orders.roomNumber,
	orders.checkInTime,
	timeExtension.oldExpiryDate,
	timeExtension.newExpiryDate,
	timeExtension.addMoney
from timeExtension inner join orders
on timeExtension.orderNumber = orders.orderNumber inner join customers
on orders.customerIDCard = customers.customerIDCard
--测试续费订单视图
--select * from timeExtensionOrdersView

--创建订单视图
drop view orderview
create view orderview
as
select top 100 percent
	orders.orderNumber,
	orders.orderStatus,
	customers.customerName,
    room.roomNumber,
    room.roomType,
    orders.orderTime,
    orders.checkInTime,
    orders.checkOutTime,
    customers.customerPhoneNumber,
    orders.totalMoney,
    room.roomUrl
from orders inner join customers
on orders.customerIDCard = customers.customerIDCard
inner join room
on orders.roomNumber = room.roomNumber
inner join roomTypeAndPrice
on room.roomType = roomTypeAndPrice.roomType
order by orders.orderNumber desc
--测试订单视图
select * from orderview

--存储过程（解决续住问题）
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE getPrice(
	@roomNumber int,
	@addDay int,
	@addMoney int output,
	@orderNumber int output,
	@oldExpiryTime date output,
	@newExpiryTime date output
)
AS
BEGIN
	declare @price int
	--获取订单号
	select @orderNumber = orders.orderNumber 
	from orders 
	where roomNumber = @roomNumber and orderStatus != '已退房'
	--获取该类型房间的价格
	select @price = roomTypeAndPrice.price 
	from roomTypeAndPrice inner join room on roomTypeAndPrice.roomType = room.roomType
	where room.roomNumber = @roomNumber
	--算出需要加的钱
	set @addMoney = @price * @addDay
	--获取原到期时间
	select @oldExpiryTime = orders.checkOutTime from orders where orderNumber = @orderNumber
	--计算新到期时间
	set @newExpiryTime = DATEADD(DAY,@addDay,@oldExpiryTime)
END
GO
--存储过程（解决续住问题）
declare @addMoney int,@orderNumber int,@oldExpiryTime date,@newExpiryTime date
exec dbo.getPrice '1002',3,@addMoney output,@orderNumber output,@oldExpiryTime output,@newExpiryTime output
select @addMoney as addMoney,@orderNumber as orderNumber,@oldExpiryTime as oldExpiryTime,@newExpiryTime as newExpiryTime


存储过程（解决订单视图查询选择）
USE [hotel_db]
GO
/****** Object:  StoredProcedure [dbo].[showView]    Script Date: 12/06/2018 21:41:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[ChooseSearchInfo](
	@para varchar(25),
	@Type varchar(25)
)
AS
BEGIN
	if @Type = 'customerName'
		select * from orderView where customerName like '%'+@para+'%'
	else if @Type = 'roomNumber'
		select * from orderView where roomNumber like '%'+@para+'%'
	else if @Type = 'roomType'
		select * from orderview where roomType like '%'+@para+'%'
	else if @Type = 'orderTime'
		select * from orderview where orderTime like '%'+@para+'%'
	else if @Type = 'checkInTime'
		select * from orderview where checkInTime like '%'+@para+'%'
	else if @Type = 'checkOutTime'
		select * from orderview where checkOutTime like '%'+@para+'%'
	else if @Type = 'customerPhoneNumber'
		select * from orderview where customerPhoneNumber like '%'+@para+'%'
	else if @Type = 'totalMoney'
		select * from orderview where totalMoney like '%'+@para+'%'
	END
--测试存储过程（解决视图选择问题）
declare @Type varchar(25),@para varchar(25)
set @Type = ''
set @para = '肖'
exec ChooseSearchInfo @para,@Type

