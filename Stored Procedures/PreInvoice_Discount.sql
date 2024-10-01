CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `sales_preinv_discount` AS
    SELECT 
        `s`.`date` AS `sale_date`,
        `s`.`customer_code` AS `sale_customer_code`,
        `s`.`fiscal_year` AS `fiscal_year`,
        `s`.`sold_quantity` AS `sold_quantity`,
        `c`.`market` AS `market`,
        `c`.`region` AS `region`,
        `c`.`customer` AS `customer`,
        `p`.`product` AS `product`,
        `p`.`product_code` AS `sale_product_code`,
        `p`.`variant` AS `variant`,
        `g`.`gross_price` AS `gross_price`,
        ROUND((`g`.`gross_price` * `s`.`sold_quantity`),
                2) AS `total_gross_price`,
        `pre`.`pre_invoice_discount_pct` AS `pre_invoice_discount_pct`
    FROM
        ((((`fact_sales_monthly` `s`
        JOIN `dim_product` `p` ON ((`s`.`product_code` = `p`.`product_code`)))
        JOIN `dim_customer` `c` ON ((`c`.`customer_code` = `s`.`customer_code`)))
        JOIN `fact_gross_price` `g` ON (((`s`.`product_code` = `g`.`product_code`)
            AND (`s`.`fiscal_year` = `g`.`fiscal_year`))))
        JOIN `fact_pre_invoice_deductions` `pre` ON (((`s`.`customer_code` = `pre`.`customer_code`)
            AND (`s`.`fiscal_year` = `pre`.`fiscal_year`))))
    ORDER BY `s`.`date`
