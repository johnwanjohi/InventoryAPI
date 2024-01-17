<?php

namespace classes;

class statuses
{

    function post(){      
        unset($this->request->module);   
        $this->db->sql("UPDATE statuses SET
            status=:status
        WHERE id=:id");
        $this->db->update( (array)$this->request->form);
        $this->request->id=$this->request->form->id;
        return $this->getById();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function put(){
        unset($this->request->module);   
        $this->db->sql("INSERT INTO statuses SET 
            status=:status,
            id=NULL");
        $this->db->update( (array)$this->request->form);
        $this->request->id= $this->db->getInsertId();
        return $this->getById();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getAll(){
        $statuses=[];
        $this->db->getquery("SELECT statuses.* FROM statuses;");
        while ($status=$this->db->fetch()) {
            $statuses[]=$status;      
        }
        $answer["statuses"]=$statuses;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getById(){
        ini_set('error_reporting', 0);
        $status=[];
        $query = "SELECT statuses.* FROM statuses WHERE statuses.id='".$this->request->id."'";
        $this->db->getquery($query);
        while ($status=$this->db->fetch()) {
            $statuses[]=$status;   
        }
        $answer["statuses"]=$statuses;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function delete(){        
        $this->db->getquery("DELETE FROM statuses WHERE id='".$this->request->id."'");
        $answer["status"]="delete done";
        return json_encode($answer);
    }
}