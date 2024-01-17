<?php

namespace classes;

class wh_adjustment
{

function post()
    {
        unset($this->request->module);
        $this->db->sql("UPDATE wh_adjustment SET  
            status_id=:status_id,
            product_id=:product_id,
            old_qty=:old_qty,        
            new_qty=:new_qty,
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
        $this->db->sql("INSERT INTO wh_adjustment SET 
            wh_order_id=:wh_order_id,
            status_id=:status_id,
            product_id=:product_id,
            old_qty=:old_qty,
            
            new_qty=:new_qty,
            modify_by=:modify_by,
            create_date=now(),
            create_by=:create_by,
            notes=:notes");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->db->getInsertId();
        return $this->getById();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getAll()
    {
        $wh_adjustment = [];
        $this->db->getquery("SELECT wh_adjustment.*,
        orderstatus(`new_qty`,0),'adjustment' as `status` 
        FROM wh_adjustment");
        while ($adjustment = $this->db->fetch()) {
            $wh_adjustment[] = $adjustment;
        }
        $answer["wh_adjustment"] = $wh_adjustment;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getById()
    {
        $wh_adjustment = [];
        $this->db->getquery("SELECT ad.*,
        orderstatus(`new_qty`,0,'adjustment') as `status`,
        who.warehouse_id   
        FROM wh_adjustment ad
        LEFT JOIN products p ON p.id = ad.product_id
        LEFT join wh_orders who ON who.id = ad.wh_order_id 
        LEFT JOIN warehouses wh ON wh.id = who.warehouse_id 
        WHERE ad.id='" . $this->request->id . "'");
        $wh_adjustment = $this->db->fetch();
        $answer["wh_adjustment"] = $wh_adjustment;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getByWHOrderId()
    {
        $wh_adjustment = [];
        $this->db->getquery("SELECT ad.*,
        p.partnumber as partnumber,
        ad.new_qty as new_qty,
        ad.create_date,
        wh.name as warehouse,
        ad.create_by,
        orderstatus(ad.new_qty,0, 'adjustment') as `status`
        FROM wh_adjustment ad 
        LEFT JOIN products p ON p.id = ad.product_id
        LEFT join wh_orders who ON who.id = ad.wh_order_id 
        LEFT JOIN warehouses wh ON wh.id = who.warehouse_id  
        WHERE ad.wh_order_id='" . $this->request->wh_order_id . "'");
        while ($item = $this->db->fetch()) {
            $wh_adjustment[] = $item;
        }
        $answer["wh_adjustment"] = $wh_adjustment;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function delete()
    {        
        $this->db->getquery("DELETE FROM wh_adjustment WHERE id='" . $this->request->id . "'");
        $answer["status"] = "delete done";
        return json_encode($answer);
    }    
}
