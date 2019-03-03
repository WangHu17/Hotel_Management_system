select * from room
select * from orders
select * from roomTypeAndPrice
insert into roomTypeAndPrice values('单人间',32);
insert into roomTypeAndPrice values('双人间',50);
insert into room values('101','单人间','五星级');
insert into room values('102','单人间','30平');
insert into room values('103','双人间','40平');

select * from customers
select * from usertab

insert into usertab values('肖誉杰','160510111');
insert into usertab values('李泽宇','160510114');
insert into usertab values('王虎','160510113');
delete from customers where customerName='王虎'
delete from orders where customerIDCard='510722199808186256'