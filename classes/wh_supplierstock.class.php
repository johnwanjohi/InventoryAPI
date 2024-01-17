<?php

namespace classes;

class wh_supplierstock
{

function post()     // For Edit
    {
        unset($this->request->module);
        $this->db->sql("UPDATE wh_supplierstock SET             
            status_id=:status_id,
            product_id=:product_id,
            ordered_qty=:ordered_qty,
            received_qty=:received_qty,
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

function put()      // For Add
    {
        unset($this->request->module);
        $this->db->sql("INSERT INTO wh_supplierstock SET 
            wh_order_id=:wh_order_id,
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
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getAll()
    {
        $wh_supplierstocks = [];
        $this->db->getquery("SELECT wh_supplierstock.*,
        orderstatus(wh_supplierstock.ordered_qty,wh_supplierstock.received_qty,'supplierstock') as `status` 
        FROM wh_supplierstock;");
        while ($supplierstock = $this->db->fetch()) {
            $wh_supplierstock[] = $supplierstock;
        }
        $answer["wh_supplierstocks"] = $wh_supplierstocks;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getById()
    {
        $supplierstock = [];
        $this->db->getquery("SELECT s.*,
        p.partnumber as partnumber,
        orderstatus(s.ordered_qty,s.received_qty,'supplierstock') as `status` 
        FROM wh_supplierstock s
        LEFT JOIN products p ON p.id = s.product_id
        WHERE s.id='" . $this->request->id . "'");
        $supplierstock = $this->db->fetch();
        $answer["wh_supplierstock"] = $supplierstock;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getByWHOrderId()
    {
        $wh_supplierstock = [];
        $this->db->getquery("SELECT ss.*,
        p.partnumber as partnumber, 
        ss.ordered_qty as ordered_qty,
        wh.name as warehouse,
        ss.supplier_order_number as supplier_order_number,
        sup.name as supplier,
        orderstatus(ss.ordered_qty,ss.received_qty,'supplierstock') as `status`
        FROM wh_supplierstock ss 
        LEFT JOIN products p ON p.id = ss.product_id
        LEFT join wh_orders who ON who.id = ss.wh_order_id 
        LEFT JOIN warehouses wh ON wh.id = who.warehouse_id 
        LEFT JOIN suppliers sup ON sup.id = ss.supplier_id   
        WHERE ss.wh_order_id='" . $this->request->wh_order_id . "'");
        while ($item = $this->db->fetch()) {
            $wh_supplierstock[] = $item;
        }
        $answer["wh_supplierstock"] = $wh_supplierstock;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getTotalsReceivedId()
    {
        $wh_supplierstock = [];
        $this->db->getquery("SELECT max(s.id) as id,
        s.ordered_qty,p.partnumber as partnumber,
        s.ordered_qty,SUM(s.received_qty) as total_received_qty,
        wh.name as warehouse,
        s.supplier_order_number as supplier_order_number,
        sup.name as supplier
        FROM wh_supplierstock s 
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
            $wh_supplierstock[] = $item;
        }
        $answer["wh_supplierstock"] = $wh_supplierstock;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 

function delete()
    {
        $this->db->getquery("DELETE FROM wh_supplierstock WHERE id='" . $this->request->id . "'");
        $answer["status"] = "delete done";
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>    

function getByForeignIds()
    {
        $wh_supplierstock = [];
        $firstAnd = ($this->request->brand_id != '0') ? " AND " : " ";
        $lastAnd = ($this->request->category_id != '0' or $this->request->brand_id != '0') ? " AND " : " ";
        $searchParams = ($this->request->brand_id == '0' ? " " : " wh_supplierstock.brand_id ='" . $this->request->brand_id . "' ")
            . ($this->request->category_id == '0' ? " " : " $firstAnd wh_supplierstock.category_id ='" . $this->request->category_id . "' ")
            . ($this->request->type_id === '0'  ?  " " : " $lastAnd wh_supplierstock.type_id ='" . $this->request->type_id . "'");

        $searchParams = trim($searchParams) !== '' ? " and ( $searchParams)" : "";
        $query = "SELECT wh_supplierstock.*,brands.brand,categories.category,types.type
        FROM wh_supplierstock 
        left join brands on brands.id = wh_supplierstock.brand_id
        left join categories on categories.id = wh_supplierstock.category_id 
        left join types on types.id = wh_supplierstock.type_id
        WHERE 1=1  
        $searchParams;";
        $this->db->getquery("$query");
        while ($product = $this->db->fetch()) {
            $wh_supplierstock[] = $product;
        }
        $answer["wh_supplierstock"] = $wh_supplierstock;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

// function deleteStockByProductID($id)
//     {
//         $this->db->getquery("DELETE   FROM wh_supplierstock WHERE id='" . $id . "'");
//     }

// function deleteStockByBrandID($brand_id)
//     {
//         $this->db->getquery("DELETE FROM wh_supplierstock WHERE brand_id='" . $brand_id . "'");
//     }

// function deleteStockByCategoryID($category_id)
//     {
//         $this->db->getquery("DELETE   FROM wh_supplierstock WHERE category_id='" . $category_id . "'");
//     }

// function deleteStockByTypeID($type_id)
//     {
//         $this->db->getquery("DELETE   FROM wh_supplierstock WHERE type_id='" . $type_id . "'");
//     }
}
