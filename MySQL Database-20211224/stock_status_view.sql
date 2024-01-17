CREATE OR REPLACE VIEW `stock_status` AS
SELECT
    `stockstatus`.`warehouse_id` AS `warehouse_id`,
    `warehouses`.`name` AS `warehouse`,
    `stockstatus`.`product_id` AS `product_id`,
    `brands`.`brand` AS `brand`,
    `products`.`partnumber` AS `partnumber`,
    `products`.`description` AS `description`,
    `types`.`type` AS `type`,
    `categories`.`category` AS `category`,
    SUM(`stockstatus`.`ordered_qty`) AS `ordered_qty`,
    SUM(`stockstatus`.`received_qty`) AS `received_qty`,
    SUM(`stockstatus`.`return_qty`) AS `return_qty`,
    SUM(`stockstatus`.`transfer_qty`) AS `transfer_qty`,
    SUM(`stockstatus`.`receive_qty`) AS `received_from_transfer_qty`,
    SUM(`stockstatus`.`adjusted_qty`) AS `adjusted_qty`,
    SUM(`stockstatus`.`van_return_qty`) AS `van_return_qty`,
    SUM(`stockstatus`.`van_out_qty`) AS `van_stock_qty`,
    SUM(`stockstatus`.`received_qty`) -
    SUM(`stockstatus`.`return_qty`) -
    SUM(`stockstatus`.`transfer_qty`) +
    SUM(`stockstatus`.`receive_qty`) +
    SUM(`stockstatus`.`adjusted_qty`) +
    SUM(`stockstatus`.`van_return_qty`) -
    SUM(`stockstatus`.`van_out_qty`)  AS `available`
