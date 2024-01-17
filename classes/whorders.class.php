<?php

namespace classes;

class whorders
{

    function post(){
        unset($this->request->module);
        $this->db->sql("UPDATE wh_orders SET         
            order_type_id=:order_type_id,
            order_status_id=:order_status_id,
            create_date=:create_date,
            create_by=:create_by,
            modify_date=:modify_date,
            modify_by=:modify_by,
            notes=:notes
        WHERE id=:id");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->request->form->id;
        return $this->getById();
    }


    function put(){
        unset($this->request->module);
        $this->db->sql("INSERT INTO 
            wh_orders SET 
            order_type_id=:order_type_id,
            order_status_id=:order_status_id,
            create_date=:create_date,
            create_by=:create_by,
            modify_date=:modify_date,
            modify_by=:modify_by,
            notes=:notes,
            warehouse_id=:warehouse_id,
            id=NULL");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->db->getInsertId();
        return $this->getById();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getAll()
    {
        $wh_orders = [];
        $this->db->getquery("SELECT wh_orders.*, orderstatus_main(id) as `status` FROM wh_orders  ORDER BY wh_orders.id desc;");
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
        $this->db->getquery("SELECT wh_orders.*, orderstatus_main(id) as `status` FROM wh_orders
        WHERE wh_orders.id='" . $wh_order_id . "'");
        $wh_order = $this->db->fetch();
        return $wh_order;
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getAllWhOrdersByWarehouseId()
    {
        $wh_orders = [];
        $this->db->getquery("SELECT wh_orders.*, orderstatus_main(id) as `status` FROM wh_orders
        WHERE warehouse_id='" $this->request->warehouse_id . "' order by wh_orders.id desc;");
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
        $this->db->getquery("SELECT wh_orders.*, orderstatus_main(id) as `status` FROM wh_orders
        WHERE warehouse_id='" . $warehouse_id . "' order by sites.id desc;");
        while ($wh_order = $this->db->fetch()) {
            $wh_orders[] = $wh_order;
        }
        return $wh_orders;
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function delete()
    {
        $whorderdetails = new whorderdetails();
        $whorderdetails->db = $this->db;
        $whorderdetails->deleteByWhOrderID($this->request->id);
        $this->db->getquery("DELETE FROM wh_orders WHERE id='" . $this->request->id . "'");
        $answer["status"] = "delete done";
        return json_encode($answer);
    }
    function deleteByWarehouseID($customer_id)
    {
        $whorderdetails = new whorderdetails();
        $whorderdetails->db = $this->db;
        $wh_orders = $this->__getAllWhOrdersByWarehouseId($warehouse_id);
        foreach ($wh_orders as $k => $v) {
            $whorderdetails->deleteByWhOrderID($v->id);
        }
        $this->db->getquery("DELETE FROM wh_orders WHERE warehouse_id='" . $warehouse_id . "'");
    }
    
}
