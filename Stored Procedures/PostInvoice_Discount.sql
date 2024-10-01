CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `sales_postinv_discount` AS
    SELECT 
        `s`.`sale_date` AS `sale_date`,
        `s`.`sale_customer_code` AS `sale_customer_code`,
        `s`.`fiscal_year` AS `fiscal_year`,
        `s`.`sold_quantity` AS `sold_quantity`,
        `s`.`market` AS `market`,
        `s`.`customer` AS `customer`,
        `s`.`region` AS `region`,
        `s`.`product` AS `product`,
        `s`.`sale_product_code` AS `sale_product_code`,
        `s`.`variant` AS `variant`,
        `s`.`gross_price` AS `gross_price`,
        `s`.`total_gross_price` AS `total_gross_price`,
        `s`.`pre_invoice_discount_pct` AS `pre_invoice_discount_pct`,
        (`s`.`total_gross_price` - (`s`.`total_gross_price` * `s`.`pre_invoice_discount_pct`)) AS `net_invoice_sales`,
        `post`.`customer_code` AS `customer_code`,
        `post`.`product_code` AS `product_code`,
        `post`.`date` AS `date`,
        `post`.`discounts_pct` AS `discounts_pct`,
        `post`.`other_deductions_pct` AS `other_deductions_pct`,
        (`post`.`discounts_pct` + `post`.`other_deductions_pct`) AS `post_deductions_pct`
    FROM
        (`sales_preinv_discount` `s`
        JOIN `fact_post_invoice_deductions` `post` ON (((`s`.`sale_product_code` = `post`.`product_code`)
            AND (`s`.`sale_customer_code` = `post`.`customer_code`)
            AND (`s`.`sale_date` = `post`.`date`))))
