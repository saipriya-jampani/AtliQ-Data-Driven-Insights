CREATE DEFINER=`root`@`localhost` PROCEDURE `top_N_products_basedon_netsales`(
					in_fiscal_year int,
                    in_top_N int
)
BEGIN
	select product,round(sum(net_sales)/1000000,2) as net_sales_mln
	from net_sales 
	where fiscal_year =in_fiscal_year
	group by product
	order by net_sales_mln
	limit in_top_N;
END
