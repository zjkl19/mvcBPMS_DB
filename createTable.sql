/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                    */
/* Created on:     2017/4/18 21:43:07                           */
/*==============================================================*/
use BPMSx

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('contact') and o.name = 'FK_CONTACT_ACCEPT_STAFF')
alter table contact
   drop constraint FK_CONTACT_ACCEPT_STAFF
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('project') and o.name = 'FK_PROJECT_CONTAIN_CONTACT')
alter table project
   drop constraint FK_PROJECT_CONTAIN_CONTACT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('project_money_flow') and o.name = 'FK_PROJECT__EXECUTE_STAFF')
alter table project_money_flow
   drop constraint FK_PROJECT__EXECUTE_STAFF
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('project_money_flow') and o.name = 'FK_PROJECT__POSSESS_PROJECT')
alter table project_money_flow
   drop constraint FK_PROJECT__POSSESS_PROJECT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('r_project_staff') and o.name = 'FK_R_PROJEC_R_PROJECT_PROJECT')
alter table r_project_staff
   drop constraint FK_R_PROJEC_R_PROJECT_PROJECT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('r_project_staff') and o.name = 'FK_R_PROJEC_R_PROJECT_STAFF')
alter table r_project_staff
   drop constraint FK_R_PROJEC_R_PROJECT_STAFF
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('contact')
            and   name  = 'accept_FK'
            and   indid > 0
            and   indid < 255)
   drop index contact.accept_FK
go

alter table contact
   drop constraint PK_CONTACT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('contact')
            and   type = 'U')
   drop table contact
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('project')
            and   name  = 'contain_FK'
            and   indid > 0
            and   indid < 255)
   drop index project.contain_FK
go

alter table project
   drop constraint PK_PROJECT
go

if exists (select 1
            from  sysobjects
           where  id = object_id('project')
            and   type = 'U')
   drop table project
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('project_money_flow')
            and   name  = 'possess_FK'
            and   indid > 0
            and   indid < 255)
   drop index project_money_flow.possess_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('project_money_flow')
            and   name  = 'execute_FK'
            and   indid > 0
            and   indid < 255)
   drop index project_money_flow.execute_FK
go

alter table project_money_flow
   drop constraint PK_PROJECT_MONEY_FLOW
go

if exists (select 1
            from  sysobjects
           where  id = object_id('project_money_flow')
            and   type = 'U')
   drop table project_money_flow
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('r_project_staff')
            and   name  = 'r_project_staff2_FK'
            and   indid > 0
            and   indid < 255)
   drop index r_project_staff.r_project_staff2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('r_project_staff')
            and   name  = 'r_project_staff_FK'
            and   indid > 0
            and   indid < 255)
   drop index r_project_staff.r_project_staff_FK
go

alter table r_project_staff
   drop constraint AK_UNIQUE_KEY1_R_PROJEC
go

alter table r_project_staff
   drop constraint PK_R_PROJECT_STAFF
go

if exists (select 1
            from  sysobjects
           where  id = object_id('r_project_staff')
            and   type = 'U')
   drop table r_project_staff
go

alter table staff
   drop constraint PK_STAFF
go

if exists (select 1
            from  sysobjects
           where  id = object_id('staff')
            and   type = 'U')
   drop table staff
go

/*==============================================================*/
/* Table: contact                                               */
/*==============================================================*/
create table contact (
   id                   char(32)             not null,
   staff_id             char(32)             not null,
   contact_id           char(13)             not null,
   contact_name         varchar(100)         not null,
   contact_amount       money                not null,
   delegation_client    varchar(50)          null,
   accept_way           varchar(10)          null,
   is_corporation_signed bit                  not null default 0,
   is_client_signed     bit                  not null default 0
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('contact') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'contact' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '创建者：林迪南
   说明：合同。用于记录合同信息', 
   'user', @CurrentUser, 'table', 'contact'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('contact')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'contact', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键',
   'user', @CurrentUser, 'table', 'contact', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('contact')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'staff_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'contact', 'column', 'staff_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键。',
   'user', @CurrentUser, 'table', 'contact', 'column', 'staff_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('contact')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'contact_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'contact', 'column', 'contact_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同编号。建科院合同编号，如HT02CB1600297',
   'user', @CurrentUser, 'table', 'contact', 'column', 'contact_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('contact')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'contact_name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'contact', 'column', 'contact_name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同名称',
   'user', @CurrentUser, 'table', 'contact', 'column', 'contact_name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('contact')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'contact_amount')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'contact', 'column', 'contact_amount'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同金额',
   'user', @CurrentUser, 'table', 'contact', 'column', 'contact_amount'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('contact')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delegation_client')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'contact', 'column', 'delegation_client'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '委托单位',
   'user', @CurrentUser, 'table', 'contact', 'column', 'delegation_client'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('contact')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'accept_way')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'contact', 'column', 'accept_way'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '承接方式',
   'user', @CurrentUser, 'table', 'contact', 'column', 'accept_way'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('contact')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_corporation_signed')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'contact', 'column', 'is_corporation_signed'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '单位是否签订',
   'user', @CurrentUser, 'table', 'contact', 'column', 'is_corporation_signed'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('contact')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_client_signed')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'contact', 'column', 'is_client_signed'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '业主是否签订',
   'user', @CurrentUser, 'table', 'contact', 'column', 'is_client_signed'