FROM
    (
        (
            (
                (
                    (
                        (SELECT
                             `wh_orders`.`warehouse_id` AS `warehouse_id`,
                             `wh_supplierstock`.`wh_order_id` AS `wh_order_id`,
                             `wh_supplierstock`.`product_id` AS `product_id`,
                             `wh_supplierstock`.`ordered_qty` AS `ordered_qty`,
                             `wh_supplierstock`.`received_qty` AS `received_qty`,
                             0 AS `return_qty`,
                             0 AS `transfer_qty`,
                             0 AS `receive_qty`,
                             0 AS `adjusted_qty` ,
                             0 AS van_return_qty,
                             0 AS van_out_qty
                         FROM
                             (
                                 `wh_supplierstock`
                                     JOIN `wh_orders`
                                 ON (
                                         `wh_orders`.`id` = `wh_supplierstock`.`wh_order_id`
                                     )
                                 )
                         UNION
                         SELECT
                             `wh_orders`.`warehouse_id` AS `warehouse_id`,
                             `wh_supplierreturn`.`wh_order_id` AS `wh_order_id`,
                             `wh_supplierreturn`.`product_id` AS `product_id`,
                             0 AS `ordered_qty`,
                             0 AS `received_qty`,
                             `wh_supplierreturn`.`return_qty` AS `return_qty`,
                             0 AS `transfer_qty`,
                             0 AS `receive_qty`,
                             0 AS `adjusted_qty` ,
                             0 AS van_return_qty,
                             0 AS van_out_qty
                         FROM
                             (
                                 `wh_supplierreturn`
                                     JOIN `wh_orders`
                                 ON (
                                         `wh_orders`.`id` = `wh_supplierreturn`.`wh_order_id`
                                     )
                                 )
                         UNION
                         SELECT
                             `wh_orders`.`warehouse_id` AS `warehouse_id`,
                             `wh_transfer`.`wh_order_id` AS `wh_order_id`,
                             `wh_transfer`.`product_id` AS `product_id`,
                             0 AS `ordered_qty`,
                             0 AS `received_qty`,
                             0 AS `return_qty`,
                             `wh_transfer`.`transfer_qty` AS `transfer_qty`,
                             0 AS `receive_qty`,
                             0 AS `adjusted_qty` ,
                             0 AS van_return_qty,
                             0 AS van_out_qty
                         FROM
                             (
                                 `wh_transfer`
                                     JOIN `wh_orders`
                                 ON (
                                         `wh_orders`.`id` = `wh_transfer`.`wh_order_id`
                                     )
                                 )
                         UNION
                         SELECT
                             `wh_transfer`.`new_wh_id` AS `new_wh_id`,
                             `wh_transfer`.`wh_order_id` AS `wh_order_id`,
                             `wh_transfer`.`product_id` AS `product_id`,
                             0 AS `ordered_qty`,
                             0 AS `received_qty`,
                             0 AS `return_qty`,
                             0 AS `transfer_qty`,
                             `wh_transfer`.`receive_qty` AS `receive_qty`,
                             0 AS `adjusted_qty` ,
                             0 AS van_return_qty,
                             0 AS van_out_qty
                         FROM
                             `wh_transfer`
                         UNION
                         SELECT
                             `wh_transfer`.`new_wh_id` AS `new_wh_id`,
                             `wh_transfer`.`wh_order_id` AS `wh_order_id`,
                             `wh_transfer`.`product_id` AS `product_id`,
                             0 AS `ordered_qty`,
                             0 AS `received_qty`,
                             0 AS `return_qty`,
                             0 AS `transfer_qty`,
                             `wh_transfer`.`receive_qty` AS `receive_qty`,
                             0 AS `adjusted_qty`,
                             0 AS van_return_qty,
                             0 AS van_out_qty
                         FROM
                             `wh_transfer`
                         UNION
                         SELECT
                             `wh_orders`.`warehouse_id` AS `warehouse_id`,
                             `wh_adjustment`.`wh_order_id` AS `wh_order_id`,
                             `wh_adjustment`.`product_id` AS `product_id`,
                             0 AS `ordered_qty`,
                             0 AS `received_qty`,
                             0 AS `return_qty`,
                             0 AS `transfer_qty`,
                             0 AS `receive_qty`,
                             `wh_adjustment`.`new_qty` - `wh_adjustment`.`old_qty` AS `adjusted_qty`,
                             0 AS van_return_qty,
                             0 AS van_out_qty
                         FROM
                             (
                                 `wh_adjustment`
                                     JOIN `wh_orders`
                                 ON (
                                         `wh_orders`.`id` = `wh_adjustment`.`wh_order_id`
                                     )
                                 )
                         UNION
                         SELECT
                             `wh_orders`.`warehouse_id` AS `warehouse_id`,
                             `wh_vanreturn`.`wh_order_id` AS `wh_order_id`,
                             `wh_vanreturn`.`product_id` AS `product_id`,
                             0 AS `ordered_qty`,
                             0 AS `received_qty`,
                             0 AS `return_qty`,
                             0 AS `transfer_qty`,
                             0 AS `receive_qty`,
                             0 AS `adjusted_qty`,
                             `wh_vanreturn`.`return_qty` AS van_return_qty ,
                             0 AS van_out_qty
                         FROM
                             (
                                 `wh_vanreturn`
                                     JOIN `wh_orders`
                                 ON (
                                         `wh_orders`.`id` = `wh_vanreturn`.`wh_order_id`
                                     )
                                 )
                         UNION
                         SELECT
                             `wh_orders`.`warehouse_id` AS `warehouse_id`,
                             `wh_vanstock`.`wh_order_id` AS `wh_order_id`,
                             `wh_vanstock`.`product_id` AS `product_id`,
                             0 AS `ordered_qty`,
                             0 AS `received_qty`,
                             0 AS `return_qty`,
                             0 AS `transfer_qty`,
                             0 AS `receive_qty`,
                             0 AS `adjusted_qty`,
                             0 AS van_return_qty ,
                             `wh_vanstock`.`issue_qty` AS van_out_qty
                         FROM
                             (
                                 `wh_vanstock`
                                     JOIN `wh_orders`
                                 ON (
                                         `wh_orders`.`id` = `wh_vanstock`.`wh_order_id`
                                     )
                                 )
                        ) `stockstatus`
                            LEFT JOIN `warehouses`
                        ON (
                                `warehouses`.`id` = `stockstatus`.`warehouse_id`
                            )
                        )
                        LEFT JOIN `products`
                    ON (
                            `stockstatus`.`product_id` = `products`.`id`
                        )
                    )
                    LEFT JOIN `brands`
                ON (
                        `brands`.`id` = `products`.`brand_id`
                    )
                )
                LEFT JOIN `categories`
            ON (
                    `products`.`category_id` = `categories`.`id`
                )
            )
            LEFT JOIN `types`
        ON (
                `types`.`id` = `products`.`type_id`
            )
        )
GROUP BY `stockstatus`.`warehouse_id`,
         `stockstatus`.`product_id`