<?php

namespace classes;

class warehouses
{

function post()
    {
        unset($this->request->module);
        $this->db->sql("UPDATE warehouses SET 
            name=:name,
            street=:street,
            city=:city,
            state=UPPER(:state),           
            postal=:postal
        WHERE id=:id");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->request->form->id;
        return $this->getById();
    }
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
function put()
    {
        unset($this->request->module);
        $this->db->sql("INSERT INTO warehouses SET 
            name=:name,
            street=:street,
            city=:city,
            state=UPPER(:state),        
            postal=:postal,
            id=NULL");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->db->getInsertId();
        return $this->getById();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getAll()
    {
        $warehouses = [];
        $this->db->getquery("SELECT *,
        (select count(id) from wh_transfer inc where inc.new_wh_id = warehouses.id  ) 
            as incomingorders
       FROM warehouses ORDER BY warehouses.id desc");
        while ($warehouse = $this->db->fetch()) {
            $warehouses[] = $warehouse;
        }
        $answer["warehouses"] = $warehouses;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getById()
    {
        $warehouse = [];
        $this->db->getquery("SELECT *,(select count(id) from wh_transfer inc where inc.new_wh_id = warehouses.id  ) 
            as incomingorders FROM warehouses WHERE id='" . $this->request->id . "'");
        $warehouse = $this->db->fetch();        
        $answer["warehouse"] = $warehouse;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
function delete()
    {
        $wh_orders = new wh_orders();
        $wh_orders->db = $this->db;
        $wh_orders->deleteWhOrderByWarehouseID($this->request->id);
        $stocks = new stocks();
        $stocks->db = $this->db;
        $stocks->deleteStockByWarehouseID($this->request->id);
        $this->db->getquery("DELETE   FROM warehouses WHERE id='" . $this->request->id . "'");
        $answer["status"] = "Warehouse deleted";
        return json_encode($answer);
    }       
}
