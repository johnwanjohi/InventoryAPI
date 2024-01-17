<?php

namespace classes;

class wh_transfer
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
        $this->db->sql("UPDATE wh_transfer SET         
        wh_order_id=:wh_order_id,
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
        $this->db->sql("INSERT INTO wh_transfer SET 
        id=:id,
        new_wh_id=:new_wh_id,
        notes=:notes,
        product_id=:product_id,
        receive_by=:receive_by,
        receive_date=:receive_date,
        receive_qty=:receive_qty,
        status_id=:status_id,
        transfer_by=:transfer_by,
        transfer_date=:transfer_date,
        transfer_qty=:transfer_qty,
        wh_order_id=:wh_order_id
        ");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->db->getInsertId();
        return $this->getById();
    }
    function delete()
    {
        $wh_transfer = new wh_transfer();
        $wh_transfer->db = $this->db;
        $wh_transfer->deleteByproductID($this->request->id);
        $this->db->getquery("DELETE FROM wh_transfer WHERE id='" . $this->request->id . "'");
        $answer["status"] = "delete done";
        return json_encode($answer);
    }
    function deleteByWarehouseID($customer_id)
    {
        $whorderdetails = new wh_transfer();
        $whorderdetails->db = $this->db;
        $wh_transfer = $this->__getAllWhOrdersByBranchId($warehouse_id);
        foreach ($wh_transfer as $k => $v) {
            $whorderdetails->deleteByWhOrderID($v->id);
        }
        $this->db->getquery("DELETE FROM wh_transfer WHERE warehouse_id='" . $warehouse_id . "'");
    }


    function getAll()
    {
        $wh_transfer = [];
        $this->db->getquery("SELECT sr.* , who.warehouse_id
       FROM wh_transfer sr 
        LEFT JOIN products p ON p.id = sr.product_id
        LEFT join wh_orders who ON who.id = sr.wh_order_id 
        LEFT JOIN warehouses wh ON wh.id = who.warehouse_id 
        LEFT JOIN warehouses nwh ON nwh.id = sr.new_wh_id");
        while ($wh_order = $this->db->fetch()) {
            $wh_transfer[] = $wh_order;
        }
        $answer["wh_transfer"] = $wh_transfer;
        return json_encode($answer);
    }
    private function __getWhOrderById($wh_order_id)
    {
        $wh_order = [];
        $this->db->getquery("SELECT * FROM wh_transfer WHERE id='" . $wh_order_id . "'");
        $wh_order = $this->db->fetch();
        return $wh_order;
    }
    private function __getAllWhOrdersByBranchId($warehouse_id)
    {
        $wh_transfer = [];
        $this->db->getquery("SELECT * FROM wh_transfer WHERE warehouse_id='" . $warehouse_id . "'");
        while ($wh_order = $this->db->fetch()) {
            $wh_transfer[] = $wh_order;
        }
        return $wh_transfer;
    }
    function getById()
    {
        $wh_transfer = [];
        $this->db->getquery("SELECT wh_transfer.* FROM wh_transfer WHERE wh_transfer.id='" . $this->request->id . "'");
        $wh_transfer = $this->db->fetch();
        $answer["wh_transfer"] = $wh_transfer;
        return json_encode($answer);
    }
    function getByWHOrderId()
    {
        $wh_transfer = [];
        $sql_query = "SELECT sr.*,p.product as productname,sr.transfer_by,sr.receive_date,
        sr.transfer_qty,sr.receive_qty as returnedqty,wh.name as warehouse,
        sr.receive_by, sr.notes,nwh.name as newwarehouse,sr.transfer_date, 
        orderstatus(sr.transfer_qty,sr.receive_qty,'transfer') as `status`,who.warehouse_id 
        FROM wh_transfer sr 
        LEFT JOIN products p ON p.id = sr.product_id
        LEFT join wh_orders who ON who.id = sr.wh_order_id 
        LEFT JOIN warehouses wh ON wh.id = who.warehouse_id 
        LEFT JOIN warehouses nwh ON nwh.id = sr.new_wh_id         
        WHERE sr.wh_order_id='" . $this->request->w_order_id . "' order by sr.id desc";
        // echo ($sql_query);
        $this->db->getquery($sql_query);
        while ($item = $this->db->fetch()) {
            $wh_transfer[] = $item;
        }
        $answer["wh_transfer"] = $wh_transfer;
        return json_encode($answer);
    }
    function getIncomingByWHId()
    {
        $wh_transfer = [];
        $sql_query = "SELECT sr.*,p.product as productname,sr.transfer_by,sr.receive_date,
        sr.transfer_qty,sr.receive_qty as returnedqty,wh.name as warehouse,
        sr.receive_by, sr.notes,nwh.name as newwarehouse,sr.transfer_date, 
        orderstatus(sr.transfer_qty,sr.receive_qty,'transfer') as `status`,who.warehouse_id 
        FROM wh_transfer sr 
        LEFT JOIN products p ON p.id = sr.product_id
        LEFT join wh_orders who ON who.id = sr.wh_order_id 
        LEFT JOIN warehouses wh ON wh.id = who.warehouse_id 
        LEFT JOIN warehouses nwh ON nwh.id = sr.new_wh_id         
        WHERE nwh.id='" . $this->request->new_wh_id . "' order by sr.id desc";
        // echo ($sql_query);
        $this->db->getquery($sql_query);
        while ($item = $this->db->fetch()) {
            $wh_transfer[] = $item;
        }
        $answer["wh_transfer"] = $wh_transfer;
        return json_encode($answer);
    }
    function deleteByProductID($id)
    {
        $this->db->getquery("DELETE   FROM wh_transfer WHERE id='" . $id . "'");
    }
}
