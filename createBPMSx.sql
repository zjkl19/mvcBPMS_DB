/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                    */
/* Created on:     2017/5/16 15:23:19                           */
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
   where r.fkeyid = object_id('project_system') and o.name = 'FK_PROJECT__HAVE_PROJECT')
alter table project_system
   drop constraint FK_PROJECT__HAVE_PROJECT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('project_system') and o.name = 'FK_PROJECT__HAVE1_PROJECT_')
alter table project_system
   drop constraint FK_PROJECT__HAVE1_PROJECT_
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('project_system') and o.name = 'FK_PROJECT__HAVE2_PRJ_COMP')
alter table project_system
   drop constraint FK_PROJECT__HAVE2_PRJ_COMP
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('project_system') and o.name = 'FK_PROJECT__HAVE3_PROJECT_')
alter table project_system
   drop constraint FK_PROJECT__HAVE3_PROJECT_
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

if exists (select 1
            from  sysobjects
           where  id = object_id('contact')
            and   type = 'U')
   drop table contact
go

if exists (select 1
            from  sysobjects
           where  id = object_id('prj_complex_coff')
            and   type = 'U')
   drop table prj_complex_coff
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('project')
            and   name  = 'contain_FK'
            and   indid > 0
            and   indid < 255)
   drop index project.contain_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('project')
            and   type = 'U')
   drop table project
go

if exists (select 1
            from  sysobjects
           where  id = object_id('project_diffcult_coff')
            and   type = 'U')
   drop table project_diffcult_coff
go

if exists (select 1
            from  sysobjects
           where  id = object_id('"project_fund_ allocation"')
            and   type = 'U')
   drop table "project_fund_ allocation"
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

if exists (select 1
            from  sysobjects
           where  id = object_id('project_money_flow')
            and   type = 'U')
   drop table project_money_flow
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('project_system')
            and   name  = 'have2_FK'
            and   indid > 0
            and   indid < 255)
   drop index project_system.have2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('project_system')
            and   name  = 'have_FK'
            and   indid > 0
            and   indid < 255)
   drop index project_system.have_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('project_system')
            and   name  = 'have3_FK'
            and   indid > 0
            and   indid < 255)
   drop index project_system.have3_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('project_system')
            and   name  = 'have1_FK'
            and   indid > 0
            and   indid < 255)
   drop index project_system.have1_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('project_system')
            and   type = 'U')
   drop table project_system
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

if exists (select 1
            from  sysobjects
           where  id = object_id('r_project_staff')
            and   type = 'U')
   drop table r_project_staff
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
   contact_no           char(13)             not null,
   contact_name         varchar(100)         not null,
   contact_amount       money                not null default 0,
   contact_signing_data datetime             not null default '1900-00-00 00:00:00.000',
   contact_deadline     bigint               not null default 0,
   delegation_client    varchar(50)          null,
   dlg_contactperson    varchar(50)          null,
   dlg_contactperson_phone varchar(13)          null,
   accept_way           varchar(10)          null,
   is_corporation_signed bit                  not null default 0,
   is_client_signed     bit                  not null default 0,
   constraint PK_CONTACT primary key nonclustered (id),
   constraint AK_CONTACT_NO_UK_CONTACT unique (contact_no)
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
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'contact_no')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'contact', 'column', 'contact_no'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同编号。建科院合同编号，如HT02CB1600297',
   'user', @CurrentUser, 'table', 'contact', 'column', 'contact_no'
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
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'contact_signing_data')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'contact', 'column', 'contact_signing_data'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同签订日期',
   'user', @CurrentUser, 'table', 'contact', 'column', 'contact_signing_data'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('contact')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'contact_deadline')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'contact', 'column', 'contact_deadline'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同期限',
   'user', @CurrentUser, 'table', 'contact', 'column', 'contact_deadline'
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
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'dlg_contactperson')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'contact', 'column', 'dlg_contactperson'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '委托单位联系人',
   'user', @CurrentUser, 'table', 'contact', 'column', 'dlg_contactperson'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('contact')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'dlg_contactperson_phone')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'contact', 'column', 'dlg_contactperson_phone'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '委托单位联系人电话',
   'user', @CurrentUser, 'table', 'contact', 'column', 'dlg_contactperson_phone'
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

