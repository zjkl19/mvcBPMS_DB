use BPMSx
insert into staff values ('cceb765a47b34de6a514f8798f9f079c',1743,'林迪南',1,'15980565056','检测员')
insert into staff values ('5d1fd46389ab4aee827618b359e674e6',528,'李鹏',1,'15066668888','室副主任')
insert into staff values ('d191f707dbff4144958142b506de956c',143,'赖苍林',1,'13950290361','室主任')
insert into staff values ('34bc2bb4403a4f168c2e44fa3cd8102c',1234,'张啸',1,'13612345678','检测员')


insert into contact values('6f290c21a18d43e29733575004cde491','5d1fd46389ab4aee827618b359e674e6','HT02CB1600297','某市某桥梁静载实验',100000.00,'福州市建设局','投标',0,0) 
insert into contact values('0ac6cc51470d4ac6a6de59f3cbf790b4','5d1fd46389ab4aee827618b359e674e6','HT02CB1600298','某市某桥梁维养',200000.00,'某市建设局','投标',0,0)
insert into contact values('873340666e664cf785feb2ad695bebec','5d1fd46389ab4aee827618b359e674e6','HT02CB1600299','某市某桥梁外观检查',150000.00,'某市桥梁管理处','投标',0,0)



insert into project values('9d1540c514064bf398147a804f57cd52','6f290c21a18d43e29733575004cde491','某桥梁静载实验',100000.00,'2017-2-1',NULL,0,0)
insert into project values('a9a52017b2c841fcba032de5b3b3bee2','0ac6cc51470d4ac6a6de59f3cbf790b4','某市某桥梁维养',200000.00,'2017-3-15',NULL,0,0)
insert into project values('0c6363207f694b6fb28442a11e09b00b','873340666e664cf785feb2ad695bebec','某桥外观检查',150000.00,'2017-4-15',NULL,0,0)


insert into r_project_staff values('495ee3383bda478789cd8db34e4d52ec','9d1540c514064bf398147a804f57cd52','cceb765a47b34de6a514f8798f9f079c',1,1,0)
insert into r_project_staff values('cb8b8156cd664060b705c306648e266d','a9a52017b2c841fcba032de5b3b3bee2','5d1fd46389ab4aee827618b359e674e6',1,1,0)
insert into r_project_staff values('80881497ab064e89a8ca0d972321e67a','0c6363207f694b6fb28442a11e09b00b','5d1fd46389ab4aee827618b359e674e6',0,1,1)

insert into project_money_flow values('aac52d9e367145339579f4c3e1995ebd','cceb765a47b34de6a514f8798f9f079c','9d1540c514064bf398147a804f57cd52','2017-5-1',5000.00,6000.00,3000.00)
insert into project_money_flow values('c45bd23f13934ebdab0090969e06ca9a','5d1fd46389ab4aee827618b359e674e6','a9a52017b2c841fcba032de5b3b3bee2','2017-6-1',0000.00,5000.00,5000.00)