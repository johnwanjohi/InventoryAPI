<?php

namespace classes;

class system_devices
{

function post()
    {
        unset($this->request->module);   
        $this->db->sql("UPDATE system_devices SET 
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
        return $this->getSysDeviceByID();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function put()
    {
        unset($this->request->module);   
        $this->db->sql("INSERT INTO system_devices SET 
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
        return $this->getSysDeviceByID();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getAll()
    {
        $systemdevices=[];
        $this->db->getquery("SELECT system_devices.*,
        brands.brand,
        products.partnumber AS partnumber
        FROM system_devices 
        LEFT JOIN brands ON brands.id = system_devices.brand_id
        LEFT JOIN system_types ON system_types.id = system_devices.system_id
        LEFT JOIN products ON products.id = system_devices.product_id");
        while ($systemdevice=$this->db->fetch()) {
            $systemdevice[]=$systemdevice;
        
        }
        $answer["system_devices"]=$systemdevices;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getSysDeviceByID()
{
    $systemdevice=[];
    $this->db->getquery("SELECT syd.*,
    b.brand,
    p.partnumber AS partnumber
    FROM system_devices syd
    LEFT JOIN brands b ON b.id = syd.brand_id
    LEFT JOIN products p ON p.id = syd.product_id
    WHERE syd.id='" . $this->request->id . "'");
    $systemdevice = $this->db->fetch();   
    $answer["system_devices"]=$systemdevice;
    return json_encode($answer);
}
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getDevicesBySiteId()
    {        
        $systemdevice=[];        
        $this->db->getquery("SELECT system_devices.*,
        brands.brand,
        products.partnumber AS partnumber 
        FROM system_devices 
        LEFT JOIN brands ON brands.id = system_devices.brand_id        
        LEFT JOIN products ON products.id = system_devices.product_id
        WHERE system_devices.site_id='".$this->request->site_id."'");             
        while ($systemdevice=$this->db->fetch()) {
            $systemdevices[]=$systemdevice; 
        }
        $answer["system_devices"]=$systemdevices;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getDevicesBySystemType()
    {        
        $systemdevice=[];        
        $this->db->getquery("SELECT system_devices.*,
        brands.brand,
        products.partnumber AS partnumber
        FROM system_devices 
        LEFT JOIN brands ON brands.id = system_devices.brand_id        
        LEFT JOIN products ON products.id = system_devices.product_id
        WHERE system_devices.system_type='".$this->request->system_type."'");             
        while ($systemdevice=$this->db->fetch()) {
            $systemdevices[]=$systemdevice; 
        }
        $answer["systemdevices"]=$systemdevices;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getDevicesBySystemTypeAndSiteID()
{        
    $systemdevices=[];        
    $this->db->getquery("SELECT system_devices.*,
    brands.brand,
    products.partnumber AS partnumber 
    FROM system_devices 
    LEFT JOIN brands ON brands.id = system_devices.brand_id        
    LEFT JOIN products ON products.id = system_devices.product_id
    WHERE system_devices.system_type='".$this->request->system_type."'
    AND system_devices.site_id='".$this->request->site_id."'" );             
    while ($device=$this->db->fetch()) {
        $systemdevices[]=$device; 
    }
    $answer["system_devices"]=$systemdevices;
    return json_encode($answer);
}

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function delete()
    {
        $this->db->getquery("DELETE  FROM system_devices WHERE id='".$this->request->id."'");
        $answer["status"]="device record deleted";
        return json_encode($answer);
    } 
    
}

