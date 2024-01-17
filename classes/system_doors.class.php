<?php

namespace classes;

class system_doors
{

function post()
    {
        unset($this->request->module);   
        $this->db->sql("UPDATE system_doors SET 
            system_type=:system_type,
            brand_id=:brand_id,
            device_type=:device_type,
            name=:name,
            product_id=:product_id,
            serial_number=Upper(:serial_number),
            nic_mac=Upper(:nic_mac),
            nic_ip=:nic_ip,
            nic_subnet=:nic_subnet,
            nic_port=:nic_port,
            nic_gateway=:nic_gateway,
            local_web_port=:local_web_port,
            remote_ip=:remote_ip,
            remote_web_port=:remote_web_port,
            username=:username,
            password=:password,
            firmware_version=Upper(:firmware_version),
            link_name=:link_name,
            link_password=:link_password,
            location=:location,
            notes=:notes
        WHERE id=:id");
        $this->db->update( (array)$this->request->form);
        $this->request->id=$this->request->form->id;
        return $this->getSysDoorByID();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function put()
    {
        unset($this->request->module);   
        $this->db->sql("INSERT INTO system_doors SET 
            site_id=:site_id,
            system_type=:system_type,
            brand_id=:brand_id,
            device_type=:device_type,
            name=:name,
            product_id=:product_id,
            serial_number=Upper(:serial_number),
            nic_mac=Upper(:nic_mac),
            nic_ip=:nic_ip,
            nic_subnet=:nic_subnet,            
            nic_gateway=:nic_gateway,
            nic_port=:nic_port,
            local_web_port=:local_web_port,
            remote_ip=:remote_ip,
            remote_web_port=:remote_web_port,
            username=:username,
            password=:password,
            firmware_version=Upper(:firmware_version),
            link_name=:link_name,
            link_password=:link_password,
            location=:location,
            notes=:notes,
            id=:id");
        $this->db->update( (array)$this->request->form);
        $this->request->id= $this->db->getInsertId();
        return $this->getSysDoorByID();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getAll()
    {
        $systemdoors=[];
        $this->db->getquery("SELECT system_doors.*,
        brands.brand,
        products.partnumber AS partnumber
        FROM system_doors 
        LEFT JOIN brands ON brands.id = system_doors.brand_id
        LEFT JOIN system_types ON system_types.id = system_doors.system_id
        LEFT JOIN products ON products.id = system_doors.product_id");
        while ($systemdoor=$this->db->fetch()) {
            $systemdoor[]=$systemdoor;
        
        }
        $answer["system_doors"]=$systemdoors;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getSysDoorByID()
{
    $systemdoor=[];
    $this->db->getquery("SELECT system_doors.*
    FROM system_doors 
    WHERE system_doors.id='" . $this->request->id . "'");
    $systemdoor = $this->db->fetch();   
    $answer["system_doors"]=$systemdoor;
    return json_encode($answer);
}
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getDoorsBySiteId()
    {        
        $systemdoor=[];        
        $this->db->getquery("SELECT system_doors.*
        FROM system_doors 
        WHERE system_doors.site_id='".$this->request->site_id."'");             
        while ($systemdoor=$this->db->fetch()) {
            $systemdoors[]=$systemdoor; 
        }
        $answer["system_doors"]=$systemdoors;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function delete()
    {
        $this->db->getquery("DELETE  FROM system_doors WHERE id='".$this->request->id."'");
        $answer["status"]="Door record deleted";
        return json_encode($answer);
    } 
    
}

