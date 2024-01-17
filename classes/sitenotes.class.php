<?php

namespace classes;

class sitenotes {

    function post(){
        unset($this->request->module);   
        $this->db->sql("UPDATE site_notes SET 
            system_id=:system_id,
            site_id=:site_id,
            name=:name,
            note=:note
        WHERE id=:id");
        $this->db->update( (array)$this->request->form);
        $this->request->id=$this->request->form->id;
        return $this->getById();
    }

    function put(){
        unset($this->request->module);   
        $this->db->sql("INSERT INTO site_notes SET 
             site_id=:site_id,
             system_id=:system_id,
             name=:name,
             note=:note 
             id=NULL");
        $this->db->update( (array)$this->request->form);
        $this->request->id= $this->db->getInsertId();
        return $this->getById();
    }

    function delete(){
        $this->db->getquery("DELETE  FROM site_notes WHERE id='".$this->request->id."'");
        $answer["status"]="delete done";
        return json_encode($answer);
    }

    function deleteBySiteID($site_id){
        $this->db->getquery("DELETE FROM site_notes WHERE site_id='".$site_id."'");
    }
    
    function getAll(){
        $sitenotes=[];
        $this->db->getquery("SELECT site_notes.*,site_systems.system FROM site_notes left join site_systems ON system.id = site_notes.system_id");
        while ($sitenote=$this->db->fetch()) {
            $sitenotes[]=$sitenote;
        }
        $answer["site_notes"]=$sitenotes;
        return json_encode($answer);
    }

    function getById(){
        $sitenote=[];
        $strSystem = property_exists( $this->request , "system_id" ) ? (intval( $this->request->system_id) !== 0 ? " OR system_id ='".$this->request->system_id."' " : " ") : '';
        $query = "SELECT site_notes.*,site_systems.system FROM site_notes 
        left join site_systems ON system.id = site_notes.system_id  WHERE site_notes.id='".$this->request->id."' $strSystem";
        
        $this->db->getquery($query);
        $sitenote=$this->db->fetch();
        $answer["sitenote"]=$sitenote;
        return json_encode($answer);
    }
}

