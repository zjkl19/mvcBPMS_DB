/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                    */
/* Created on:     2017/9/28 21:53:50                           */
/*==============================================================*/
use BPMS01

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('contract') and o.name = 'FK_CONTRACT_ACCEPT_STAFF')
alter table contract
   drop constraint FK_CONTRACT_ACCEPT_STAFF
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('inspection_project') and o.name = 'FK_INSPECTI_HAVE_BRIDGE')
alter table inspection_project
   drop constraint FK_INSPECTI_HAVE_BRIDGE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('inspection_project') and o.name = 'FK_INSPECTI_HAVE4_CONTRACT')
alter table inspection_project
   drop constraint FK_INSPECTI_HAVE4_CONTRACT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('r_bridge_inspection_staff') and o.name = 'FK_R_BRIDGE_R_BRIDGE__INSPECTI')
alter table r_bridge_inspection_staff
   drop constraint FK_R_BRIDGE_R_BRIDGE__INSPECTI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('r_bridge_inspection_staff') and o.name = 'FK_R_BRIDGE_R_BRIDGE__STAFF')
alter table r_bridge_inspection_staff
   drop constraint FK_R_BRIDGE_R_BRIDGE__STAFF
go

if exists (select 1
            from  sysobjects
           where  id = object_id('bridge')
            and   type = 'U')
   drop table bridge
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('contract')
            and   name  = 'accept_FK'
            and   indid > 0
            and   indid < 255)
   drop index contract.accept_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('contract')
            and   type = 'U')
   drop table contract
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('inspection_project')
            and   name  = 'have4_FK'
            and   indid > 0
            and   indid < 255)
   drop index inspection_project.have4_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('inspection_project')
            and   name  = 'have_FK'
            and   indid > 0
            and   indid < 255)
   drop index inspection_project.have_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('inspection_project')
            and   type = 'U')
   drop table inspection_project
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('r_bridge_inspection_staff')
            and   name  = 'r_bridge_inspection_staff2_FK'
            and   indid > 0
            and   indid < 255)
   drop index r_bridge_inspection_staff.r_bridge_inspection_staff2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('r_bridge_inspection_staff')
            and   name  = 'r_bridge_inspection_staff_FK'
            and   indid > 0
            and   indid < 255)
   drop index r_bridge_inspection_staff.r_bridge_inspection_staff_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('r_bridge_inspection_staff')
            and   type = 'U')
   drop table r_bridge_inspection_staff
go

if exists (select 1
            from  sysobjects
           where  id = object_id('staff')
            and   type = 'U')
   drop table staff
go

/*==============================================================*/
/* Table: bridge                                                */
/*==============================================================*/
create table bridge (
   id                   char(32)             not null,
   name                 varchar(100)         not null,
   length               float                not null,
   width                float                not null,
   structure_type       numeric              not null,
   constraint PK_BRIDGE primary key nonclustered (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('bridge') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'bridge' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '创建者：林迪南
   说明：桥梁。用于录入桥梁各个技术指标', 
   'user', @CurrentUser, 'table', 'bridge'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('bridge')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'bridge', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'id',
   'user', @CurrentUser, 'table', 'bridge', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('bridge')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'bridge', 'column', 'name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '桥梁名称',
   'user', @CurrentUser, 'table', 'bridge', 'column', 'name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('bridge')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'length')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'bridge', 'column', 'length'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '桥梁全长',
   'user', @CurrentUser, 'table', 'bridge', 'column', 'length'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('bridge')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'width')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'bridge', 'column', 'width'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '桥梁宽度',
   'user', @CurrentUser, 'table', 'bridge', 'column', 'width'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('bridge')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'structure_type')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'bridge', 'column', 'structure_type'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '结构形式',
   'user', @CurrentUser, 'table', 'bridge', 'column', 'structure_type'
go

