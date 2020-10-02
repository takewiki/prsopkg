# 0-加载处理包------
library(readxl)



#1-读取模板说明页-----

sheet1_readme <- read_excel("data-raw/普瑞金蝶云_销售订单_标准订单_导入测试数据.xlsx",
                                     sheet = "引入模板说明")
View(sheet1_readme)

#2-基本信息---------
library(readxl)
sheet2_heading <- read_excel("data-raw/普瑞金蝶云_销售订单_标准订单_导入测试数据.xlsx",
                                     sheet = "销售订单#基本信息(FBillHead)")


# FBillNo <- sheet2_heading$FBillNo[2];
sheet2_heading[2,'FBillNo'] <-'XSDD000021';
#订单日期为当天

sheet2_heading[2,'FDate'] <- as.character(Sys.Date())
#View(sheet2_heading)

#读取客户代码
library(readxl)
CustMap <- read_excel("data-raw/销售订单导入对照表.xlsx",
                        sheet = "客户对照表")
#View(CustMap)
#计取客户代码，完成转换
library(readxl)
so_cust <- read_excel("data-raw/pr_so_upload.xls",
                           sheet = "订货明细", col_names = FALSE)
custName <- as.character(so_cust[1,2]);
custNumber_kdc <-as.character(CustMap[CustMap$名称 == custName,'金蝶云代码']);
custName_kdc <-as.character(CustMap[CustMap$名称 == custName,'金蝶云名称']);

sheet2_heading[2,'FCustId'] <- custNumber_kdc;
sheet2_heading[2,'FCustId#Name'] <- custName_kdc;
sheet2_heading[2,'FReceiveId'] <- custNumber_kdc;
sheet2_heading[2,'FReceiveId#Name'] <- custName_kdc;
View(sheet2_heading)

#class(custName);