/*==============================================================*/
/* Index: accept_FK                                             */
/*==============================================================*/
create index accept_FK on contact (
staff_id ASC
)
go

/*==============================================================*/
/* Table: prj_complex_coff                                      */
/*==============================================================*/
create table prj_complex_coff (
   id                   char(32)             not null,
   prj_type             varchar(50)          not null,
   complex_coff         float                not null default 0,
   constraint PK_PRJ_COMPLEX_COFF primary key nonclustered (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('prj_complex_coff') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'prj_complex_coff' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '创建者：林迪南
   说明：项目复杂系数。用于录入工程项目的复杂系数', 
   'user', @CurrentUser, 'table', 'prj_complex_coff'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('prj_complex_coff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'prj_complex_coff', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'id',
   'user', @CurrentUser, 'table', 'prj_complex_coff', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('prj_complex_coff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'prj_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'prj_complex_coff', 'column', 'prj_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '项目类型',
   'user', @CurrentUser, 'table', 'prj_complex_coff', 'column', 'prj_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('prj_complex_coff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'complex_coff')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'prj_complex_coff', 'column', 'complex_coff'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '复杂系数',
   'user', @CurrentUser, 'table', 'prj_complex_coff', 'column', 'complex_coff'
go

/*==============================================================*/
/* Table: project                                               */
/*==============================================================*/
create table project (
   id                   char(32)             not null,
   contact_id           char(32)             null,
   project_name         varchar(100)         not null,
   standard_product_value money                not null default 0,
   enter_date           datetime             null default '1900-00-00 00:00:00.000',
   exit_date            datetime             null default '1900-00-00 00:00:00.000',
   approved_datatime    datetime             null default '1900-00-00 00:00:00.000',
   constraint PK_PROJECT primary key nonclustered (id)
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

/*==============================================================*/
/* Index: contain_FK                                            */
/*==============================================================*/
create index contain_FK on project (
contact_id ASC
)
go

/*==============================================================*/
/* Table: project_diffcult_coff                                 */
/*==============================================================*/
create table project_diffcult_coff (
   id                   char(32)             not null,
   prj_diffculty_type   varchar(15)          not null,
   diffcult_coff        float                not null default 0,
   constraint PK_PROJECT_DIFFCULT_COFF primary key nonclustered (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('project_diffcult_coff') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'project_diffcult_coff' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '创建者：林迪南
   说明：项目难度系数。用于录入工程项目的难度系数', 
   'user', @CurrentUser, 'table', 'project_diffcult_coff'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('project_diffcult_coff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'project_diffcult_coff', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'id',
   'user', @CurrentUser, 'table', 'project_diffcult_coff', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('project_diffcult_coff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'prj_diffculty_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'project_diffcult_coff', 'column', 'prj_diffculty_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '项目难度类型',
   'user', @CurrentUser, 'table', 'project_diffcult_coff', 'column', 'prj_diffculty_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('project_diffcult_coff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'diffcult_coff')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'project_diffcult_coff', 'column', 'diffcult_coff'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '难度系数',
   'user', @CurrentUser, 'table', 'project_diffcult_coff', 'column', 'diffcult_coff'
go

/*==============================================================*/
/* Table: "project_fund_ allocation"                            */
/*==============================================================*/
create table "project_fund_ allocation" (
   id                   char(32)             not null,
   prj_allocation_type  varchar(50)          not null,
   scene                float                null default 0,
   "plan"               float                null default 0,
   report               float                null default 0,
   "check"              float                null default 0,
   others               float                null default 0,
   constraint "PK_PROJECT_FUND_ ALLOCATION" primary key nonclustered (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('"project_fund_ allocation"') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'project_fund_ allocation' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '创建者：林迪南
   说明：项目资金分配。用于定义项目完成分配比例', 
   'user', @CurrentUser, 'table', 'project_fund_ allocation'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('"project_fund_ allocation"')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'project_fund_ allocation', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'id',
   'user', @CurrentUser, 'table', 'project_fund_ allocation', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('"project_fund_ allocation"')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'prj_allocation_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'project_fund_ allocation', 'column', 'prj_allocation_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '项目分配类型',
   'user', @CurrentUser, 'table', 'project_fund_ allocation', 'column', 'prj_allocation_type'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('"project_fund_ allocation"')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'scene')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'project_fund_ allocation', 'column', 'scene'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '现场工作',
   'user', @CurrentUser, 'table', 'project_fund_ allocation', 'column', 'scene'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('"project_fund_ allocation"')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'plan')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'project_fund_ allocation', 'column', 'plan'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '方案制定',
   'user', @CurrentUser, 'table', 'project_fund_ allocation', 'column', 'plan'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('"project_fund_ allocation"')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'report')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'project_fund_ allocation', 'column', 'report'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '报告编写',
   'user', @CurrentUser, 'table', 'project_fund_ allocation', 'column', 'report'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('"project_fund_ allocation"')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'check')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'project_fund_ allocation', 'column', 'check'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '报告校核',
   'user', @CurrentUser, 'table', 'project_fund_ allocation', 'column', 'check'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('"project_fund_ allocation"')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'others')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'project_fund_ allocation', 'column', 'others'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '其它工作',
   'user', @CurrentUser, 'table', 'project_fund_ allocation', 'column', 'others'
go

/*==============================================================*/
/* Table: project_money_flow                                    */
/*==============================================================*/
create table project_money_flow (
   id                   char(32)             not null,
   staff_id             char(32)             not null,
   project_id           char(32)             not null,
   fund_flow_datetime   datetime             not null default '1900-00-00 00:00:00.000',
   expense              money                not null default 0,
   invoice_amount       money                not null default 0,
   income_amout         money                not null default 0,
   constraint PK_PROJECT_MONEY_FLOW primary key nonclustered (id)
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
/* Table: project_system                                        */
/*==============================================================*/
create table project_system (
   id                   char(32)             not null,
   "project_fund_ allocation_id" char(32)             not null,
   prj_complex_coff_id  char(32)             not null,
   project_id           char(32)             not null,
   project_diffcult_coff_id char(32)             not null,
   constraint PK_PROJECT_SYSTEM primary key nonclustered (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('project_system') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'project_system' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '创建者：林迪南
   说明：项目体系。用于录入工程项目的难度系数、复杂度系数、成员分配比例', 
   'user', @CurrentUser, 'table', 'project_system'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('project_system')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'project_system', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'id',
   'user', @CurrentUser, 'table', 'project_system', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('project_system')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'project_fund_ allocation_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'project_system', 'column', 'project_fund_ allocation_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '项目完成比例分配_id',
   'user', @CurrentUser, 'table', 'project_system', 'column', 'project_fund_ allocation_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('project_system')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'prj_complex_coff_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'project_system', 'column', 'prj_complex_coff_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '项目复杂系数_id',
   'user', @CurrentUser, 'table', 'project_system', 'column', 'prj_complex_coff_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('project_system')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'project_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'project_system', 'column', 'project_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '工程项目_id',
   'user', @CurrentUser, 'table', 'project_system', 'column', 'project_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('project_system')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'project_diffcult_coff_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'project_system', 'column', 'project_diffcult_coff_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '项目难度系数_id',
   'user', @CurrentUser, 'table', 'project_system', 'column', 'project_diffcult_coff_id'
go

/*==============================================================*/
/* Index: have1_FK                                              */
/*==============================================================*/
create index have1_FK on project_system (
project_diffcult_coff_id ASC
)
go

/*==============================================================*/
/* Index: have3_FK                                              */
/*==============================================================*/
create index have3_FK on project_system (
"project_fund_ allocation_id" ASC
)
go

/*==============================================================*/
/* Index: have_FK                                               */
/*==============================================================*/
create index have_FK on project_system (
project_id ASC
)
go

/*==============================================================*/
/* Index: have2_FK                                              */
/*==============================================================*/
create index have2_FK on project_system (
prj_complex_coff_id ASC
)
go

/*==============================================================*/
/* Table: r_project_staff                                       */
/*==============================================================*/
create table r_project_staff (
   id                   char(32)             not null,
   project_id           char(32)             not null,
   staff_id             char(32)             not null,
   is_response          bit                  not null default 0,
   scene_coff           float                not null default 0
      constraint CKC_SCENE_COFF_R_PROJEC check (scene_coff >= 0),
   plan_coff            float                not null default 0
      constraint CKC_PLAN_COFF_R_PROJEC check (plan_coff >= 0),
   report_coff          float                not null default 0
      constraint CKC_REPORT_COFF_R_PROJEC check (report_coff >= 0),
   report_check_coff    float                not null default 0
      constraint CKC_REPORT_CHECK_COFF_R_PROJEC check (report_check_coff >= 0),
   others_coff          float                not null default 0
      constraint CKC_OTHERS_COFF_R_PROJEC check (others_coff >= 0),
   constraint PK_R_PROJECT_STAFF primary key (id),
   constraint AK_COMBINE_UK_01_R_PROJEC unique (project_id, staff_id)
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
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_response')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'r_project_staff', 'column', 'is_response'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否负责',
   'user', @CurrentUser, 'table', 'r_project_staff', 'column', 'is_response'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('r_project_staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'scene_coff')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'r_project_staff', 'column', 'scene_coff'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '现场工作',
   'user', @CurrentUser, 'table', 'r_project_staff', 'column', 'scene_coff'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('r_project_staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'plan_coff')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'r_project_staff', 'column', 'plan_coff'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '方案制定',
   'user', @CurrentUser, 'table', 'r_project_staff', 'column', 'plan_coff'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('r_project_staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'report_coff')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'r_project_staff', 'column', 'report_coff'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '报告撰写',
   'user', @CurrentUser, 'table', 'r_project_staff', 'column', 'report_coff'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('r_project_staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'report_check_coff')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'r_project_staff', 'column', 'report_check_coff'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '报告校核',
   'user', @CurrentUser, 'table', 'r_project_staff', 'column', 'report_check_coff'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('r_project_staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'others_coff')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'r_project_staff', 'column', 'others_coff'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '其它工作',
   'user', @CurrentUser, 'table', 'r_project_staff', 'column', 'others_coff'
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
   staff_password       char(32)             not null default '123456',
   staff_name           varchar(50)          not null,
   gender               bit                  not null default 0,
   office_phone         varchar(15)          null,
   mobile_phone         varchar(15)          not null,
   position             varchar(10)          null,
   constraint PK_STAFF primary key nonclustered (id),
   constraint AK_STAFF_NO_STAFF unique (staff_no)
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
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'staff_password')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'staff', 'column', 'staff_password'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '密码',
   'user', @CurrentUser, 'table', 'staff', 'column', 'staff_password'
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
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'office_phone')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'staff', 'column', 'office_phone'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '办公电话',
   'user', @CurrentUser, 'table', 'staff', 'column', 'office_phone'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'mobile_phone')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'staff', 'column', 'mobile_phone'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '移动电话',
   'user', @CurrentUser, 'table', 'staff', 'column', 'mobile_phone'
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

alter table project_system
   add constraint FK_PROJECT__HAVE_PROJECT foreign key (project_id)
      references project (id)
go

alter table project_system
   add constraint FK_PROJECT__HAVE1_PROJECT_ foreign key (project_diffcult_coff_id)
      references project_diffcult_coff (id)
go

alter table project_system
   add constraint FK_PROJECT__HAVE2_PRJ_COMP foreign key (prj_complex_coff_id)
      references prj_complex_coff (id)
go

alter table project_system
   add constraint FK_PROJECT__HAVE3_PROJECT_ foreign key ("project_fund_ allocation_id")
      references "project_fund_ allocation" (id)
go

alter table r_project_staff
   add constraint FK_R_PROJEC_R_PROJECT_PROJECT foreign key (project_id)
      references project (id)
go

alter table r_project_staff
   add constraint FK_R_PROJEC_R_PROJECT_STAFF foreign key (staff_id)
      references staff (id)
go

