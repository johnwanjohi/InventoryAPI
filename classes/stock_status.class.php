<?php

namespace classes;

class stock_status
{

function getAll()
    {
        $stock_status = [];
        $this->db->getquery("SELECT stock_status.*  
        FROM stock_status ");
        while ($stock_status = $this->db->fetch()) {
            $stock_status[] = $stock_status;
        }
        $answer["stock_status"] = $stock_status;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getStockByWarehouseId()
    {
        $stock_status = [];
        $this->db->getquery("SELECT ss.*,
        p.partnumber as partnumber
        FROM stock_status ss
        LEFT JOIN products p ON p.id = ss.product_id
        WHERE ss.warehouse_id='" . $this->request->warehouse_id . "'");
        while ($item = $this->db->fetch()) {
            $stock_status[] = $item;
        }
        $answer["stock_status"] = $stock_status;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 

function getStockByWhOrderId()
    {
        $stock_status = [];
        $this->db->getquery("SELECT sst.*,
		who.warehouse_id as wh_id,
        p.partnumber as partnumber
        FROM   wh_orders who, stock_status sst    
        LEFT JOIN products p ON p.id = sst.product_id        
        WHERE sst.warehouse_id= who.warehouse_id and who.id = '" . $this->request->whorder_id . "'");
        while ($item = $this->db->fetch()) {
            $stock_status[] = $item;
        }
        $answer["stock_status"] = $stock_status;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 

// function getStockByWhOrderId()
//     {
//         $answer["stock_status"] = $this->__getStockByWhOrderId($this->request->whorder_id);
//         return json_encode($answer);
//     }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 

private function __getByWHIdAndProductID($product_id, $warehouse_id)
    {
        $stock_status = [];
        $this->db->getquery("SELECT stock_status.*
        FROM stock_status 
        WHERE stock_status.product_id='" . $product_id . "' AND  
        stock_status.warehouse_id='" . $warehouse_id . "'");
        return $this->db->fetch();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getByWHIdAndProductID()
    {
        $answer["stock_status"] = $this->__getByWHIdAndProductID($this->request->product_id, $this->request->warehouse_id);
        return json_encode($answer);
    }
}
