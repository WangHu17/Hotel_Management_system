--修改表
--向room房间里面添加url
alter table room 
add roomUrl varchar(50)
select * from room
update room set roomUrl = 'img/single1' where roomNumber = '1001'
update room set roomUrl = 'img/single2' where roomNumber = '1002'
update room set roomUrl = 'img/double1' where roomNumber = '1003'
update room set roomUrl = 'img/double2' where roomNumber = '1002'
--预订
--根据入住和退房时间查询空房间
select room.roomType,roomTypeAndPrice.price,room.roomNumber,roomUrl
	from room inner join roomTypeAndPrice
	on room.roomType = roomTypeAndPrice.roomType
	where roomNumber not in
	--在子查询中修改
	(select orders.roomNumber from orders where((orders.checkInTime  between '2018-12-1' and '2018-12-2')) or ((orders.checkOutTime between '2018-12-1' and '2018-12-2')))
--根据输入用户信息插入他们的信息
insert customers values('1','男','小明','123456789',100,'晚点到')
insert orders values('预订中','1                 ','1002','2018-12-1','2018-12-3',100,'2018-12-2')
delete from orders
delete from customers
delete from timeExtension
select * from customers
select * from orders
select * from timeExtension
--入住
update orders
	set orderStatus = '已入住'
	--需要ID，
	where orders.customerIDCard = '11111             '
	
--退房
update orders
	set orderStatus = '已退房'
	where orders.customerIDCard = '11111             '
select * from orders where customerIDCard = '511023199810101871'
--续费
declare @addMoney int,@orderNumber int,@oldExpiryTime date,@newExpiryTime date
exec dbo.getPrice '1002',3,@addMoney output,@orderNumber output,@oldExpiryTime output,@newExpiryTime output
select @addMoney as addMoney,@orderNumber as orderNumber,@oldExpiryTime as oldExpiryTime,@newExpiryTime as newExpiryTime
--insert timeExtension values(12,'2018-12-03','2018-12-04',100)





