<?php

namespace classes;

class wh_orders
{

function post()
    {
        unset($this->request->module);
        $this->db->sql("UPDATE wh_orders SET 
            warehouse_id=:warehouse_id,        
            order_type_id=:order_type_id,
            order_status_id=:order_status_id,       
            modify_date=now(),
            modify_by=:modify_by,
            notes=:notes,
            id=:id
        WHERE id=:id");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->request->form->id;
        return $this->getById();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function put()
    {
        unset($this->request->module);
        $this->db->sql("INSERT INTO wh_orders SET 
            order_type_id=:order_type_id,
            order_status_id=:order_status_id,
            create_date=now(),
            create_by=:create_by,
            modify_by=:create_by,
            modify_date=now(),
            notes=:notes,
            warehouse_id=:warehouse_id,
            id=:id");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->db->getInsertId();
        return $this->getById();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getAll()
    {
        $wh_orders = [];
        $this->db->getquery("SELECT wh_orders.*,
        warehouses.name as warehouse,
        order_types.order_type,
        orderstatus_main(wh_orders.id) as order_status
        FROM wh_orders 
        LEFT JOIN warehouses ON warehouses.id = wh_orders.warehouse_id 
        LEFT JOIN order_types ON order_types.id = wh_orders.order_type_id 
        LEFT JOIN statuses ON statuses.id = wh_orders.order_status_id ORDER BY wh_orders.id DESC");
        while ($wh_order = $this->db->fetch()) {
            $wh_orders[] = $wh_order;
        }
        $answer["wh_orders"] = $wh_orders;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getById()
    {
        $wh_order = $this->__getWhOrderById($this->request->id);        
        $answer["wh_order"] = $wh_order;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

private function __getWhOrderById($wh_order_id)
    {
        $wh_order = [];
        $this->db->getquery("SELECT wh_orders.*,
        warehouses.name as warehouse,
        order_types.order_type,
        orderstatus_main(wh_orders.id) as order_status 
        FROM wh_orders 
        LEFT JOIN warehouses ON warehouses.id = wh_orders.warehouse_id 
        LEFT JOIN order_types ON order_types.id = wh_orders.order_type_id 
        LEFT JOIN statuses ON statuses.id = wh_orders.order_status_id  
        WHERE wh_orders.id='" . $wh_order_id . "'");
        $wh_order = $this->db->fetch();
        return $wh_order;
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getAllWhOrdersByWarehouseId()
    {
        $wh_orders = [];
        /*$this->db->getquery("SELECT wh_orders.*,
        warehouses.name as warehouse,
        order_types.order_type,
        orderstatus_main(wh_orders.id) as order_status 
        FROM wh_orders 
        LEFT JOIN warehouses ON warehouses.id = wh_orders.warehouse_id 
        LEFT JOIN order_types ON order_types.id = wh_orders.order_type_id 
        LEFT JOIN statuses ON statuses.id = wh_orders.order_status_id  
        WHERE warehouse_id='" . $this->request->warehouse_id . "' order by wh_orders.id desc");*/
        $orders_query="
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
                WHERE warehouse_orders.warehouse_id='" . $this->request->warehouse_id . "'
                GROUP BY warehouse_orders.id,
                  warehouse_orders.order_type 
                ORDER BY warehouse_orders.`id` DESC ";

        // die($orders_query);
        $this->db->getquery($orders_query);

        while ($wh_order = $this->db->fetch()) {
            $wh_orders[] = $wh_order;
        }
        $answer["wh_orders"] = $wh_orders;
        return json_encode($answer);
    }   
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
private function __getAllWhOrdersByWarehouseId($warehouse_id)
    {
        $wh_orders = [];
        $this->db->getquery("SELECT wh_orders.*,
        warehouses.name as warehouse,
        order_types.order_type,
        orderstatus_main(wh_orders.id) as order_status 
        FROM wh_orders 
        LEFT JOIN warehouses ON warehouses.id = wh_orders.warehouse_id 
        LEFT JOIN order_types ON order_types.id = wh_orders.order_type_id 
        LEFT JOIN statuses ON statuses.id = wh_orders.order_status_id  
        WHERE warehouse_id='" . $warehouse_id . "'");
        while ($wh_order = $this->db->fetch()) {
            $wh_orders[] = $wh_order;
        }
        return $wh_orders;
    }     
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function delete()
    {
        $this->db->getquery("DELETE FROM wh_supplierreturn WHERE wh_order_id='" . $this->request->id . "'");
        $this->db->getquery("DELETE FROM wh_supplierstock WHERE wh_order_id='" . $this->request->id . "'");
        $this->db->getquery("DELETE FROM wh_adjustment WHERE wh_order_id='" . $this->request->id . "'");
        $this->db->getquery("DELETE FROM wh_transfer WHERE wh_order_id='" . $this->request->id . "'");
        $this->db->getquery("DELETE FROM wh_vanreturn WHERE wh_order_id='" . $this->request->id . "'");
        $this->db->getquery("DELETE FROM wh_vanstock WHERE wh_order_id='" . $this->request->id . "'");
        $this->db->getquery("DELETE FROM wh_orders WHERE id='" . $this->request->id . "'");

        $answer["status"] = "WhOrder deleted";
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function deleteWhOrderByWarehouseID($warehouse_id)
    {       
        $this->db->getquery("DELETE FROM wh_orders WHERE warehouse_id='" . $warehouse_id . "'");
        $answer["status"] = "WhOrder by WarehouseID deleted";
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>    
}
