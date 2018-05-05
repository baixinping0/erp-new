create database erp character set utf8;
use erp;
-- drop table tbl_emp;
-- 创建用户
create table tbl_emp (
	uuid bigint(20) primary key not  null  auto_increment,
	userName varchar(15),
	pwd varchar(32),
	name varchar(28),
	email varchar(255),
	tele varchar(30),
	address varchar(255),
	gender int(1),
	birthday bigint(20),
	depUuid bigint(20) not null,
	lastLoginTime bigint not null,
	lastLoginIp varchar(30) not null,
	loginTimes int not null
);

-- insert into tbl_emp(uuid, userName, pwd, name,gender, email,tele,address, depUuid) values(null, 'admin', '21232f297a57a5a743894a0e4a801fc3','白新平','1',  '1647469340@qq.com', '15809294537', '西安' , 1);

-- 创建部门
-- drop table tbl_dep;
create table tbl_dep (
	uuid bigint(20) primary key not  null  auto_increment,
	name varchar(28),
	tele varchar(30)
);

-- 创建角色
create table tbl_role(
	uuid bigint(20) primary key not null auto_increment,
	name varchar(30) not null,
	code varchar(30) not null
);


-- 创建资源

create table tbl_res(
	uuid bigint(20) primary key not null auto_increment,
	name varchar(30) not null,
	url varchar(255) not null
);

-- 创建员工到角色的多对多中间表
create table tbl_emp_role(
	uuid bigint(20) primary key not null auto_increment,
	empUuid bigint(20),
	roleUuid bigint(20)
);

-- 创建角色到资源的多对多中间表
create table tbl_role_res(
	uuid bigint(20) primary key not null auto_increment,
	roleUuid bigint(20),
	resUuid bigint(20)
);

-- 创建菜单数据库

create table tbl_menu(
	uuid bigint(20) primary key not null auto_increment,
	name varchar(20) not null,
	url varchar(255) not null,
	puuid bigint(20) not null
);
-- 创建角色对菜单的多对多中间表

create table tbl_role_menu(
	uuid bigint(20) primary key not null auto_increment,
	roleUuid bigint(20) not null,
	menuUuid bigint(20) not null
);

-- 创建供应商的表
create table tbl_supplier(
	uuid bigint(20) primary key not null auto_increment,
	name varchar(255) not null,
	address varchar(255) not null,
	contact varchar(30) not null,
	tele varchar(30) not null,
	needs int(1) not null
);

-- 创建商品类别表
-- drop table tbl_goodsType;
create table tbl_goodsType(
	uuid bigint(20) primary key not null auto_increment,
	name varchar(30) not null,
	supplierUuid bigint(20) not null
);

-- //创建商品表
-- drop table tbl_goods;
create table tbl_goods(
	uuid bigint(20) primary key not null auto_increment,
	name varchar(30) not null,
	origin varchar(30) not null,
	producer varchar(30) not null,
	unit varchar(30) not null,
	inPrice decimal(10) not null,
	outPrice decimal(10) not null,
	goodsTypeUuid bigint(20) not null
);

-- 创建订单表
-- drop table tbl_order;
create table tbl_order(
	uuid bigint(20) primary key not null auto_increment,
	orderNum varchar(30) not null,
	creater bigint(20) not null,
	createTime bigint(20) not null,
	checker bigint(20),
	checkTime bigint(20),
	completer bigint(20),
	endTime bigint(20),
	orderType int(1) not null,
	type int(3) not null,
	totalNum int(11) not null,
	totalPrice decimal(10) not null,
	supplierUuid bigint(20) not null
);
-- 创建订单明细表

create table tbl_orderDetail(
	uuid bigint(20) primary key not null auto_increment,
	goodsUuid bigint(20) not null,
	num int(11) not null,
	price decimal(10) not null,
	orderUuid bigint(20) not null
);
alter table tbl_orderDetail add surplus int(11);
-- //创建仓库表
create table tbl_store(
	uuid bigint(20) primary key not null auto_increment,
	name varchar(30) not null,
	address varchar(255) not null,
	empUuid bigint(20) not null
);

-- //创建仓库明细表
create table tbl_storeDetail(
	uuid bigint(20) primary key not null auto_increment,
	storeUuid bigint(20) not null,
	goodsUuid bigint(20) not null,
	num int(11) not null
);

-- //仓库操作明细表
create table tbl_storeOper(
	uuid bigint(20) primary key not null auto_increment,
	empUuid bigint(20) not null,
	operTime bigint(20) not null,
	type int(1) not null,
	goodsUuid bigint(20) not null,
	storeUuid bigint(20) not null,
	num int(11) not null
);


alter table tbl_goods add useNum int(11);
alter table tbl_goods add maxNum int(11) not null;
alter table tbl_goods add minNum int(11) not null;

insert into tbl_emp(uuid, userName, pwd, name,gender, email,tele,address, depUuid, lastLoginTime, lastLoginIp, loginTimes) values(null, 'admin', '21232f297a57a5a743894a0e4a801fc3','白新平','1', '1647469340@qq.com', '15809294537', '西安' ,1, '1525510766979', '127.0.0.1', '3');
insert into tbl_dep(name, tele) values('信息中心', '15809294537');
insert into tbl_role (name, code) values('系统管理员', 'admin');
insert into tbl_emp_role(empUuid, roleUuid)values('1', '1');
insert into tbl_menu(name, url, puuid) values('系统菜单', '-', '0');
insert into tbl_menu(name, url, puuid) values('基础维护', '-', '1');
insert into tbl_menu(name, url, puuid) values('员工维护', 'emp_list', '2');
insert into tbl_menu(name, url, puuid) values('部门维护', 'dep_list', '2');
insert into tbl_menu(name, url, puuid) values('角色维护', 'role_list', '2');
insert into tbl_menu(name, url, puuid) values('资源维护', 'res_list', '2');
insert into tbl_menu(name, url, puuid) values('菜单维护', 'menu_list', '2');
insert into tbl_role_menu(roleUuid, menuUuid)values('1', '1');
insert into tbl_role_menu(roleUuid, menuUuid)values('1', '2');
insert into tbl_role_menu(roleUuid, menuUuid)values('1', '3');
insert into tbl_role_menu(roleUuid, menuUuid)values('1', '4');
insert into tbl_role_menu(roleUuid, menuUuid)values('1', '5');
insert into tbl_role_menu(roleUuid, menuUuid)values('1', '6');
insert into tbl_role_menu(roleUuid, menuUuid)values('1', '7');