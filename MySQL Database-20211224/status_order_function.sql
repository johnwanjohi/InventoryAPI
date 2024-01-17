/*
CREATE OR REPLACE FUNCTION  `edgeworth_db`.`orderstatus` (total_ordered_qty  FLOAT ,  total_received  FLOAT) 
RETURNS VARCHAR(50)
  RETURN CASE 
    WHEN (total_received < total_ordered_qty AND total_received = 0) THEN 'Ordered'
    WHEN (total_received < total_ordered_qty AND total_received <> 0) THEN 'In Progress'
    WHEN (total_ordered_qty = total_received AND total_ordered_qty <> 0) THEN 'Completed'
    WHEN (total_ordered_qty = 0) THEN 'Created' 
    WHEN (total_received > total_ordered_qty) THEN 'Wrong Entries'
    ELSE 'Created'
  END;
id	status
1	In Progress / Ordered
2	Completed / Received
3	Created  

id	order_type
1	Supplier Stock
2	Supplier Return
3	Transfer
4	Van Stock
5	Van Return
6	Adjustment
 */
 
DELIMITER $$

CREATE OR REPLACE FUNCTION orderstatus_main(
	var_wh_order_id INTEGER
) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE returnStatus VARCHAR(20);
    DECLARE ordertypeid INTEGER;
    DECLARE total_ordered_qty  FLOAT;
    DECLARE total_received  FLOAT;
    
    SELECT order_type_id INTO ordertypeid FROM wh_orders WHERE id = wh_order_id;
    
    CASE 
    WHEN ordertypeid = 1 THEN 
	SELECT SUM(received_qty) INTO total_received FROM `wh_supplierstock_details` WHERE w_order_id = var_wh_order_id;
	SELECT SUM(ordered_qty) INTO total_ordered_qty FROM `wh_supplierstock_details` WHERE w_order_id = var_wh_order_id;
	CASE 
	WHEN (total_ordered_qty =  0) THEN
		SET returnStatus = 'Ordered';
	WHEN (total_received < total_ordered_qty AND total_received <> 0) THEN 
		SET returnStatus = 'In Progress';
	WHEN (total_ordered_qty = total_received AND total_ordered_qty <> 0) THEN 
		SET returnStatus = 'Completed';
	WHEN (total_ordered_qty = 0) THEN 
		SET returnStatus = 'Created'; 
	WHEN (total_received > total_ordered_qty) THEN 
		SET returnStatus = 'Wrong Entries';
	ELSE 
		SET returnStatus = 'Created';
	END;
    WHEN ordertypeid = 2 THEN
	SET returnStatus = ' 88888 Wrong Entries';
    END;
	RETURN (returnStatus);
END$$
DELIMITER ;