/*==============================================================*/
/* Table: contract                                              */
/*==============================================================*/
create table contract (
   id                   char(32)             not null,
   staff_id             char(32)             not null,
   conrtact_no          char(13)             not null,
   contract_name        varchar(100)         not null,
   contract_amount      money                not null default 0,
   contract_signed_data datetime             not null default '1900-00-00 00:00:00.000',
   contract_deadline    bigint               not null default 0,
   contract_agmt_wk_cnt varchar(500)         null,
   project_location     varchar(20)          null,
   delegation_client    varchar(50)          null,
   dlg_contactperson    varchar(50)          null,
   dlg_contactperson_phone varchar(13)          null,
   accept_way           varchar(10)          null,
   is_corporation_signed bit                  not null default 0,
   is_client_signed     bit                  not null default 0,
   constraint PK_CONTRACT primary key nonclustered (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('contract') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'contract' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '创建者：林迪南
   说明：合同。用于记录合同信息', 
   'user', @CurrentUser, 'table', 'contract'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('contract')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'contract', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键',
   'user', @CurrentUser, 'table', 'contract', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('contract')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'staff_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'contract', 'column', 'staff_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键。',
   'user', @CurrentUser, 'table', 'contract', 'column', 'staff_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('contract')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'conrtact_no')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'contract', 'column', 'conrtact_no'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同编号。建科院合同编号，如HT02CB1600297',
   'user', @CurrentUser, 'table', 'contract', 'column', 'conrtact_no'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('contract')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'contract_name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'contract', 'column', 'contract_name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同名称',
   'user', @CurrentUser, 'table', 'contract', 'column', 'contract_name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('contract')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'contract_amount')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'contract', 'column', 'contract_amount'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同金额',
   'user', @CurrentUser, 'table', 'contract', 'column', 'contract_amount'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('contract')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'contract_signed_data')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'contract', 'column', 'contract_signed_data'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同签订日期',
   'user', @CurrentUser, 'table', 'contract', 'column', 'contract_signed_data'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('contract')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'contract_deadline')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'contract', 'column', 'contract_deadline'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同期限',
   'user', @CurrentUser, 'table', 'contract', 'column', 'contract_deadline'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('contract')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'contract_agmt_wk_cnt')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'contract', 'column', 'contract_agmt_wk_cnt'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '合同约定工作内容',
   'user', @CurrentUser, 'table', 'contract', 'column', 'contract_agmt_wk_cnt'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('contract')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'project_location')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'contract', 'column', 'project_location'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '工程地点',
   'user', @CurrentUser, 'table', 'contract', 'column', 'project_location'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('contract')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'delegation_client')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'contract', 'column', 'delegation_client'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '委托单位',
   'user', @CurrentUser, 'table', 'contract', 'column', 'delegation_client'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('contract')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'dlg_contactperson')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'contract', 'column', 'dlg_contactperson'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '委托单位联系人',
   'user', @CurrentUser, 'table', 'contract', 'column', 'dlg_contactperson'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('contract')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'dlg_contactperson_phone')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'contract', 'column', 'dlg_contactperson_phone'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '委托单位联系人电话',
   'user', @CurrentUser, 'table', 'contract', 'column', 'dlg_contactperson_phone'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('contract')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'accept_way')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'contract', 'column', 'accept_way'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '承接方式',
   'user', @CurrentUser, 'table', 'contract', 'column', 'accept_way'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('contract')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_corporation_signed')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'contract', 'column', 'is_corporation_signed'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '单位是否签订',
   'user', @CurrentUser, 'table', 'contract', 'column', 'is_corporation_signed'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('contract')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_client_signed')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'contract', 'column', 'is_client_signed'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '业主是否签订',
   'user', @CurrentUser, 'table', 'contract', 'column', 'is_client_signed'
go

/*==============================================================*/
/* Index: accept_FK                                             */
/*==============================================================*/
create index accept_FK on contract (
staff_id ASC
)
go

