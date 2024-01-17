DELIMITER $$

USE `edgeworth_db`$$

DROP FUNCTION IF EXISTS `orderstatus_main`$$

CREATE DEFINER=`root`@`localhost` FUNCTION `orderstatus_main`(var_wh_order_id INTEGER
) RETURNS VARCHAR(20) CHARSET utf8mb3
    DETERMINISTIC
BEGIN
    DECLARE returnStatus VARCHAR(50);
    DECLARE ordertypeid INTEGER;
    DECLARE total_ordered_qty  FLOAT;
    DECLARE total_received  FLOAT;

    DECLARE total_not_returned FLOAT;

    DECLARE total_transfered FLOAT;

    DECLARE total_vanstock FLOAT;
    DECLARE zero_vanstock FLOAT;

    DECLARE total_vanreturn FLOAT;
    DECLARE total_zerovanreturn FLOAT;

    DECLARE total_adjustment_old_qty FLOAT;
    DECLARE total_adjustment_new_qty FLOAT;
    DECLARE unadjusted_items FLOAT;


    SELECT order_type_id INTO ordertypeid FROM wh_orders WHERE id = var_wh_order_id;

    IF (ordertypeid = 1) THEN
        SELECT SUM(received_qty) INTO total_received FROM `wh_supplierstock` WHERE wh_order_id = var_wh_order_id;
        SELECT SUM(ordered_qty) INTO total_ordered_qty FROM `wh_supplierstock` WHERE wh_order_id = var_wh_order_id;
        IF (total_ordered_qty =  0) THEN
            SET returnStatus = 'Ordered';
        ELSEIF (total_received < total_ordered_qty AND total_received <> 0) THEN
            SET returnStatus = 'In Progress';
        ELSEIF (total_ordered_qty = total_received AND total_ordered_qty <> 0) THEN
            SET returnStatus = 'Complete';
        ELSEIF (total_ordered_qty = 0) THEN
            SET returnStatus = 'Created';
        ELSEIF (total_received > total_ordered_qty) THEN
            SET returnStatus = 'Wrong Entries';
        ELSE
            SET returnStatus = 'Created';
        END IF;
    ELSEIF (ordertypeid = 2) THEN
        SELECT COUNT(id) INTO total_not_returned FROM `wh_supplierreturn` WHERE wh_order_id = var_wh_order_id AND return_qty = 0;
        IF(total_not_returned <> 0 ) THEN
            SET returnStatus = CONCAT(total_not_returned,' In Progress');
        ELSEIF (total_not_returned = 0 ) THEN
            SET returnStatus = 'Complete';
        ELSE
            SET returnStatus = 'Created';
        END IF;
    ELSEIF (ordertypeid = 3) THEN
        SELECT SUM(`transfer_qty`) INTO total_transfered FROM `wh_transfer` WHERE wh_order_id = var_wh_order_id;
        SELECT SUM(`receive_qty`) INTO total_received FROM `wh_transfer` WHERE wh_order_id = var_wh_order_id;
        IF(total_transfered = 0 AND total_received = 0 ) THEN
            SET returnStatus = 'Created';
        END IF;

        IF(total_transfered <> total_received ) THEN
            SET returnStatus = 'In Progress';
        END IF;
        IF(total_transfered = total_received ) THEN
            SET returnStatus = 'Complete';
        END IF;
        IF(total_transfered = 0 ) THEN
            SET returnStatus = 'Created';
        END IF;
    ELSEIF (ordertypeid = 4) THEN

        SELECT SUM(`issue_qty`) INTO total_vanstock FROM `wh_vanstock` WHERE wh_order_id = var_wh_order_id;
        SELECT COUNT(`issue_qty`) INTO zero_vanstock FROM `wh_vanstock` WHERE wh_order_id = var_wh_order_id AND `issue_qty` = 0;
        SET returnStatus = total_vanstock;

        IF(zero_vanstock = 0 ) THEN
            SET returnStatus = 'Created';
        END IF;

        IF((total_vanstock = 0 AND zero_vanstock = 0) OR (zero_vanstock = NULL) ) THEN
            SET returnStatus = 'Created';
        END IF;
        IF(zero_vanstock <> 0) THEN
            SET returnStatus = 'In Progress';
        END IF;
        IF(total_vanstock <> 0 AND zero_vanstock = 0) THEN
            SET returnStatus = 'Complete';
        END IF;
        IF(zero_vanstock IS NULL) THEN
            SET returnStatus = 'Created';
        END IF;
    ELSEIF (ordertypeid = 5) THEN
        SELECT SUM(`return_qty`) INTO total_vanreturn FROM `wh_vanreturn` WHERE wh_order_id = var_wh_order_id;
        SELECT COUNT(`return_qty`) INTO total_zerovanreturn FROM `wh_vanreturn` WHERE wh_order_id = var_wh_order_id AND `return_qty` = 0;
        SET returnStatus = 'Created';
        IF(total_vanreturn = 0) THEN
            SET returnStatus = 'Created';
        ELSEIF(total_zerovanreturn <> 0) THEN
            SET returnStatus = 'In Progress';
        ELSEIF(total_vanreturn <> 0 AND total_zerovanreturn = 0) THEN
            SET returnStatus = 'Complete';
        ELSE
            SET returnStatus = 'Created';
        END IF;
    ELSEIF (ordertypeid = 6) THEN
        SELECT SUM(`old_qty`) INTO total_adjustment_old_qty FROM `wh_adjustment` WHERE wh_order_id = var_wh_order_id;
        SELECT SUM(`new_qty`) INTO total_adjustment_new_qty FROM `wh_adjustment` WHERE wh_order_id = var_wh_order_id;
        SELECT COUNT(`id`) INTO unadjusted_items FROM `wh_adjustment` WHERE wh_order_id = var_wh_order_id AND (old_qty = new_qty);
        IF(total_adjustment_old_qty = 0 AND total_adjustment_new_qty = 0) THEN
            SET returnStatus = 'Created';
        ELSEIF(unadjusted_items <> 0) THEN
            SET returnStatus = 'In Progress';
        ELSEIF(unadjusted_items = 0) THEN
            SET returnStatus = 'Complete';
        ELSE
            SET returnStatus = 'Created';
        END IF;
    END IF;
    RETURN (returnStatus);
END$$

DELIMITER ;
