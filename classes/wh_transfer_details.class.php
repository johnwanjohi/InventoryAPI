<?php

namespace classes;

class wh_transfer_details
{
    function post()
    {
        /*
        "id": 7,
        "new_wh_id": 3,
        "notes": "wwww",
        "product_id": 39,
        "receive_by": "1",
        "receive_date": "2022-04-14",
        "receive_qty": 11,
        "transfer_by": "1",
        "transfer_date": "2022-04-14",
        "transfer_qty": 11,
        "w_order_id": 33
        */

        unset($this->request->module);
        $this->db->sql("UPDATE wh_transfer_details SET         
        w_order_id=:w_order_id,
        status_id=:status_id,
        product_id=:product_id,
        transfer_qty=:transfer_qty,
        receive_qty=:receive_qty,
        new_wh_id=:new_wh_id,
        transfer_date=:transfer_date,
        transfer_by=:transfer_by,
        receive_date=:receive_date,
        receive_by=:receive_by,
        notes=:notes
    WHERE id=:id");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->request->form->id;
        return $this->getById();
    }
    function put()
    {
        /*
        {"id": null,
"new_wh_id": 3,
"notes": "3",
"product_id": 38,
"receive_by": "3",
"receive_date": "2022-04-14",
"receive_qty": 0,
"status_id": 0,
"transfer_by": "3",
"transfer_date": "2022-04-14",
"transfer_qty": 0,
"w_order_id": 33}
        */
        unset($this->request->module);
        $this->db->sql("INSERT INTO wh_transfer_details SET 
        id=:id,
        new_wh_id=:new_wh_id,
        notes=:notes,
        product_id=:product_id,
        receive_by=:receive_by,
        receive_date=:receive_date,
        receive_qty=:receive_qty,
        transfer_by=:transfer_by,
        transfer_date=:transfer_date,
        transfer_qty=:transfer_qty,
        w_order_id=:w_order_id,
        status_id=:status_id
        ");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->db->getInsertId();
        return $this->getById();
    }
    function delete()
    {
        $wh_transfer_details = new wh_transfer_details();
        $wh_transfer_details->db = $this->db;
        $wh_transfer_details->deleteByproductID($this->request->id);
        $this->db->getquery("DELETE FROM wh_transfer_details WHERE id='" . $this->request->id . "'");
        $answer["status"] = "delete done";
        return json_encode($answer);
    }
    function deleteByWarehouseID($customer_id)
    {
        $whorderdetails = new wh_transfer_details();
        $whorderdetails->db = $this->db;
        $wh_transfer_details = $this->__getAllWhOrdersByBranchId($wh_id);
        foreach ($wh_transfer_details as $k => $v) {
            $whorderdetails->deleteByWhOrderID($v->id);
        }
        $this->db->getquery("DELETE FROM wh_transfer_details WHERE wh_id='" . $wh_id . "'");
    }


    function getAll()
    {
        $wh_transfer_details = [];
        $this->db->getquery("SELECT sr.* , who.wh_id
       FROM wh_transfer_details sr 
        LEFT JOIN products p ON p.id = sr.product_id
        LEFT join wh_orders who ON who.id = sr.w_order_id 
        LEFT JOIN warehouses wh ON wh.id = who.wh_id 
        LEFT JOIN warehouses nwh ON nwh.id = sr.new_wh_id");
        while ($wh_order = $this->db->fetch()) {
            $wh_transfer_details[] = $wh_order;
        }
        $answer["wh_transfer_details"] = $wh_transfer_details;
        return json_encode($answer);
    }
    private function __getWhOrderById($wh_order_id)
    {
        $wh_order = [];
        $this->db->getquery("SELECT * FROM wh_transfer_details WHERE id='" . $wh_order_id . "'");
        $wh_order = $this->db->fetch();
        return $wh_order;
    }
    private function __getAllWhOrdersByBranchId($wh_id)
    {
        $wh_transfer_details = [];
        $this->db->getquery("SELECT * FROM wh_transfer_details WHERE wh_id='" . $wh_id . "'");
        while ($wh_order = $this->db->fetch()) {
            $wh_transfer_details[] = $wh_order;
        }
        return $wh_transfer_details;
    }
    function getById()
    {
        $wh_transfer_details = [];
        $this->db->getquery("SELECT wh_transfer_details.* FROM wh_transfer_details WHERE wh_transfer_details.id='" . $this->request->id . "'");
        $wh_transfer_details = $this->db->fetch();
        $answer["wh_transfer_details"] = $wh_transfer_details;
        return json_encode($answer);
    }
    function getByWHOrderId()
    {
        $wh_transfer_details = [];
        $sql_query = "SELECT sr.*,p.product as productname,sr.transfer_by,sr.receive_date,
        sr.transfer_qty,sr.receive_qty as returnedqty,wh.name as warehouse,
        sr.receive_by, sr.notes,nwh.name as newwarehouse,sr.transfer_date, orderstatus(sr.transfer_qty,sr.receive_qty) as `status`,who.wh_id 
        FROM wh_transfer_details sr 
        LEFT JOIN products p ON p.id = sr.product_id
        LEFT join wh_orders who ON who.id = sr.w_order_id 
        LEFT JOIN warehouses wh ON wh.id = who.wh_id 
        LEFT JOIN warehouses nwh ON nwh.id = sr.new_wh_id         
        WHERE sr.w_order_id='" . $this->request->w_order_id . "' order by sr.id desc";
        // echo ($sql_query);
        $this->db->getquery($sql_query);
        while ($item = $this->db->fetch()) {
            $wh_transfer_details[] = $item;
        }
        $answer["wh_transfer_details"] = $wh_transfer_details;
        return json_encode($answer);
    }
    function deleteByProductID($id)
    {
        $this->db->getquery("DELETE   FROM wh_transfer_details WHERE id='" . $id . "'");
    }
}