/*==============================================================*/
/* Table: inspection_project                                    */
/*==============================================================*/
create table inspection_project (
   id                   char(32)             not null,
   contract_id          char(32)             null,
   bridge_id            char(32)             null,
   enter_date           datetime             null,
   exit_date            datetime             null,
   bridge_inspection    numeric              not null,
   constraint PK_INSPECTION_PROJECT primary key nonclustered (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('inspection_project') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'inspection_project' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '检测项目', 
   'user', @CurrentUser, 'table', 'inspection_project'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('inspection_project')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'inspection_project', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'id',
   'user', @CurrentUser, 'table', 'inspection_project', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('inspection_project')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'contract_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'inspection_project', 'column', 'contract_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键',
   'user', @CurrentUser, 'table', 'inspection_project', 'column', 'contract_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('inspection_project')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'bridge_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'inspection_project', 'column', 'bridge_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '桥梁_id',
   'user', @CurrentUser, 'table', 'inspection_project', 'column', 'bridge_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('inspection_project')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'enter_date')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'inspection_project', 'column', 'enter_date'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '进场时间',
   'user', @CurrentUser, 'table', 'inspection_project', 'column', 'enter_date'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('inspection_project')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'exit_date')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'inspection_project', 'column', 'exit_date'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '退场时间',
   'user', @CurrentUser, 'table', 'inspection_project', 'column', 'exit_date'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('inspection_project')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'bridge_inspection')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'inspection_project', 'column', 'bridge_inspection'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '检测类型',
   'user', @CurrentUser, 'table', 'inspection_project', 'column', 'bridge_inspection'
go

/*==============================================================*/
/* Index: have_FK                                               */
/*==============================================================*/
create index have_FK on inspection_project (
bridge_id ASC
)
go

/*==============================================================*/
/* Index: have4_FK                                              */
/*==============================================================*/
create index have4_FK on inspection_project (
contract_id ASC
)
go

