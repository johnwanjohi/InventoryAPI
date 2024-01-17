<?php

namespace classes;

class subscontacts
{

function post()
    {
        unset($this->request->module);   
        $this->db->sql("UPDATE subscontacts SET 
            firstname=:firstname,
            lastname=:lastname,
            title=:title,
            workphone=:workphone,
            cellphone=:cellphone,
            email=:email
        WHERE id=:id");
        $this->db->update( (array)$this->request->form);
        $this->request->id=$this->request->form->id;
        return $this->getById();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
function put()
    {
        unset($this->request->module);   
        $this->db->sql("INSERT INTO subscontacts SET 
            firstname=:firstname,
            lastname=:lastname,
            title=:title,
            workphone=:workphone,
            cellphone=:cellphone,
            email=:email,             
            sub_id=:sub_id,
            id=NULL");
        $this->db->update( (array)$this->request->form);
        $this->request->id= $this->db->getInsertId();
        return $this->getById();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getAll()
    {
        $subscontacts=[];
        ($this->db->getquery("SELECT subscontacts.*,subs.name as subname FROM subscontacts
        left join subs on subs.id = subscontacts.sub_id ORDER BY id desc"));
        while ($subcontact=$this->db->fetch()) {
            $subscontacts[]=$subcontact;
        }
        $answer["subscontacts"]=$subscontacts;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
function getById()
    {
        $subcontact=[];
        $this->db->getquery("SELECT subscontacts.*,subs.name as subname FROM subscontacts
        left join subs on subs.id = subscontacts.sub_id
        WHERE subscontacts.id = '" . $this->request->id . "'");
        $subcontact=$this->db->fetch();
        $answer["subcontact"]=$subcontact;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
function getByForeignId()
    {
        $subscontacts = [];        
        $this->db->getquery("SELECT subscontacts.*,subs.name as subname FROM subscontacts 
        left join subs on subscontacts.sub_id = subs.id 
        WHERE sub_id = '" . $this->request->sub_id . "'");
        while ($subcontact = $this->db->fetch()) {
            $subscontacts[] = $subcontact;
        }
        $answer["subscontacts"] = $subscontacts;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
function delete()
    {
        $this->db->getquery("DELETE FROM subscontacts WHERE id='" . $this->request->id."'");
        $answer["status"]="Sub Contact deleted";
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function deleteContactBySubID($sub_id)
    {
        $this->db->getquery("DELETE FROM subscontacts WHERE sub_id='" . $sub_id."'");
        $answer["status"] = "Contact by SubID deleted";
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
}

