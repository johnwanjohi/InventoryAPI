<?php

namespace classes;

class order_types
{

function post(){      
        unset($this->request->module);   
        $this->db->sql("UPDATE order_types SET
            order_type=:order_type
        WHERE id=:id");
        $this->db->update( (array)$this->request->form);
        $this->request->id=$this->request->form->id;
        return $this->getById();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function put(){
        unset($this->request->module);   
        $this->db->sql("INSERT INTO order_types SET 
            order_type=:order_type,
            id=NULL");
        $this->db->update( (array)$this->request->form);
        $this->request->id= $this->db->getInsertId();
        return $this->getById();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


function getAll(){
        $order_types=[];
        $this->db->getquery("SELECT order_types.* FROM order_types;");
        while ($order_type=$this->db->fetch()) {
            $order_types[]=$order_type;      
        }
        $answer["order_types"]=$order_types;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getById(){
        ini_set('error_reporting', 0);
        $order_type=[];
        $query = "SELECT order_types.* FROM order_types WHERE order_types.id='".$this->request->id."'";
        $this->db->getquery($query);
        while ($order_type=$this->db->fetch()) {
            $order_types[]=$order_type;   
        }
        $answer["order_types"]=$order_types;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function delete(){        
        $this->db->getquery("DELETE FROM order_types WHERE id='".$this->request->id."'");
        $answer["status"]="delete done";
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
}