<?php

namespace classes;

class wh_supplierreturn_details
{

    function post()
    {

        unset($this->request->module);

        $this->db->sql("UPDATE wh_supplierreturn_details SET 
            w_order_id=:w_order_id,
            status_id=:status_id,
            product_id=:product_id,            
            return_qty=:return_qty,
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
        $this->db->sql("INSERT INTO wh_supplierreturn_details SET 
            w_order_id=:w_order_id,
            status_id=:status_id,
            product_id=:product_id,            
            return_qty=:return_qty,
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
        $wh_supplierreturn_details = new wh_supplierreturn_details();
        $wh_supplierreturn_details->db = $this->db;
        $wh_supplierreturn_details->deleteByproductID($this->request->id);
        $this->db->getquery("DELETE FROM wh_supplierreturn_details WHERE id='" . $this->request->id . "'");
        $answer["status"] = "delete done";
        return json_encode($answer);
    }

    function getAll()
    {
        $wh_supplierreturn_details = [];
        $this->db->getquery("SELECT wh_supplierreturn_details.*,orderstatus(`return_qty`,0) as `status` 
        FROM wh_supplierreturn_details;");
        while ($product = $this->db->fetch()) {
            $wh_supplierreturn_details[] = $product;
        }
        $answer["wh_supplierreturn_details"] = $wh_supplierreturn_details;
        return json_encode($answer);
    }
    function getById()
    {
        $product = [];
        $this->db->getquery("SELECT sr.*, orderstatus(`return_qty`,0) as `status`,who.wh_id   
        FROM wh_supplierreturn_details sr 
        LEFT JOIN products p ON p.id = sr.product_id
        LEFT join wh_orders who ON who.id = sr.w_order_id 
        LEFT JOIN warehouses wh ON wh.id = who.wh_id 
        LEFT JOIN suppliers sup ON sup.id = sr.supplier_id 
        WHERE sr.id='" . $this->request->id . "'
        
        ");
        $product = $this->db->fetch();
        $answer["wh_supplierreturn_details"] = $product;
        return json_encode($answer);
    }
    function getByWHOrderId()
    {
        $wh_supplierreturn_details = [];
        $this->db->getquery("SELECT sr.*,p.product as productname,
        sr.return_qty,sr.return_qty as returnedqty,wh.name as warehouse,
        sr.supplier_order_number as supplierorderno, sup.name as supplier,
        orderstatus(`return_qty`,0) as `status` 
        FROM wh_supplierreturn_details sr 
        LEFT JOIN products p ON p.id = sr.product_id
        LEFT join wh_orders who ON who.id = sr.w_order_id 
        LEFT JOIN warehouses wh ON wh.id = who.wh_id 
        LEFT JOIN suppliers sup ON sup.id = sr.supplier_id   
        WHERE sr.w_order_id='" . $this->request->w_order_id . "'");
        while ($item = $this->db->fetch()) {
            $wh_supplierreturn_details[] = $item;
        }
        $answer["wh_supplierreturn_details"] = $wh_supplierreturn_details;
        return json_encode($answer);
    }
    function getTotalsReturnedId()
    {
        $wh_supplierreturn_details = [];
        $this->db->getquery("SELECT s.return_qty,p.product as productname,
        s.return_qty,SUM(s.return_qty) as total_returned_qty,wh.name as warehouse,
        s.supplier_order_number as supplierorderno, sup.name as supplier,orderstatus(`return_qty`,0) as `status` 
        FROM wh_supplierreturn_details s 
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
            $wh_supplierreturn_details[] = $item;
        }
        $answer["wh_supplierreturn_details"] = $wh_supplierreturn_details;
        return json_encode($answer);
    }
    function getByForeignIds()
    {
        $wh_supplierreturn_details = [];
        $firstAnd = ($this->request->brand_id != '0') ? " AND " : " ";
        $lastAnd = ($this->request->category_id != '0' or $this->request->brand_id != '0') ? " AND " : " ";
        $searchParams = ($this->request->brand_id == '0' ? " " : " wh_supplierreturn_details.brand_id ='" . $this->request->brand_id . "' ")
            . ($this->request->category_id == '0' ? " " : " $firstAnd wh_supplierreturn_details.category_id ='" . $this->request->category_id . "' ")
            . ($this->request->type_id === '0'  ?  " " : " $lastAnd wh_supplierreturn_details.type_id ='" . $this->request->type_id . "'");

        $searchParams = trim($searchParams) !== '' ? " and ( $searchParams)" : "";
        $query = "SELECT wh_supplierreturn_details.*,brands.brand,categories.category,types.`type` ,orderstatus(`return_qty`,0) as `status`  FROM wh_supplierreturn_details 
        left join brands on brands.id = wh_supplierreturn_details.brand_id
        left join categories on categories.id = wh_supplierreturn_details.category_id 
        left join types on types.id = wh_supplierreturn_details.type_id WHERE 1=1  
        $searchParams;";
        // echo $this->request->category_id ;
        // die($query);
        $this->db->getquery("$query");
        while ($product = $this->db->fetch()) {
            $wh_supplierreturn_details[] = $product;
        }
        $answer["wh_supplierreturn_details"] = $wh_supplierreturn_details;
        return json_encode($answer);
    }
    function deleteByProductID($id)
    {
        $this->db->getquery("DELETE   FROM wh_supplierreturn_details WHERE id='" . $id . "'");
    }
    function deleteByBrandID($brand_id)
    {
        $this->db->getquery("DELETE FROM wh_supplierreturn_details WHERE brand_id='" . $brand_id . "'");
    }
    function deleteByCategoryID($category_id)
    {
        $this->db->getquery("DELETE   FROM wh_supplierreturn_details WHERE category_id='" . $category_id . "'");
    }

    function deleteByTypeID($type_id)
    {
        $this->db->getquery("DELETE   FROM wh_supplierreturn_details WHERE type_id='" . $type_id . "'");
    }
}
