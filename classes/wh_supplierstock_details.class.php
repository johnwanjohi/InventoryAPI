<?php

namespace classes;

class wh_supplierstock_details
{

    function post()
    {

        unset($this->request->module);

        $this->db->sql("UPDATE wh_supplierstock_details SET 
            w_order_id=:w_order_id,
            status_id=:status_id,
            product_id=:product_id,
            ordered_qty=:ordered_qty,
            received_qty=:received_qty,
            supplier_id=:supplier_id,
            supplier_order_number=:supplier_order_number,
            create_date=now(),
            create_by=:create_by,            
            modify_date=now(),
            modify_by=:modify_by,
            notes=:notes
        WHERE id=:id");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->request->form->id;
        return $this->getById();
    }
    function put()
    {
        unset($this->request->module);
        $this->db->sql("INSERT INTO wh_supplierstock_details SET 
            w_order_id=:w_order_id,
            status_id=:status_id,
            product_id=:product_id,
            ordered_qty=:ordered_qty,
            received_qty=:received_qty,
            supplier_id=:supplier_id,
            supplier_order_number=:supplier_order_number,
            create_date=now(),
            create_by=:create_by,            
            modify_date=now(),
            modify_by=:modify_by,
            notes=:notes,
            id=:id");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->db->getInsertId();
        return $this->getById();
    }
    function delete()
    {
        $wh_supplierstock_details = new wh_supplierstock_details();
        $wh_supplierstock_details->db = $this->db;
        $wh_supplierstock_details->deleteByproductID($this->request->id);
        $this->db->getquery("DELETE FROM wh_supplierstock_details WHERE id='" . $this->request->id . "'");
        $answer["status"] = "delete done";
        return json_encode($answer);
    }

    function getAll()
    {
        $wh_supplierstock_details = [];
        $this->db->getquery("SELECT wh_supplierstock_details.*,orderstatus(wh_supplierstock_details.ordered_qty,wh_supplierstock_details.received_qty) as `status` 
        FROM wh_supplierstock_details;");
        while ($product = $this->db->fetch()) {
            $wh_supplierstock_details[] = $product;
        }
        $answer["wh_supplierstock_details"] = $wh_supplierstock_details;
        return json_encode($answer);
    }
    function getById()
    {
        $product = [];
        $this->db->getquery("SELECT wh_supplierstock_details.*,orderstatus(wh_supplierstock_details.ordered_qty,wh_supplierstock_details.received_qty) as `status` 
        FROM wh_supplierstock_details WHERE wh_supplierstock_details.id='" . $this->request->id . "'");
        $product = $this->db->fetch();
        $answer["wh_supplierstock_details"] = $product;
        return json_encode($answer);
    }
    function getByWHOrderId()
    {
        $wh_supplierstock_details = [];
        $this->db->getquery("SELECT s.*,p.product as productname,
        s.ordered_qty,s.ordered_qty as orderedqty,wh.name as warehouse,
        s.supplier_order_number as supplierorderno, sup.name as supplier,orderstatus(s.ordered_qty,s.received_qty) as `status`
        FROM wh_supplierstock_details s 
        LEFT JOIN products p ON p.id = s.product_id
        LEFT join wh_orders who ON who.id = s.w_order_id 
        LEFT JOIN warehouses wh ON wh.id = who.wh_id 
        LEFT JOIN suppliers sup ON sup.id = s.supplier_id   
        WHERE s.w_order_id='" . $this->request->w_order_id . "'");
        while ($item = $this->db->fetch()) {
            $wh_supplierstock_details[] = $item;
        }
        $answer["wh_supplierstock_details"] = $wh_supplierstock_details;
        return json_encode($answer);
    }
    function getTotalsReceivedId()
    {
        $wh_supplierstock_details = [];
        $this->db->getquery("SELECT max(s.id) as id, s.ordered_qty,p.product as productname,
        s.ordered_qty,SUM(s.received_qty) as total_received_qty,wh.name as warehouse,
        s.supplier_order_number as supplierorderno, sup.name as supplier
        FROM wh_supplierstock_details s 
        LEFT JOIN products p ON p.id = s.product_id
        LEFT join wh_orders who ON who.id = s.w_order_id 
        LEFT JOIN warehouses wh ON wh.id = who.wh_id 
        LEFT JOIN suppliers sup ON sup.id = s.supplier_id   
        WHERE s.w_order_id='" . $this->request->form->w_order_id . "' 
        AND s.product_id='" . $this->request->form->product_id . "'   
        AND s.supplier_id='" . $this->request->form->supplier_id . "' 
        AND s.supplier_order_number='" . $this->request->form->supplier_order_number . "'  
        GROUP BY s.product_id , s.w_order_id, s.supplier_id,s.supplier_order_number
        ORDER BY s.id desc
        ;
        ");
        while ($item = $this->db->fetch()) {
            $wh_supplierstock_details[] = $item;
        }
        $answer["wh_supplierstock_details"] = $wh_supplierstock_details;
        return json_encode($answer);
    }
    function getByForeignIds()
    {
        $wh_supplierstock_details = [];
        $firstAnd = ($this->request->brand_id != '0') ? " AND " : " ";
        $lastAnd = ($this->request->category_id != '0' or $this->request->brand_id != '0') ? " AND " : " ";
        $searchParams = ($this->request->brand_id == '0' ? " " : " wh_supplierstock_details.brand_id ='" . $this->request->brand_id . "' ")
            . ($this->request->category_id == '0' ? " " : " $firstAnd wh_supplierstock_details.category_id ='" . $this->request->category_id . "' ")
            . ($this->request->type_id === '0'  ?  " " : " $lastAnd wh_supplierstock_details.type_id ='" . $this->request->type_id . "'");

        $searchParams = trim($searchParams) !== '' ? " and ( $searchParams)" : "";
        $query = "SELECT wh_supplierstock_details.*,brands.brand,categories.category,types.`type` FROM wh_supplierstock_details 
        left join brands on brands.id = wh_supplierstock_details.brand_id
        left join categories on categories.id = wh_supplierstock_details.category_id 
        left join types on types.id = wh_supplierstock_details.type_id WHERE 1=1  
        $searchParams;";
        // echo $this->request->category_id ;
        // die($query);
        $this->db->getquery("$query");
        while ($product = $this->db->fetch()) {
            $wh_supplierstock_details[] = $product;
        }
        $answer["wh_supplierstock_details"] = $wh_supplierstock_details;
        return json_encode($answer);
    }
    function deleteByProductID($id)
    {
        $this->db->getquery("DELETE   FROM wh_supplierstock_details WHERE id='" . $id . "'");
    }
    function deleteByBrandID($brand_id)
    {
        $this->db->getquery("DELETE FROM wh_supplierstock_details WHERE brand_id='" . $brand_id . "'");
    }
    function deleteByCategoryID($category_id)
    {
        $this->db->getquery("DELETE   FROM wh_supplierstock_details WHERE category_id='" . $category_id . "'");
    }

    function deleteByTypeID($type_id)
    {
        $this->db->getquery("DELETE   FROM wh_supplierstock_details WHERE type_id='" . $type_id . "'");
    }
}
