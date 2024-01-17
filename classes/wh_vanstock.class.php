<?php

namespace classes;

class wh_vanstock
{
    function post()
    {
        /*
        "form":
            {
               create_by: "john"
                id: 6
                issue_qty: 33
                notes: "334"
                product_id: 39
                status_id: 0
                w_order_id: 43
            }
        */

        unset($this->request->module);
        $this->db->sql("UPDATE wh_vanstock SET         
        wh_order_id=:wh_order_id,
        status_id=:status_id,
        product_id=:product_id,
        issue_qty=:issue_qty,        
        create_by=:create_by,
        notes=:notes
    WHERE id=:id");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->request->form->id;
        return $this->getById();
    }
    function put()
    {
        /*
        "create_by": "john",
"id": null,
"issue_qty": 2,
"notes": "2",
"product_id": 38,
"status_id": 0,
"w_order_id": 41},
        */
        unset($this->request->module);
        $this->db->sql("INSERT INTO wh_vanstock SET 
        id=:id,
        wh_order_id=:wh_order_id,
        status_id=:status_id,
        product_id=:product_id,
        issue_qty=:issue_qty,
        create_date=now(),
        create_by=:create_by,
        notes=:notes
        ");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->db->getInsertId();
        return $this->getById();
    }
    function delete()
    {
        $wh_vanstock = new wh_vanstock();
        $wh_vanstock->db = $this->db;
        $wh_vanstock->deleteByproductID($this->request->id);
        $this->db->getquery("DELETE FROM wh_vanstock WHERE id='" . $this->request->id . "'");
        $answer["status"] = "delete done";
        return json_encode($answer);
    }
    function deleteByWarehouseID($warehouse_id)
    {
        $whorderdetails = new wh_vanstock();
        $whorderdetails->db = $this->db;
        $wh_vanstock = $this->__getAllWhOrdersByBranchId($warehouse_id);
        foreach ($wh_vanstock as $k => $v) {
            $whorderdetails->deleteByWhOrderID($v->id);
        }
        $this->db->getquery("DELETE FROM wh_vanstock WHERE warehouse_id='" . $warehouse_id . "'");
    }


    function getAll()
    {
        $wh_vanstock = [];
        $this->db->getquery("SELECT * FROM wh_vanstock");
        while ($wh_order = $this->db->fetch()) {
            $wh_vanstock[] = $wh_order;
        }
        $answer["wh_vanstock"] = $wh_vanstock;
        return json_encode($answer);
    }
    private function __getWhOrderById($wh_order_id)
    {
        $wh_order = [];
        $this->db->getquery("SELECT * FROM wh_vanstock WHERE id='" . $wh_order_id . "'");
        $wh_order = $this->db->fetch();
        return $wh_order;
    }
    private function __getAllWhOrdersByBranchId($warehouse_id)
    {
        $wh_vanstock = [];
        $this->db->getquery("SELECT * FROM wh_vanstock WHERE warehouse_id='" . $warehouse_id . "'");
        while ($wh_order = $this->db->fetch()) {
            $wh_vanstock[] = $wh_order;
        }
        return $wh_vanstock;
    }
    function getById()
    {
        $wh_vanstock = [];
        $this->db->getquery("SELECT wh_vanstock.* FROM wh_vanstock WHERE wh_vanstock.id='" . $this->request->id . "'");
        $wh_vanstock = $this->db->fetch();
        $answer["wh_vanstock"] = $wh_vanstock;
        return json_encode($answer);
    }
    function getByWHOrderId()
    {
        $wh_vanstock = [];
        $sql_query = "SELECT sr.*,p.product as productname,sr.issue_qty,sr.create_date,
        wh.name as warehouse,
        sr.create_by, sr.notes, orderstatus(sr.issue_qty,0,'vanstock') as `status`,p.partnumber
        FROM wh_vanstock sr 
        LEFT JOIN products p ON p.id = sr.product_id
        LEFT join wh_orders who ON who.id = sr.wh_order_id 
        LEFT JOIN warehouses wh ON wh.id = who.warehouse_id  
        
        WHERE sr.wh_order_id='" . $this->request->wh_order_id . "'";
        // echo ($sql_query);
        $this->db->getquery($sql_query);
        while ($item = $this->db->fetch()) {
            $wh_vanstock[] = $item;
        }
        $answer["wh_vanstock"] = $wh_vanstock;
        return json_encode($answer);
    }
    function deleteByProductID($id)
    {
        $this->db->getquery("DELETE   FROM wh_vanstock WHERE id='" . $id . "'");
    }
}