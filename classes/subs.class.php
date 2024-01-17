<?php

namespace classes;

class subs
{
    
function post()
    {      
        unset($this->request->module);   
        $this->db->sql("UPDATE subs SET 
            name=:name,
            street=:street,            
            city=:city,
            state=UPPER(:state),            
            postal=:postal
        WHERE id=:id");
        $this->db->update( (array)$this->request->form);
        $this->request->id=$this->request->form->id;
        return $this->getById();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function put()
    {
        unset($this->request->module);   
        $this->db->sql("INSERT INTO subs SET 
            name=:name,
            street=:street,
            city=:city,
            state=UPPER(:state),                   
            postal=:postal,
            id=NULL");
        $this->db->update( (array)$this->request->form);
        $this->request->id= $this->db->getInsertId();
        return $this->getById();
    }    
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getAll()
    {
        $subs=[];
        $this->db->getquery("SELECT * FROM subs ORDER BY id desc;");
        while ($sub=$this->db->fetch()) {
            $subs[]=$sub;           
        }
        $answer["subs"]=$subs;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
function getById()
    {
        $sub=[];
        $this->db->getquery("SELECT * FROM subs WHERE id='".$this->request->id."'");
        $sub=$this->db->fetch();
        $answer["sub"]=$sub;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
function delete()
    {
        $subscontacts= new subscontacts();
        $subscontacts->db=$this->db;
        $subscontacts->deleteContactBySubID($this->request->id);
        $this->db->getquery("DELETE FROM subs WHERE id='".$this->request->id."'");
        $answer["status"]="Sub deleted";
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
}