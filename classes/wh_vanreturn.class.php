<?php

namespace classes;

class wh_vanreturn
{
    function post()
    {
        /*
        "form":
            {
               return_by: "john"
                id: 6
                return_qty: 33
                notes: "334"
                product_id: 39
                status_id: 0
                wh_order_id: 43
            }
        */

        unset($this->request->module);
        $this->db->sql("UPDATE wh_vanreturn SET         
        wh_order_id=:wh_order_id,
        status_id=:status_id,
        product_id=:product_id,
        return_qty=:return_qty,        
        return_by=:return_by,
        van=:van,
        notes=:notes
    WHERE id=:id");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->request->form->id;
        return $this->getById();
    }
    function put()
    {
        /*
        'id' => null
        'notes' => string '222' (length=3)
        'product_id' => int 39
        'return_by' => string 'john' (length=4)
        'return_date' => string '' (length=0)
        'return_qty' => int 22
        'status_id' => int 0
        'van' => string '222' (length=3)
        'wh_order_id' => int 0
        */
        unset($this->request->module);
        $this->db->sql("INSERT INTO wh_vanreturn SET 
        id=:id,
        wh_order_id=:wh_order_id,
        status_id=:status_id,
        product_id=:product_id,
        return_qty=:return_qty,
        return_date=now(),
        return_by=:return_by,
        van=:van,
        notes=:notes
        ");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->db->getInsertId();
        return $this->getById();
    }
    function delete()
    {
        $wh_vanreturn = new wh_vanreturn();
        $wh_vanreturn->db = $this->db;
        $wh_vanreturn->deleteByproductID($this->request->id);
        $this->db->getquery("DELETE FROM wh_vanreturn WHERE id='" . $this->request->id . "'");
        $answer["status"] = "delete done";
        return json_encode($answer);
    }
    function deleteByWarehouseID($customer_id)
    {
        $whorderdetails = new wh_vanreturn();
        $whorderdetails->db = $this->db;
        $wh_vanreturn = $this->__getAllWhOrdersByBranchId($warehouse_id);
        foreach ($wh_vanreturn as $k => $v) {
            $whorderdetails->deleteByWhOrderID($v->id);
        }
        $this->db->getquery("DELETE FROM wh_vanreturn WHERE wh_order_id='" . $warehouse_id . "'");
    }


    function getAll()
    {
        $wh_vanreturn = [];
        $this->db->getquery("SELECT * FROM wh_vanreturn");
        while ($wh_order = $this->db->fetch()) {
            $wh_vanreturn[] = $wh_order;
        }
        $answer["wh_vanreturn"] = $wh_vanreturn;
        return json_encode($answer);
    }
    private function __getWhOrderById($wh_order_id)
    {
        $wh_order = [];
        $this->db->getquery("SELECT * FROM wh_vanreturn WHERE id='" . $wh_order_id . "'");
        $wh_order = $this->db->fetch();
        return $wh_order;
    }
    private function __getAllWhOrdersByBranchId($warehouse_id)
    {
        $wh_vanreturn = [];
        $this->db->getquery("SELECT * FROM wh_vanreturn WHERE wh_order_id='" . $warehouse_id . "'");
        while ($wh_order = $this->db->fetch()) {
            $wh_vanreturn[] = $wh_order;
        }
        return $wh_vanreturn;
    }
    function getById()
    {
        $wh_vanreturn = [];
        $this->db->getquery("SELECT wh_vanreturn.* 
FROM wh_vanreturn WHERE wh_vanreturn.id='" . $this->request->id . "'");
        $wh_vanreturn = $this->db->fetch();
        $answer["wh_vanreturn"] = $wh_vanreturn;
        return json_encode($answer);
    }
    function getByWHOrderId()
    {
        $wh_vanreturn = [];
        $sql_query = "SELECT sr.*,p.product as productname,sr.return_qty,sr.return_date,
        wh.name as warehouse,van,
        sr.return_by, sr.notes, orderstatus(sr.return_qty,0,'vanreturn') as `status`,p.partnumber
        FROM wh_vanreturn sr 
        LEFT JOIN products p ON p.id = sr.product_id
        LEFT join wh_orders who ON who.id = sr.wh_order_id 
        LEFT JOIN warehouses wh ON wh.id = who.warehouse_id  
        
        WHERE sr.wh_order_id='" . $this->request->wh_order_id . "'";
        // echo ($sql_query);
        $this->db->getquery($sql_query);
        while ($item = $this->db->fetch()) {
            $wh_vanreturn[] = $item;
        }
        $answer["wh_vanreturn"] = $wh_vanreturn;
        return json_encode($answer);
    }
    function deleteByProductID($id)
    {
        $this->db->getquery("DELETE   FROM wh_vanreturn WHERE id='" . $id . "'");
    }
}