go

alter table contact
   add constraint PK_CONTACT primary key nonclustered (id)
go

/*==============================================================*/
/* Index: accept_FK                                             */
/*==============================================================*/
create index accept_FK on contact (
staff_id ASC
)
go

/*==============================================================*/
/* Table: project                                               */
/*==============================================================*/
create table project (
   id                   char(32)             not null,
   contact_id           char(32)             null,
   project_name         varchar(100)         not null,
   standard_product_value money                null,
   enter_date           datetime             null,
   exit_date            datetime             null,
   is_approved          bit                  not null default 0,
   approved_datatime    bit                  not null default 0
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('project') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'project' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '创建者：林迪南
   说明：工程项目。用于录入工程项目', 
   'user', @CurrentUser, 'table', 'project'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('project')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'project', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'id',
   'user', @CurrentUser, 'table', 'project', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('project')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'contact_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'project', 'column', 'contact_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键',
   'user', @CurrentUser, 'table', 'project', 'column', 'contact_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('project')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'project_name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'project', 'column', 'project_name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '项目名称',
   'user', @CurrentUser, 'table', 'project', 'column', 'project_name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('project')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'standard_product_value')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'project', 'column', 'standard_product_value'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '标准产值',
   'user', @CurrentUser, 'table', 'project', 'column', 'standard_product_value'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('project')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'enter_date')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'project', 'column', 'enter_date'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '进场日期',
   'user', @CurrentUser, 'table', 'project', 'column', 'enter_date'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('project')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'exit_date')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'project', 'column', 'exit_date'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '退场日期',
   'user', @CurrentUser, 'table', 'project', 'column', 'exit_date'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('project')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_approved')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'project', 'column', 'is_approved'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '报告是否批准',
   'user', @CurrentUser, 'table', 'project', 'column', 'is_approved'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('project')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'approved_datatime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'project', 'column', 'approved_datatime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '报告批准日期',
   'user', @CurrentUser, 'table', 'project', 'column', 'approved_datatime'
go

alter table project
   add constraint PK_PROJECT primary key nonclustered (id)
go

/*==============================================================*/
/* Index: contain_FK                                            */
/*==============================================================*/
create index contain_FK on project (
contact_id ASC
)
go

/*==============================================================*/
/* Table: project_money_flow                                    */
/*==============================================================*/
create table project_money_flow (
   id                   char(32)             not null,
   staff_id             char(32)             not null,
   project_id           char(32)             not null,
   fund_flow_datetime   datetime             not null,
   expense              money                not null,
   invoice_amount       money                not null,
   income_amout         money                null
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('project_money_flow') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'project_money_flow' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '创建者：林迪南
   说明：项目资金流动。用于记录各个项目进行过程中现场开支及发票管理情况。', 
   'user', @CurrentUser, 'table', 'project_money_flow'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('project_money_flow')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'project_money_flow', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'id',
   'user', @CurrentUser, 'table', 'project_money_flow', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('project_money_flow')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'staff_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'project_money_flow', 'column', 'staff_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键。',
   'user', @CurrentUser, 'table', 'project_money_flow', 'column', 'staff_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('project_money_flow')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'project_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'project_money_flow', 'column', 'project_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '工程项目_id',
   'user', @CurrentUser, 'table', 'project_money_flow', 'column', 'project_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('project_money_flow')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'fund_flow_datetime')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'project_money_flow', 'column', 'fund_flow_datetime'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '资金流动日期',
   'user', @CurrentUser, 'table', 'project_money_flow', 'column', 'fund_flow_datetime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('project_money_flow')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'expense')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'project_money_flow', 'column', 'expense'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '现场开支',
   'user', @CurrentUser, 'table', 'project_money_flow', 'column', 'expense'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('project_money_flow')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'invoice_amount')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'project_money_flow', 'column', 'invoice_amount'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '开出发票金额',
   'user', @CurrentUser, 'table', 'project_money_flow', 'column', 'invoice_amount'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('project_money_flow')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'income_amout')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'project_money_flow', 'column', 'income_amout'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '进账金额',
   'user', @CurrentUser, 'table', 'project_money_flow', 'column', 'income_amout'
go

