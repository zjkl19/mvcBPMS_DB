-- declare @dbName varchar(20)
-- set @dbName='BPM'

create database BPMSx
on(
name=桥隧项目管理系统,
filename='D:\建科院移动办公\桥隧项目管理系统\BPMSx.mdf'
)
log on(
name=桥隧项目管理系统_log,
filename='D:\建科院移动办公\桥隧项目管理系统\BPMSx_log.mdf'
)

