<?php

namespace classes;

class cctv_servers {

    function post(){
        unset($this->request->module);
   
        $this->db->sql("UPDATE cctv_servers SET 
            site_id=:site_id,
            brand_id=:brand_id,
            type=:type,
            name=:name,
            model=:model,
            serial_number=:serial_number,
            service_tag=:service_tag,
            nic1_mac:=nic1_mac,
            nic1_ip:=nic1_ip,
            nic1_port:=nic1_port,
            nic2_mac:=nic2_mac,
            nic2_ip:=nic2_ip,
            nic2_port:=nic2_port,
            remote_ip:=remote_ip,
            os_version:=os_version,
            os_login:=os_login,
            os_password:=os_password,
            server_version:=server_version,
            server_login:=server_login,
            server_password:=server_password,
            location:=location,
            notes:=notes
        WHERE id=:id");
        $this->db->update( (array)$this->request->form);
        $this->request->id=$this->request->form->id;
        return $this->getById();
    }
    function put(){
        unset($this->request->module);
   
        $this->db->sql("INSERT INTO cctv_servers SET 
             site_id=:site_id,
            brand_id=:brand_id,
            type=:type,
            name=:name,
            model=:model,
            serial_number=:serial_number,
            service_tag=:service_tag,
            nic1_mac:=nic1_mac,
            nic1_ip:=nic1_ip,
            nic1_port:=nic1_port,
            nic2_mac:=nic2_mac,
            nic2_ip:=nic2_ip,
            nic2_port:=nic2_port,
            remote_ip:=remote_ip,
            os_version:=os_version,
            os_login:=os_login,
            os_password:=os_password,
            server_version:=server_version,
            server_login:=server_login,
            server_password:=server_password,
            location:=location,
            notes:=notes,
            id=NULL");
        $this->db->update( (array)$this->request->form);
        $this->request->id= $this->db->getInsertId();
        return $this->getById();
    }

    function delete(){
        $this->db->getquery("DELETE  FROM cctv_servers WHERE id='".$this->request->id."'");
        $answer["status"]="delete done";
        return json_encode($answer);
    }

    function deleteBySiteID($site_id){
        $this->db->getquery("DELETE FROM cctv_servers WHERE site_id='".$site_id."'");
    } 

    function getAll(){
        $cctvservers=[];
        $this->db->getquery("SELECT cctv_servers.*,brands.brand FROM cctv_servers left join brands ON brands.id = cctv_servers.brand_id");
        while ($cctvserver=$this->db->fetch()) {
            $cctvservers[]=$cctvserver;
           
        }
        $answer["cctvservers"]=$cctvservers;
        return json_encode($answer);
    }

    function getById(){
        ini_set('error_reporting', 0);
        $cctvserver=[];
        
        $strBrand = property_exists( $this->request , "brand_id" ) ? (intval( $this->request->brand_id) !== 0 ? " OR brand_id='".$this->request->brand_id."' " : " ") : '';
        $query = "SELECT cctv_servers.*,brands.brand FROM cctv_servers 
        left join brands ON brands.id = cctv_servers.brand_id  WHERE cctv_servers.id='".$this->request->id."' $strBrand";
        $this->db->getquery($query);       
        while ($type=$this->db->fetch()) {
            $cctvservers[]=$cctvserver; 
        }
        $answer["cctvservers"]=$cctvservers;
        return json_encode($answer);
    }
}