alter table project_money_flow
   add constraint PK_PROJECT_MONEY_FLOW primary key nonclustered (id)
go

/*==============================================================*/
/* Index: execute_FK                                            */
/*==============================================================*/
create index execute_FK on project_money_flow (
staff_id ASC
)
go

/*==============================================================*/
/* Index: possess_FK                                            */
/*==============================================================*/
create index possess_FK on project_money_flow (
project_id ASC
)
go

/*==============================================================*/
/* Table: r_project_staff                                       */
/*==============================================================*/
create table r_project_staff (
   id                   char(32)             not null,
   project_id           char(32)             not null,
   staff_id             char(32)             not null,
   is_scene             bit                  not null default 0,
   is_scheme            bit                  not null,
   is_report            bit                  not null default 0
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('r_project_staff') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'r_project_staff' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '参与项目', 
   'user', @CurrentUser, 'table', 'r_project_staff'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('r_project_staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'r_project_staff', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'id',
   'user', @CurrentUser, 'table', 'r_project_staff', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('r_project_staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'project_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'r_project_staff', 'column', 'project_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '工程项目_id',
   'user', @CurrentUser, 'table', 'r_project_staff', 'column', 'project_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('r_project_staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'staff_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'r_project_staff', 'column', 'staff_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键。',
   'user', @CurrentUser, 'table', 'r_project_staff', 'column', 'staff_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('r_project_staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_scene')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'r_project_staff', 'column', 'is_scene'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参与现场',
   'user', @CurrentUser, 'table', 'r_project_staff', 'column', 'is_scene'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('r_project_staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_scheme')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'r_project_staff', 'column', 'is_scheme'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参与方案制订',
   'user', @CurrentUser, 'table', 'r_project_staff', 'column', 'is_scheme'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('r_project_staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_report')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'r_project_staff', 'column', 'is_report'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '参与报告',
   'user', @CurrentUser, 'table', 'r_project_staff', 'column', 'is_report'
go

alter table r_project_staff
   add constraint PK_R_PROJECT_STAFF primary key (id)
go

alter table r_project_staff
   add constraint AK_UNIQUE_KEY1_R_PROJEC unique (project_id, staff_id)
go

/*==============================================================*/
/* Index: r_project_staff_FK                                    */
/*==============================================================*/
create index r_project_staff_FK on r_project_staff (
project_id ASC
)
go

/*==============================================================*/
/* Index: r_project_staff2_FK                                   */
/*==============================================================*/
create index r_project_staff2_FK on r_project_staff (
staff_id ASC
)
go

/*==============================================================*/
/* Table: staff                                                 */
/*==============================================================*/
create table staff (
   id                   char(32)             not null,
   staff_no             numeric              not null,
   staff_name           varchar(50)          not null,
   gender               bit                  not null,
   phone_number         varchar(15)          not null,
   position             varchar(10)          null
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('staff') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'staff' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '创建者：林迪南
   说明：职工。用于录入职工信息', 
   'user', @CurrentUser, 'table', 'staff'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'staff', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键。',
   'user', @CurrentUser, 'table', 'staff', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'staff_no')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'staff', 'column', 'staff_no'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '建科院工号。举例：1743 （林迪南）',
   'user', @CurrentUser, 'table', 'staff', 'column', 'staff_no'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'staff_name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'staff', 'column', 'staff_name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '姓名',
   'user', @CurrentUser, 'table', 'staff', 'column', 'staff_name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'gender')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'staff', 'column', 'gender'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '性别',
   'user', @CurrentUser, 'table', 'staff', 'column', 'gender'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'phone_number')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'staff', 'column', 'phone_number'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '联系电话',
   'user', @CurrentUser, 'table', 'staff', 'column', 'phone_number'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'position')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'staff', 'column', 'position'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '职位',
   'user', @CurrentUser, 'table', 'staff', 'column', 'position'
go

alter table staff
   add constraint PK_STAFF primary key nonclustered (id)
go

alter table contact
   add constraint FK_CONTACT_ACCEPT_STAFF foreign key (staff_id)
      references staff (id)
go

alter table project
   add constraint FK_PROJECT_CONTAIN_CONTACT foreign key (contact_id)
      references contact (id)
go

alter table project_money_flow
   add constraint FK_PROJECT__EXECUTE_STAFF foreign key (staff_id)
      references staff (id)
go

alter table project_money_flow
   add constraint FK_PROJECT__POSSESS_PROJECT foreign key (project_id)
      references project (id)
go

alter table r_project_staff
   add constraint FK_R_PROJEC_R_PROJECT_PROJECT foreign key (project_id)
      references project (id)
go

alter table r_project_staff
   add constraint FK_R_PROJEC_R_PROJECT_STAFF foreign key (staff_id)
      references staff (id)
go

