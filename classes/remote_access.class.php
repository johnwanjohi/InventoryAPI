<?php

namespace classes;

class remote_access
{

function post()
    {
        unset($this->request->module);   
        $this->db->sql("UPDATE remote_access SET 
            system_type=:system_type,
            remote_type=:remote_type,
            remote_name=:remote_name,
            remote_id=Upper(:remote_id),
            remote_login=:remote_login,
            remote_password=:remote_password,
            notes=:notes
        WHERE id=:id");
        $this->db->update( (array)$this->request->form);
        $this->request->id=$this->request->form->id;
        return $this->getRemoteAccessByID();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function put()
    {
        unset($this->request->module);   
        $this->db->sql("INSERT INTO remote_access SET 
            site_id=:site_id,
            system_type=:system_type,
            remote_type=:remote_type,
            remote_name=:remote_name,
            remote_id=Upper(:remote_id),
            remote_login=:remote_login,
            remote_password=:remote_password,
            notes=:notes,
            id=:id");
        $this->db->update( (array)$this->request->form);
        $this->request->id= $this->db->getInsertId();
        return $this->getRemoteAccessByID();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getAll()
    {
        $remote_access=[];
        $this->db->getquery("SELECT * FROM remote_access");
        while ($r_access=$this->db->fetch()) {
            $remote_access[]=$r_access;
        
        }
        $answer["remote_access"]=$remote_access;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getRemoteAccessByID()
{
    $r_access=[];
    $this->db->getquery("SELECT *
    FROM remote_access
    WHERE remote_access.id='" . $this->request->id . "'");
    $r_access = $this->db->fetch();   
    $answer["remote_access"]=$r_access;
    return json_encode($answer);
}
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getRemoteAccesssBySiteId()
    {        
        $r_access=[];        
        $this->db->getquery("SELECT remote_access.*
        FROM remote_access
        WHERE remote_access.site_id='".$this->request->site_id."'");             
        while ($r_access=$this->db->fetch()) {
            $remote_access[]=$r_access; 
        }
        $answer["remote_access"]=$remote_access;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getRemoteAccesssBySystemType()
    {        
        $r_access=[];        
        $this->db->getquery("SELECT remote_access.*
        FROM remote_access 
        WHERE remote_access.system_type='".$this->request->system_type."'");             
        while ($r_access=$this->db->fetch()) {
            $remote_access[]=$r_access; 
        }
        $answer["remote_access"]=$remote_access;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getRemoteAccessBySystemTypeAndSiteID()
{        
    $remote_access=[];        
    $this->db->getquery("SELECT remote_access.*
    FROM remote_access 
    WHERE remote_access.system_type='".$this->request->system_type."'
    AND remote_access.site_id='".$this->request->site_id."'" );             
    while ($r_access=$this->db->fetch()) {
        $remote_access[]=$r_access; 
    }
    $answer["remote_access"]=$remote_access;
    return json_encode($answer);
}
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function delete()
    {
        $this->db->getquery("DELETE  FROM remote_access WHERE id='".$this->request->id."'");
        $answer["status"]="REmote Access record deleted";
        return json_encode($answer);
    }   
}

