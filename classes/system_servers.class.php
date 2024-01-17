<?php

namespace classes;

class system_servers
{

function post()
    {
        unset($this->request->module);   
        $this->db->sql("UPDATE system_servers SET 
            system_type=:system_type,
            brand_id=:brand_id,
            server_type=:server_type,
            name=:name,
            product_id=:product_id,
            serial_number=Upper(:serial_number),
            service_tag=Upper(:service_tag),
            nic0_mac=Upper(:nic0_mac),
            nic0_ip=:nic0_ip,
            nic0_subnet=:nic0_subnet,
            nic0_gateway=:nic0_gateway,
            nic0_port=:nic0_port,
            nic1_mac=Upper(:nic1_mac),
            nic1_ip=:nic1_ip,
            nic1_subnet=:nic1_subnet,
            nic1_gateway=:nic1_gateway,
            nic1_port=:nic1_port,
            nic2_mac=Upper(:nic2_mac),
            nic2_ip=:nic2_ip,
            nic2_subnet=:nic2_subnet,
            nic2_gateway=:nic2_gateway,
            nic2_port=:nic2_port,
            remote_ip=:remote_ip,
            os_version=:os_version,
            os_login=:os_login,
            os_password=:os_password,
            server_version=:server_version,
            server_login=:server_login,
            server_password=:server_password,
            location=:location,
            notes=:notes
        WHERE id=:id");
        $this->db->update( (array)$this->request->form);
        $this->request->id=$this->request->form->id;
        return $this->getSysServerByID();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function put()
    {
        unset($this->request->module);   
        $this->db->sql("INSERT INTO system_servers SET 
            site_id=:site_id,
            system_type=:system_type,
            brand_id=:brand_id,
            server_type=:server_type,
            name=:name,
            product_id=:product_id,
            serial_number=Upper(:serial_number),
            service_tag=Upper(:service_tag),
            nic0_mac=Upper(:nic0_mac),
            nic0_ip=:nic0_ip,
            nic0_subnet=:nic0_subnet,
            nic0_gateway=:nic0_gateway,
            nic0_port=:nic0_port,
            nic1_mac=Upper(:nic1_mac),
            nic1_ip=:nic1_ip,
            nic1_subnet=:nic1_subnet,
            nic1_gateway=:nic1_gateway,
            nic1_port=:nic1_port,
            nic2_mac=Upper(:nic2_mac),
            nic2_ip=:nic2_ip,
            nic2_subnet=:nic2_subnet,
            nic2_gateway=:nic2_gateway,
            nic2_port=:nic2_port,
            remote_ip=:remote_ip,
            os_version=:os_version,
            os_login=:os_login,
            os_password=:os_password,
            server_version=:server_version,
            server_login=:server_login,
            server_password=:server_password,
            location=:location,
            notes=:notes,
            id=:id");
        $this->db->update( (array)$this->request->form);
        $this->request->id= $this->db->getInsertId();
        return $this->getSysServerByID();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getAll()
    {
        $systemservers=[];
        $this->db->getquery("SELECT system_servers.*,
        brands.brand,
        products.partnumber AS partnumber
        FROM system_servers 
        LEFT JOIN brands ON brands.id = system_servers.brand_id
        LEFT JOIN system_types ON system_types.id = system_servers.system_id
        LEFT JOIN products ON products.id = system_servers.product_id");
        while ($systemserver=$this->db->fetch()) {
            $systemserver[]=$systemserver;
        
        }
        $answer["system_servers"]=$systemservers;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getSysServerByID()
{
    $systemserver=[];
    $this->db->getquery("SELECT sys.*,
    b.brand,
    p.partnumber AS partnumber
    FROM system_servers sys
    LEFT JOIN brands b ON b.id = sys.brand_id
    LEFT JOIN products p ON p.id = sys.product_id
    WHERE sys.id='" . $this->request->id . "'");
    $systemserver = $this->db->fetch();   
    $answer["system_servers"]=$systemserver;
    return json_encode($answer);
}
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getServersBySiteId()
    {        
        $systemserver=[];        
        $this->db->getquery("SELECT system_servers.*,
        brands.brand,
        products.partnumber AS partnumber 
        FROM system_servers 
        LEFT JOIN brands ON brands.id = system_servers.brand_id        
        LEFT JOIN products ON products.id = system_servers.product_id
        WHERE system_servers.site_id='".$this->request->site_id."'");             
        while ($server=$this->db->fetch()) {
            $systemserver[]=$server; 
        }
        $answer["system_servers"]=$systemservers;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getServersBySystemType()
    {        
        $systemservers=[];        
        $this->db->getquery("SELECT system_servers.*,
        brands.brand,
        products.partnumber AS partnumber
        FROM system_servers 
        LEFT JOIN brands ON brands.id = system_servers.brand_id        
        LEFT JOIN products ON products.id = system_servers.product_id
        WHERE system_servers.system_type='".$this->request->system_type."'");             
        while ($server=$this->db->fetch()) {
            $systemservers[]=$server; 
        }
        $answer["system_servers"]=$systemservers;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getServersBySystemTypeAndSiteID()
    {        
        $systemservers=[];        
        $this->db->getquery("SELECT system_servers.*,
        brands.brand,
        products.partnumber AS partnumber 
        FROM system_servers 
        LEFT JOIN brands ON brands.id = system_servers.brand_id        
        LEFT JOIN products ON products.id = system_servers.product_id
        WHERE system_servers.system_type='".$this->request->system_type."'
        AND system_servers.site_id='".$this->request->site_id."'" );             
        while ($server=$this->db->fetch()) {
            $systemservers[]=$server; 
        }
        $answer["system_servers"]=$systemservers;
        return json_encode($answer);
    }

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
function delete(){
        $this->db->getquery("DELETE  FROM system_servers WHERE id='".$this->request->id."'");
        $answer["status"]="Server record deleted";
        return json_encode($answer);
    }

    
    
    
}

