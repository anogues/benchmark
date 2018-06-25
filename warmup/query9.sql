SELECT CASE 
         WHEN (SELECT Count(*) 
               FROM   tpcds2.store_sales 
               WHERE  ss_quantity BETWEEN 1 AND 20) > 3672 THEN 
         (SELECT Avg(ss_ext_list_price) 
          FROM   tpcds2.store_sales 
          WHERE 
         ss_quantity BETWEEN 1 AND 20) 
         ELSE (SELECT Avg(ss_net_profit) 
               FROM   tpcds2.store_sales 
               WHERE  ss_quantity BETWEEN 1 AND 20) 
       END bucket1, 
       CASE 
         WHEN (SELECT Count(*) 
               FROM   tpcds2.store_sales 
               WHERE  ss_quantity BETWEEN 21 AND 40) > 3392 THEN 
         (SELECT Avg(ss_ext_list_price) 
          FROM   tpcds2.store_sales 
          WHERE 
         ss_quantity BETWEEN 21 AND 40) 
         ELSE (SELECT Avg(ss_net_profit) 
               FROM   tpcds2.store_sales 
               WHERE  ss_quantity BETWEEN 21 AND 40) 
       END bucket2, 
       CASE 
         WHEN (SELECT Count(*) 
               FROM   tpcds2.store_sales 
               WHERE  ss_quantity BETWEEN 41 AND 60) > 32784 THEN 
         (SELECT Avg(ss_ext_list_price) 
          FROM   tpcds2.store_sales 
          WHERE 
         ss_quantity BETWEEN 41 AND 60) 
         ELSE (SELECT Avg(ss_net_profit) 
               FROM   tpcds2.store_sales 
               WHERE  ss_quantity BETWEEN 41 AND 60) 
       END bucket3, 
       CASE 
         WHEN (SELECT Count(*) 
               FROM   tpcds2.store_sales 
               WHERE  ss_quantity BETWEEN 61 AND 80) > 26032 THEN 
         (SELECT Avg(ss_ext_list_price) 
          FROM   tpcds2.store_sales 
          WHERE 
         ss_quantity BETWEEN 61 AND 80) 
         ELSE (SELECT Avg(ss_net_profit) 
               FROM   tpcds2.store_sales 
               WHERE  ss_quantity BETWEEN 61 AND 80) 
       END bucket4
       
FROM   tpcds2.reason 
WHERE  r_reason_sk = 1; 
