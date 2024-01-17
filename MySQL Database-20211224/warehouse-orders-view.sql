CREATE OR REPLACE VIEW warehouse_orders AS 
SELECT 
  * 
FROM
  (SELECT 
    wh_orders.id,
    wh_orders.`warehouse_id`,
    wh_orders.`order_type_id`,
    wh_orders.`order_status_id`,
    wh_orders.`create_by`,
    wh_orders.`modify_date`,
    wh_orders.`modify_by`,
    wh_orders.`notes`,
    warehouses.`name` AS warehouse,
    order_types.`order_type`,
    orderstatus_main (wh_orders.id) AS order_status 
  FROM
    wh_orders 
    LEFT JOIN warehouses 
      ON warehouses.id = wh_orders.warehouse_id 
    LEFT JOIN order_types 
      ON order_types.id = wh_orders.order_type_id 
    LEFT JOIN statuses 
      ON statuses.id = wh_orders.order_status_id 
  UNION
  SELECT 
    transferout.id,
    `wh_transfer`.`new_wh_id`,
    transferout.`order_type_id`,
    transferout.`order_status_id`,
    transferout.`create_by`,
    transferout.`modify_date`,
    transferout.`modify_by`,
    transferout.`notes`,
    warehouses.`name` AS warehouse,
    'Transfer In' AS `order_type`,
    orderstatus_main (transferout.id) AS order_status 
  FROM
    wh_orders AS transferout 
    INNER JOIN `wh_transfer` 
      ON wh_transfer.`wh_order_id` = transferout.id 
    LEFT JOIN warehouses 
      ON warehouses.id = transferout.`warehouse_id` 
    LEFT JOIN warehouses AS newwarehouse 
      ON newwarehouse.id = `wh_transfer`.`new_wh_id` 
    LEFT JOIN order_types 
      ON order_types.id = transferout.order_type_id 
    LEFT JOIN statuses 
      ON statuses.id = transferout.order_status_id) AS warehouse_orders 
GROUP BY warehouse_orders.id,
  warehouse_orders.order_type 
ORDER BY warehouse_orders.`id` DESC ;