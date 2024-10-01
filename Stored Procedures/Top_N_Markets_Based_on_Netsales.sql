CREATE DEFINER=`root`@`localhost` PROCEDURE `top_N_markets_basedon_netsales`(
					in_fisacl_year int,
					in_top_n int
							)
BEGIN
	select market,round(sum(net_sales)/1000000,2) as net_sales_mln
	from net_sales s
	where s.fiscal_year =in_fisacl_year
	group by market
	order by net_sales_mln desc
	limit in_top_n;
END
