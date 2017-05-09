-- declare @dbName varchar(20)
-- set @dbName='BPM'

create database BPMSx
on(
name=桥隧项目管理系统,
filename='e:\sqldb\BPMSx.mdf'
)
log on(
name=桥隧项目管理系统_log,
filename='e:\sqldb\BPMSx_log.mdf'
)

