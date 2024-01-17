<?php

namespace classes;

class system_types
{

function post(){      
        unset($this->request->module);   
        $this->db->sql("UPDATE system_types SET
            system_type=:system_type
        WHERE id=:id");
        $this->db->update( (array)$this->request->form);
        $this->request->id=$this->request->form->id;
        return $this->getById();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function put(){
        unset($this->request->module);   
        $this->db->sql("INSERT INTO system_types SET 
            system_type=:system_type,
            id=NULL");
        $this->db->update( (array)$this->request->form);
        $this->request->id= $this->db->getInsertId();
        return $this->getById();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


function getAll(){
        $system_types=[];
        $this->db->getquery("SELECT system_types.* FROM system_types;");
        while ($system_type=$this->db->fetch()) {
            $system_types[]=$system_type;      
        }
        $answer["system_types"]=$system_types;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getById(){
        ini_set('error_reporting', 0);
        $system_type=[];
        $query = "SELECT system_types.* FROM system_types WHERE system_types.id='".$this->request->id."'";
        $this->db->getquery($query);
        while ($system_type=$this->db->fetch()) {
            $system_types[]=$system_type;   
        }
        $answer["system_types"]=$system_types;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function delete(){        
        $this->db->getquery("DELETE FROM system_types WHERE id='".$this->request->id."'");
        $answer["status"]="delete done";
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
}