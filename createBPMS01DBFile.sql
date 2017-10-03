-- declare @dbName varchar(20)
-- set @dbName='BPM'

create database BPMS01
on(
name=桥隧项目管理系统01,
filename='D:\建科院移动办公\桥隧项目管理系统\BPMS01.mdf'
)
log on(
name=桥隧项目管理系统01_log,
filename='D:\建科院移动办公\桥隧项目管理系统\BPMS01_log.mdf'
)

