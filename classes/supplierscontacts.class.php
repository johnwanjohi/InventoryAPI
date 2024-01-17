<?php

namespace classes;

class supplierscontacts
{

function post()
    {
        unset($this->request->module);   
        $this->db->sql("UPDATE supplierscontacts SET 
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
        $this->db->sql("INSERT INTO supplierscontacts SET 
            firstname=:firstname,
            lastname=:lastname,
            title=:title,
            workphone=:workphone,
            cellphone=:cellphone,
            email=:email,             
            supplier_id=:supplier_id,
            id=NULL");
        $this->db->update( (array)$this->request->form);
        $this->request->id= $this->db->getInsertId();
        return $this->getById();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getAll()
    {
        $supplierscontacts=[];
        ($this->db->getquery("SELECT supplierscontacts.*,suppliers.name as suppliername FROM supplierscontacts
        left join suppliers on suppliers.id = supplierscontacts.supplier_id ORDER BY id desc"));
        while ($suppliercontact=$this->db->fetch()) {
            $supplierscontacts[]=$suppliercontact;
        }
        $answer["supplierscontacts"]=$supplierscontacts;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getById()
    {
        $suppliercontact=[];
        $this->db->getquery("SELECT supplierscontacts.*,suppliers.name as suppliername FROM supplierscontacts
        left join suppliers on suppliers.id = supplierscontacts.supplier_id
        WHERE supplierscontacts.id='".$this->request->id."'");
        $suppliercontact=$this->db->fetch();
        $answer["suppliercontact"]=$suppliercontact;        
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
function getByForeignId()
    {
        $supplierscontacts = [];        
        $this->db->getquery("SELECT supplierscontacts.*,suppliers.name as suppliername FROM supplierscontacts 
        left join suppliers on supplierscontacts.supplier_id = suppliers.id 
        WHERE supplier_id = '" . $this->request->supplier_id . "'");
        while ($suppliercontact = $this->db->fetch()) {
            $supplierscontacts[] = $suppliercontact;
        }
        $answer["supplierscontacts"] = $supplierscontacts;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function delete()
    {
        $this->db->getquery("DELETE  FROM supplierscontacts WHERE id='".$this->request->id."'");
        $answer["status"]="Supplier Contact deleted";
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
   
function deleteContactBySupplierID($supplier_id)
    {
        $this->db->getquery("DELETE   FROM supplierscontacts WHERE supplier_id='".$supplier_id."'");
        $answer["status"] = "Contact by SupplierID deleted";
        return json_encode($answer);
    }   
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 
}