/*==============================================================*/
/* Table: r_bridge_inspection_staff                             */
/*==============================================================*/
create table r_bridge_inspection_staff (
   id                   char(32)             not null,
   inspection_project_id char(32)             not null,
   职工_id                char(32)             not null,
   is_response          bit                  not null default 0,
   scene_coff           bit                  not null default 0
      constraint CKC_SCENE_COFF_R_BRIDGE check (scene_coff >= 0),
   plan_coff            bit                  not null default 0
      constraint CKC_PLAN_COFF_R_BRIDGE check (plan_coff >= 0),
   report_coff          bit                  not null default 0
      constraint CKC_REPORT_COFF_R_BRIDGE check (report_coff >= 0),
   report_check_coff    bit                  not null default 0
      constraint CKC_REPORT_CHECK_COFF_R_BRIDGE check (report_check_coff >= 0),
   others_coff          bit                  not null default 0
      constraint CKC_OTHERS_COFF_R_BRIDGE check (others_coff >= 0),
   production_value_ratio float                null,
   production_value     float                null,
   constraint PK_R_BRIDGE_INSPECTION_STAFF primary key (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('r_bridge_inspection_staff') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'r_bridge_inspection_staff' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '参与项目', 
   'user', @CurrentUser, 'table', 'r_bridge_inspection_staff'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('r_bridge_inspection_staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'r_bridge_inspection_staff', 'column', 'id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'id',
   'user', @CurrentUser, 'table', 'r_bridge_inspection_staff', 'column', 'id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('r_bridge_inspection_staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'inspection_project_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'r_bridge_inspection_staff', 'column', 'inspection_project_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '检测项目_id',
   'user', @CurrentUser, 'table', 'r_bridge_inspection_staff', 'column', 'inspection_project_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('r_bridge_inspection_staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = '职工_id')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'r_bridge_inspection_staff', 'column', '职工_id'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '主键。',
   'user', @CurrentUser, 'table', 'r_bridge_inspection_staff', 'column', '职工_id'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('r_bridge_inspection_staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'is_response')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'r_bridge_inspection_staff', 'column', 'is_response'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '是否负责',
   'user', @CurrentUser, 'table', 'r_bridge_inspection_staff', 'column', 'is_response'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('r_bridge_inspection_staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'scene_coff')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'r_bridge_inspection_staff', 'column', 'scene_coff'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '现场检测',
   'user', @CurrentUser, 'table', 'r_bridge_inspection_staff', 'column', 'scene_coff'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('r_bridge_inspection_staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'plan_coff')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'r_bridge_inspection_staff', 'column', 'plan_coff'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '方案制定',
   'user', @CurrentUser, 'table', 'r_bridge_inspection_staff', 'column', 'plan_coff'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('r_bridge_inspection_staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'report_coff')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'r_bridge_inspection_staff', 'column', 'report_coff'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '报告撰写',
   'user', @CurrentUser, 'table', 'r_bridge_inspection_staff', 'column', 'report_coff'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('r_bridge_inspection_staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'report_check_coff')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'r_bridge_inspection_staff', 'column', 'report_check_coff'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '报告校核',
   'user', @CurrentUser, 'table', 'r_bridge_inspection_staff', 'column', 'report_check_coff'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('r_bridge_inspection_staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'others_coff')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'r_bridge_inspection_staff', 'column', 'others_coff'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '其它工作',
   'user', @CurrentUser, 'table', 'r_bridge_inspection_staff', 'column', 'others_coff'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('r_bridge_inspection_staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'production_value_ratio')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'r_bridge_inspection_staff', 'column', 'production_value_ratio'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '产值比例',
   'user', @CurrentUser, 'table', 'r_bridge_inspection_staff', 'column', 'production_value_ratio'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('r_bridge_inspection_staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'production_value')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'r_bridge_inspection_staff', 'column', 'production_value'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '产值',
   'user', @CurrentUser, 'table', 'r_bridge_inspection_staff', 'column', 'production_value'
go

/*==============================================================*/
/* Index: r_bridge_inspection_staff_FK                          */
/*==============================================================*/
create index r_bridge_inspection_staff_FK on r_bridge_inspection_staff (
inspection_project_id ASC
)
go

/*==============================================================*/
/* Index: r_bridge_inspection_staff2_FK                         */
/*==============================================================*/
create index r_bridge_inspection_staff2_FK on r_bridge_inspection_staff (
职工_id ASC
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
   gender               numeric              not null default 0,
   office_phone         varchar(15)          null,
   mobile_phone         varchar(15)          not null,
   position             varchar(10)          null,
   job_title            varchar(10)          null,
   education            varchar(10)          not null,
   hiredate             datetime             not null,
   constraint PK_STAFF primary key nonclustered (id)
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

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'job_title')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'staff', 'column', 'job_title'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '职称',
   'user', @CurrentUser, 'table', 'staff', 'column', 'job_title'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'education')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'staff', 'column', 'education'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '学历',
   'user', @CurrentUser, 'table', 'staff', 'column', 'education'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('staff')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'hiredate')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'staff', 'column', 'hiredate'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '入职时间',
   'user', @CurrentUser, 'table', 'staff', 'column', 'hiredate'
go

alter table contract
   add constraint FK_CONTRACT_ACCEPT_STAFF foreign key (staff_id)
      references staff (id)
go

alter table inspection_project
   add constraint FK_INSPECTI_HAVE_BRIDGE foreign key (bridge_id)
      references bridge (id)
go

alter table inspection_project
   add constraint FK_INSPECTI_HAVE4_CONTRACT foreign key (contract_id)
      references contract (id)
go

alter table r_bridge_inspection_staff
   add constraint FK_R_BRIDGE_R_BRIDGE__INSPECTI foreign key (inspection_project_id)
      references inspection_project (id)
go

alter table r_bridge_inspection_staff
   add constraint FK_R_BRIDGE_R_BRIDGE__STAFF foreign key (职工_id)
      references staff (id)
go

