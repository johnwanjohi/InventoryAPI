<?php

namespace classes;

class customers
{
    
function post()
    {
        unset($this->request->module);
        $this->db->sql("UPDATE customers SET 
            name=:name,
            street=:street,
            city=:city,
            state=UPPER(:state),           
            postal=:postal
        WHERE id=:id");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->request->form->id;
        return $this->getById();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function put()
    {
        unset($this->request->module);
        $this->db->sql("INSERT INTO customers SET 
            name=:name,
            street=:street,
            city=:city,
            state=UPPER(:state),        
            postal=:postal,
            id=NULL");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->db->getInsertId();
        return $this->getById();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
function getAll()
    {
        $customers = [];
        $this->db->getquery("SELECT * FROM customers ORDER BY id desc;");
        while ($customer = $this->db->fetch()) {
            $customers[] = $customer;
        }
        $answer["customers"] = $customers;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
function getById()
    {
        $customer = [];
        $this->db->getquery("SELECT * FROM customers WHERE id='" . $this->request->id . "'");
        $customer = $this->db->fetch();
        $answer["customer"] = $customer;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
function delete()
    {
        $contacts = new contacts();
        $contacts->db = $this->db;
        $contacts->deleteContactByCustomerID($this->request->id);
        $sites = new sites();
        $sites->db = $this->db;
        $sites->deleteSiteByCustomerID($this->request->id);        
        $this->db->getquery("DELETE FROM customers WHERE id='" . $this->request->id . "'");
        $answer["status"] = "Customer deleted";
        return json_encode($answer);
    } 
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  
}
