<?php

namespace classes;

class suppliers
{

function post()
    {
        unset($this->request->module);   
        $this->db->sql("UPDATE suppliers SET 
            name=:name,
            city=:city,
            street=:street,
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
        $this->db->sql("INSERT INTO suppliers SET 
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
        $suppliers=[];
        $this->db->getquery("SELECT * FROM suppliers ORDER BY id desc;");
        while ($supplier=$this->db->fetch()) {
            $suppliers[]=$supplier;           
        }
        $answer["suppliers"]=$suppliers;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getById()
    {
        $supplier=[];
        $this->db->getquery("SELECT * FROM suppliers WHERE id='".$this->request->id."'");
        $supplier=$this->db->fetch();
        $answer["supplier"]=$supplier;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function delete()
    {
        $supplierscontacts= new supplierscontacts();
        $supplierscontacts->db=$this->db;
        $supplierscontacts->deleteContactBySupplierID($this->request->id);
        $this->db->getquery("DELETE FROM suppliers WHERE id='".$this->request->id."'");
        $answer["status"]="Supplier deleted";
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 
}