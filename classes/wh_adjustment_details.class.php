<?php

namespace classes;

class wh_adjustment_details
{
    function post()
    {
        /* 
          "form":
{"create_by": "john",
"id": 2,
"new_qty": 0,
"old_qty": 113,
"product_id": 39,
"status_id": 0,
"w_order_id": 58}
          
         */

        unset($this->request->module);
        $this->db->sql("UPDATE wh_adjustment_details SET         
        w_order_id=:w_order_id,
        status_id=:status_id,
        product_id=:product_id,
        old_qty=:old_qty,        
        new_qty=:new_qty,
        create_by=:create_by
    WHERE id=:id");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->request->form->id;
        return $this->getById();
    }
    function put()
    {

        unset($this->request->module);
        $this->db->sql("INSERT INTO wh_adjustment_details SET 
        id=:id,
        w_order_id=:w_order_id,
        status_id=:status_id,
        product_id=:product_id,
        old_qty=:old_qty,
        new_qty=:new_qty,
        create_date=now(),
        create_by=:create_by
        ");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->db->getInsertId();
        return $this->getById();
    }
    function delete()
    {
        $wh_adjustment_details = new wh_adjustment_details();
        $wh_adjustment_details->db = $this->db;
        $wh_adjustment_details->deleteByproductID($this->request->id);
        $this->db->getquery("DELETE FROM wh_adjustment_details WHERE id='" . $this->request->id . "'");
        $answer["status"] = "delete done";
        return json_encode($answer);
    }
    function deleteByWarehouseID($customer_id)
    {
        $whorderdetails = new wh_adjustment_details();
        $whorderdetails->db = $this->db;
        $wh_adjustment_details = $this->__getAllWhOrdersByBranchId($wh_id);
        foreach ($wh_adjustment_details as $k => $v) {
            $whorderdetails->deleteByWhOrderID($v->id);
        }
        $this->db->getquery("DELETE FROM wh_adjustment_details WHERE wh_id='" . $wh_id . "'");
    }


    function getAll()
    {
        $wh_adjustment_details = [];
        $this->db->getquery("SELECT * FROM wh_adjustment_details");
        while ($wh_order = $this->db->fetch()) {
            $wh_adjustment_details[] = $wh_order;
        }
        $answer["wh_adjustment_details"] = $wh_adjustment_details;
        return json_encode($answer);
    }
    private function __getWhOrderById($wh_order_id)
    {
        $wh_order = [];
        $this->db->getquery("SELECT * FROM wh_adjustment_details WHERE id='" . $wh_order_id . "'");
        $wh_order = $this->db->fetch();
        return $wh_order;
    }
    private function __getAllWhOrdersByBranchId($wh_id)
    {
        $wh_adjustment_details = [];
        $this->db->getquery("SELECT * FROM wh_adjustment_details WHERE wh_id='" . $wh_id . "'");
        while ($wh_order = $this->db->fetch()) {
            $wh_adjustment_details[] = $wh_order;
        }
        return $wh_adjustment_details;
    }
    function getById()
    {
        $wh_adjustment_details = [];
        $this->db->getquery("SELECT wh_adjustment_details.* FROM wh_adjustment_details WHERE wh_adjustment_details.id='" . $this->request->id . "'");
        $wh_adjustment_details = $this->db->fetch();
        $answer["wh_adjustment_details"] = $wh_adjustment_details;
        return json_encode($answer);
    }
    function getByWHOrderId()
    {
        $wh_adjustment_details = [];
        $sql_query = "SELECT sr.*,p.product as productname,sr.new_qty,sr.create_date,
        wh.name as warehouse,
        sr.create_by, orderstatus(sr.new_qty,0) as `status`
        FROM wh_adjustment_details sr 
        LEFT JOIN products p ON p.id = sr.product_id
        LEFT join wh_orders who ON who.id = sr.w_order_id 
        LEFT JOIN branches wh ON wh.id = who.wh_id  
        WHERE sr.w_order_id='" . $this->request->w_order_id . "'";
        $this->db->getquery($sql_query);
        while ($item = $this->db->fetch()) {
            $wh_adjustment_details[] = $item;
        }
        $answer["wh_adjustment_details"] = $wh_adjustment_details;
        return json_encode($answer);
    }
    function deleteByProductID($id)
    {
        $this->db->getquery("DELETE   FROM wh_adjustment_details WHERE id='" . $id . "'");
    }
}
