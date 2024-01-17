<?php

namespace classes;

class licenses
{

function post()
    {
        unset($this->request->module);   
        $this->db->sql("UPDATE licenses SET 
            system_type=:system_type,           
            brand_id=:brand_id,
            type=:type,
            license=Upper(:license),
            devices_qty=:devices_qty,
            activation_date=:activation_date,
            notes=:notes
        WHERE id=:id");
        $this->db->update( (array)$this->request->form);
        $this->request->id=$this->request->form->id;
        return $this->getLicenseByID();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function put()
    {
        unset($this->request->module);   
        $this->db->sql("INSERT INTO licenses SET 
            site_id=:site_id,
            system_type=:system_type,
            brand_id=:brand_id,
            type=:type,
            license=Upper(:license),
            devices_qty=:devices_qty,
            activation_date=:activation_date,
            notes=:notes,
            id=:id");
        $this->db->update( (array)$this->request->form);
        $this->request->id= $this->db->getInsertId();
        return $this->getLicenseByID();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getAll()
    {
        $licenses=[];
        $this->db->getquery("SELECT licenses.*,
        brands.brand
        FROM licenses 
        LEFT JOIN brands ON brands.id = licenses.brand_id
        LEFT JOIN system_types ON system_types.id = licenses.system_id");
        while ($license=$this->db->fetch()) {
            $license[]=$license;        
        }
        $answer["licenses"]=$licenses;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getLicenseByID()
{
    $license=[];
    $this->db->getquery("SELECT l.*,
    b.brand
    FROM licenses l
    LEFT JOIN brands b ON b.id = l.brand_id
    WHERE l.id='" . $this->request->id . "'");
    $license = $this->db->fetch();   
    $answer["licenses"]=$license;
    return json_encode($answer);
}
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getLicensesBySiteId()
    {        
        $license=[];        
        $this->db->getquery("SELECT licenses.*,
        brands.brand
        FROM licenses 
        LEFT JOIN brands ON brands.id = licenses.brand_id  
        WHERE licenses.site_id='".$this->request->site_id."'");             
        while ($license=$this->db->fetch()) {
            $licenses[]=$license; 
        }
        $answer["licenses"]=$licenses;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getLicensesBySystemType()
    {        
        $license=[];        
        $this->db->getquery("SELECT licenses.*,
        brands.brand
        FROM licenses 
        LEFT JOIN brands ON brands.id = licenses.brand_id  
        WHERE licenses.system_type='".$this->request->system_type."'");             
        while ($license=$this->db->fetch()) {
            $licenses[]=$license; 
        }
        $answer["licenses"]=$licenses;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getLicensesBySystemTypeAndSiteID()
{        
    $licenses=[];        
    $this->db->getquery("SELECT licenses.*,
    brands.brand
    FROM licenses 
    LEFT JOIN brands ON brands.id = licenses.brand_id 
    WHERE licenses.system_type='".$this->request->system_type."'
    AND licenses.site_id='".$this->request->site_id."'" );             
    while ($license=$this->db->fetch()) {
        $licenses[]=$license; 
    }
    $answer["licenses"]=$licenses;
    return json_encode($answer);
}
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function delete()
    {
        $this->db->getquery("DELETE  FROM licenses WHERE id='".$this->request->id."'");
        $answer["status"]="License record deleted";
        return json_encode($answer);
    }   
}

