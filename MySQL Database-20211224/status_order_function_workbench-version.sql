/*
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
DROP FUNCTION if exists `edgeworth_db`.`orderstatus_main`;
DELIMITER //
CREATE FUNCTION `edgeworth_db`.`orderstatus_main`(
	var_wh_order_id INTEGER
) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE returnStatus VARCHAR(20);
    DECLARE ordertypeid INTEGER;
    DECLARE total_ordered_qty  FLOAT;
    DECLARE total_received  FLOAT;
          
    DECLARE total_not_returned float;
    
    DECLARE total_transfered float;
    
    DECLARE total_vanstock float;
    DECLARE zero_vanstock float;
    
    DECLARE total_vanreturn float;
	DECLARE total_zerovanreturn float;
    
    DECLARE total_adjustment_old_qty float;
    DECLARE total_adjustment_new_qty float;
    DECLARE unadjusted_items float;
    
    
    SELECT order_type_id INTO ordertypeid FROM wh_orders WHERE id = var_wh_order_id;
    
    IF (ordertypeid = 1) THEN 
		SELECT SUM(received_qty) INTO total_received FROM `wh_supplierstock_details` WHERE w_order_id = var_wh_order_id;
		SELECT SUM(ordered_qty) INTO total_ordered_qty FROM `wh_supplierstock_details` WHERE w_order_id = var_wh_order_id;
		IF (total_ordered_qty =  0) THEN
			SET returnStatus = 'Ordered';
		ELSEIF (total_received < total_ordered_qty AND total_received <> 0) THEN 
			SET returnStatus = 'In Progress';
		ELSEIF (total_ordered_qty = total_received AND total_ordered_qty <> 0) THEN 
			SET returnStatus = 'Completed';
		ELSEIF (total_ordered_qty = 0) THEN 
			SET returnStatus = 'Created'; 
		ELSEIF (total_received > total_ordered_qty) THEN 
			SET returnStatus = 'Wrong Entries';
		ELSE 
			SET returnStatus = 'Created';
		END IF;
	ELSEIF (ordertypeid = 2) THEN 
		SELECT COUNT(id) INTO total_not_returned FROM `wh_supplierreturn_details` WHERE w_order_id = var_wh_order_id and return_qty = 0;
        IF(total_not_returned <> 0 ) THEN 
			set returnStatus = concat(total_not_returned,' In Progress');
		ELSEIF (total_not_returned = 0 ) THEN 
			set returnStatus = 'Completed';
		ELSE 
			SET returnStatus = 'Created';
		END IF;
	ELSEIF (ordertypeid = 3) THEN 
		select sum(`transfer_qty`) INTO total_transfered from `wh_transfer_details` where w_order_id = var_wh_order_id;
		select sum(`receive_qty`) INTO total_received from `wh_transfer_details` where w_order_id = var_wh_order_id;
        IF(total_transfered = 0 AND total_received = 0 ) THEN
			SET returnStatus = 'Created'; 
		ELSEIF(total_transfered <> total_received ) THEN 
			SET returnStatus = 'In Progress';
		ELSEIF(total_transfered = total_received ) THEN 
			SET returnStatus = 'Completed';
        END IF;		
	ELSEIF (ordertypeid = 4) THEN 
		select sum(`issue_qty`) INTO total_vanstock from `wh_vanstock_details` where w_order_id = var_wh_order_id;
        select count(`issue_qty`) INTO zero_vanstock from `wh_vanstock_details` where w_order_id = var_wh_order_id AND `issue_qty` = 0;        
        IF(total_vanstock = 0 AND zero_vanstock = 0) THEN
			SET returnStatus = 'Created'; 
		ELSEIF(zero_vanstock <> 0) THEN
			SET returnStatus = 'In Progress';
		ELSEIF(total_vanstock <> 0 AND zero_vanstock = 0) THEN
			SET returnStatus = 'Completed';
        END IF;        
	ELSEIF (ordertypeid = 5) THEN 
		select sum(`return_qty`) INTO total_vanreturn from `wh_vanreturn_details` where w_order_id = var_wh_order_id;
        select count(`return_qty`) INTO total_zerovanreturn from `wh_vanreturn_details` where w_order_id = var_wh_order_id AND `return_qty` = 0;        
        IF(total_vanreturn = 0) THEN
			SET returnStatus = 'Created'; 
		ELSEIF(total_zerovanreturn <> 0) THEN
			SET returnStatus = 'In Progress';
		ELSEIF(total_vanreturn <> 0 AND total_zerovanreturn = 0) THEN
			SET returnStatus = 'Completed';
		ELSE 
			SET returnStatus = 'Created';
        END IF;        
	ELSEIF (ordertypeid = 6) THEN 
		select sum(`old_qty`) INTO total_adjustment_old_qty from `wh_adjustment_details` where w_order_id = var_wh_order_id;
        select sum(`new_qty`) INTO total_adjustment_new_qty from `wh_adjustment_details` where w_order_id = var_wh_order_id;
        select count(`id`) INTO unadjusted_items from `wh_adjustment_details` where w_order_id = var_wh_order_id and (old_qty = new_qty);
        IF(total_adjustment_old_qty = 0 and total_adjustment_new_qty = 0) THEN
			SET returnStatus = 'Created'; 
		ELSEIF(unadjusted_items <> 0) THEN
			SET returnStatus = 'In Progress';
		ELSEIF(unadjusted_items = 0) THEN
			SET returnStatus = 'Completed';
		ELSE 
			SET returnStatus = 'Created';
        END IF;
    END IF;
    RETURN (returnStatus);
END //
DELIMITER ;