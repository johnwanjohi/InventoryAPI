DELIMITER $$

USE `edgeworth_db`$$

DROP FUNCTION IF EXISTS `orderstatus`$$

CREATE DEFINER=`root`@`localhost` FUNCTION `orderstatus`(total_ordered_qty FLOAT,
                                                         total_received FLOAT,
                                                         ordertype VARCHAR(20)
) RETURNS VARCHAR(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE returnStatus VARCHAR(20);
    IF(ordertype = 'supplierreturn' OR ordertype = 'adjustment'  OR ordertype = 'transfer' OR ordertype = 'vanstock' OR ordertype = 'vanreturn') THEN
        /*
        SET returnStatus = concat( ordertype , total_ordered_qty , total_received );
        */
        IF(total_ordered_qty = 0 AND ordertype <> 'transfer') THEN
            SET returnstatus = 'Created';
        END IF;
        IF(total_ordered_qty <> 0 AND ordertype <> 'transfer') THEN
            IF (total_ordered_qty = total_received AND total_ordered_qty > 0) THEN
                SET returnStatus = 'Complete';
            END IF;
        END IF;
        IF(ordertype = 'transfer' ) THEN
            IF (total_ordered_qty = 0) THEN
                SET returnStatus = 'Created';
            END IF;
            IF (total_received < total_ordered_qty ) THEN
                SET returnStatus = 'In Progress';
            END IF;
            IF (total_ordered_qty = total_received AND total_ordered_qty > 0) THEN
                SET returnStatus = 'Complete';
            END IF;
        END IF;
        IF(ordertype = 'vanstock' ) THEN
            IF (total_ordered_qty = 0) THEN
                SET returnStatus = 'Created';
            END IF;
            IF (total_ordered_qty > 0) THEN
                SET returnStatus = 'Complete';
            END IF;
        END IF;
        IF(ordertype = 'vanreturn' ) THEN
            IF (total_ordered_qty = 0) THEN
                SET returnStatus = 'Created';
            END IF;
            IF (total_ordered_qty > 0) THEN
                SET returnStatus = 'Complete';
            END IF;
        END IF;
    END IF;
    IF(ordertype = 'supplierstock') THEN
        IF (total_received < total_ordered_qty AND total_received = 0) THEN
            SET returnStatus = 'Ordered';
        END IF;
        IF (total_received < total_ordered_qty AND total_received <> 0) THEN
            SET returnStatus = 'In Progress';
        END IF;
        IF (total_ordered_qty = 0) THEN
            SET returnStatus = 'Created';
        END IF;
        IF (total_ordered_qty = total_received AND total_ordered_qty > 0) THEN
            SET returnStatus = 'Complete';
        END IF;
        IF (total_received > total_ordered_qty) THEN
            SET returnStatus = 'Wrong Entries';
        END IF;
    END IF;
    RETURN (returnStatus);
END$$

DELIMITER ;