CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `net_sales` AS
    SELECT 
        `sales_postinv_discount`.`sale_date` AS `sale_date`,
        `sales_postinv_discount`.`sale_customer_code` AS `sale_customer_code`,
        `sales_postinv_discount`.`fiscal_year` AS `fiscal_year`,
        `sales_postinv_discount`.`sold_quantity` AS `sold_quantity`,
        `sales_postinv_discount`.`market` AS `market`,
        `sales_postinv_discount`.`region` AS `region`,
        `sales_postinv_discount`.`customer` AS `customer`,
        `sales_postinv_discount`.`product` AS `product`,
        `sales_postinv_discount`.`sale_product_code` AS `sale_product_code`,
        `sales_postinv_discount`.`variant` AS `variant`,
        `sales_postinv_discount`.`gross_price` AS `gross_price`,
        `sales_postinv_discount`.`total_gross_price` AS `total_gross_price`,
        `sales_postinv_discount`.`pre_invoice_discount_pct` AS `pre_invoice_discount_pct`,
        `sales_postinv_discount`.`net_invoice_sales` AS `net_invoice_sales`,
        `sales_postinv_discount`.`customer_code` AS `customer_code`,
        `sales_postinv_discount`.`product_code` AS `product_code`,
        `sales_postinv_discount`.`date` AS `date`,
        `sales_postinv_discount`.`discounts_pct` AS `discounts_pct`,
        `sales_postinv_discount`.`other_deductions_pct` AS `other_deductions_pct`,
        `sales_postinv_discount`.`post_deductions_pct` AS `post_deductions_pct`,
        (`sales_postinv_discount`.`net_invoice_sales` - (`sales_postinv_discount`.`net_invoice_sales` * `sales_postinv_discount`.`post_deductions_pct`)) AS `net_sales`
    FROM
        `sales_postinv_discount`
    
