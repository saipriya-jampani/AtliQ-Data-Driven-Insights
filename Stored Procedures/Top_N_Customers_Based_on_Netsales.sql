CREATE DEFINER=`root`@`localhost` PROCEDURE `top_N_customers_basedon_netsales`(
					in_market varchar(45),
                    in_fiscal_year int,
                    in_top_n int
)
BEGIN
	select s.customer,round(sum(net_sales)/1000000,2) as net_sales_mln
	from net_sales s 
	join dim_customer c 
	on s.customer_code = c.customer_code
	where s.fiscal_year =in_fiscal_year and s.market = in_market
	group by s.customer
	order by net_sales_mln desc
	limit in_top_n;
END
