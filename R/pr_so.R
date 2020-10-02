library(readxl)
library(reshape2)
pr_so_upload <- read_excel("data-raw/pr_so_upload.xls",
                           sheet = "订货明细", skip = 5)
col_count <- ncol(pr_so_upload);
col_sel <- 1:(col_count-1L);
row_count <-nrow(pr_so_upload);
row_sel <-1:(row_count-2L);
pr_so_detail <- pr_so_upload[row_sel,col_sel];

#View(pr_so_detail)

res <- melt(pr_so_detail);
#去除空行
res <- res[!is.na(res$value), ];
col_names <- c('FModel','FName','FQty');
names(res) <- col_names;
res <- res[,c('FName','FModel','FQty')]
res$FName <- as.character(res$FName);
View(res)


#读取订单表头-------
