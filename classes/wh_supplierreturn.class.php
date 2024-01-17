<?php

namespace classes;

class wh_supplierreturn
{

function post()
    {
        unset($this->request->module);
        $this->db->sql("UPDATE wh_supplierreturn SET 
            status_id=:status_id,
            product_id=:product_id,            
            return_qty=:return_qty,
            supplier_id=:supplier_id,
            supplier_order_number=:supplier_order_number,
            modify_date=now(),
            modify_by=:modify_by,
            notes=:notes
        WHERE id=:id");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->request->form->id;
        return $this->getById();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function put()
    {
        unset($this->request->module);
        $this->db->sql("INSERT INTO wh_supplierreturn SET 
            wh_order_id=:wh_order_id,
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
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getAll()
    {
        $wh_supplierreturn = [];
        $this->db->getquery("SELECT wh_supplierreturn.*,
        orderstatus(`return_qty`,0),'supplierreturn' as `status` 
        FROM wh_supplierreturn;");
        while ($supplierreturn = $this->db->fetch()) {
            $wh_supplierreturn[] = $supplierreturn;
        }
        $answer["wh_supplierreturn"] = $wh_supplierreturn;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getById()
    {
        $supplierreturn = [];
        $this->db->getquery("SELECT sr.*,
        orderstatus(`return_qty`,0,'supplierreturn') as `status`,
        who.warehouse_id   
        FROM wh_supplierreturn sr 
        LEFT JOIN products p ON p.id = sr.product_id
        LEFT join wh_orders who ON who.id = sr.wh_order_id 
        LEFT JOIN warehouses wh ON wh.id = who.warehouse_id 
        LEFT JOIN suppliers sup ON sup.id = sr.supplier_id 
        WHERE sr.id='" . $this->request->id . "'");
        $supplierreturn = $this->db->fetch();
        $answer["wh_supplierreturn"] = $supplierreturn;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
function getByWHOrderId()
    {
        $wh_supplierreturn = [];
        $this->db->getquery("SELECT sr.*,
        p.partnumber as partnumber,
        sr.return_qty as return_qty,
        wh.name as warehouse,
        sr.supplier_order_number as supplier_order_number,
        sup.name as supplier,
        orderstatus(sr.return_qty,0,'supplierreturn') as `status` 
        FROM wh_supplierreturn sr 
        LEFT JOIN products p ON p.id = sr.product_id
        LEFT join wh_orders who ON who.id = sr.wh_order_id 
        LEFT JOIN warehouses wh ON wh.id = who.warehouse_id 
        LEFT JOIN suppliers sup ON sup.id = sr.supplier_id   
        WHERE sr.wh_order_id='" . $this->request->wh_order_id . "'");
        while ($item = $this->db->fetch()) {
            $wh_supplierreturn[] = $item;
        }
        $answer["wh_supplierreturn"] = $wh_supplierreturn;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getTotalsReturnedId()
    {
        $wh_supplierreturn = [];
        $this->db->getquery("SELECT s.return_qty,
        p.product as productname,
        s.return_qty,SUM(s.return_qty) as total_returned_qty,
        wh.name as warehouse,
        s.supplier_order_number as supplier_order_number,
        sup.name as supplier,orderstatus(`return_qty`,0) as `status` 
        FROM wh_supplierreturn s 
        LEFT JOIN products p ON p.id = s.product_id
        LEFT join wh_orders who ON who.id = s.wh_order_id 
        LEFT JOIN warehouses wh ON wh.id = who.warehouse_id 
        LEFT JOIN suppliers sup ON sup.id = s.supplier_id   
        WHERE s.wh_order_id='" . $this->request->form->wh_order_id . "' 
        AND s.product_id='" . $this->request->form->product_id . "'   
        AND s.supplier_id='" . $this->request->form->supplier_id . "' 
        AND s.supplier_order_number='" . $this->request->form->supplier_order_number . "'  
        GROUP BY s.product_id , s.wh_order_id, s.supplier_id,s.supplier_order_number
        ORDER BY s.id desc;");
        while ($item = $this->db->fetch()) {
            $wh_supplierreturn[] = $item;
        }
        $answer["wh_supplierreturn"] = $wh_supplierreturn;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function delete()
    {        
        $this->db->getquery("DELETE FROM wh_supplierreturn WHERE id='" . $this->request->id . "'");
        $answer["status"] = "delete done";
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getByForeignIds()
    {
        $wh_supplierreturn = [];
        $firstAnd = ($this->request->brand_id != '0') ? " AND " : " ";
        $lastAnd = ($this->request->category_id != '0' or $this->request->brand_id != '0') ? " AND " : " ";
        $searchParams = ($this->request->brand_id == '0' ? " " : " wh_supplierreturn.brand_id ='" . $this->request->brand_id . "' ")
            . ($this->request->category_id == '0' ? " " : " $firstAnd wh_supplierreturn.category_id ='" . $this->request->category_id . "' ")
            . ($this->request->type_id === '0'  ?  " " : " $lastAnd wh_supplierreturn.type_id ='" . $this->request->type_id . "'");

        $searchParams = trim($searchParams) !== '' ? " and ( $searchParams)" : "";
        $query = "SELECT wh_supplierreturn.*,brands.brand,categories.category,types.`type` ,orderstatus(`return_qty`,0) as `status`  FROM wh_supplierreturn 
        left join brands on brands.id = wh_supplierreturn.brand_id
        left join categories on categories.id = wh_supplierreturn.category_id 
        left join types on types.id = wh_supplierreturn.type_id WHERE 1=1  
        $searchParams;";
        $this->db->getquery("$query");
        while ($product = $this->db->fetch()) {
            $wh_supplierreturn[] = $product;
        }
        $answer["wh_supplierreturn"] = $wh_supplierreturn;
        return json_encode($answer);
    }
}
