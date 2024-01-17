<?php

namespace classes;

class contacts
{

function post()
    {
        unset($this->request->module);
        $this->db->sql("UPDATE contacts SET 
            firstname=:firstname,
            lastname=:lastname,
            title=:title,
            workphone=:workphone,
            cellphone=:cellphone,
            email=:email,
            site_id=:site_id
        WHERE id=:id");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->request->form->id;
        return $this->getById();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function put()
    {
        unset($this->request->module);
        $this->db->sql("INSERT INTO contacts SET 
            firstname=:firstname,
            lastname=:lastname,
            title=:title,
            workphone=:workphone,
            cellphone=:cellphone,
            email=:email,
            customer_id=:customer_id,
            site_id=:site_id,             
            id=NULL");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->db->getInsertId();
        return $this->getById();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getAll()
    {
        $contacts = [];
        ($this->db->getquery("SELECT contacts.*,sites.name as sitename, customers.name as customername FROM contacts 
        left join sites on sites.id = contacts.site_id 
        left join customers on customers.id = contacts.customer_id ORDER BY id desc"));
        while ($contact = $this->db->fetch()) {
            $contacts[] = $contact;
        }
        $answer["contacts"] = $contacts;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getById()
    {
        $contact = [];
        $this->db->getquery("SELECT contacts.*,sites.name as sitename, customers.name as customername FROM contacts 
        left join sites on sites.id = contacts.site_id 
        left join customers on customers.id = contacts.customer_id   
        WHERE contacts.id='" . $this->request->id . "'");
        $contact = $this->db->fetch();
        $answer["contact"] = $contact;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
function getByForeignIds()
    {
        $contacts = [];
        $firstAnd = ($this->request->customer_id != '0') ? " AND " : " ";
        $lastAnd = ($this->request->site_id != '0' or $this->request->customer_id != '0') ? " AND " : " ";
        $searchParams = ($this->request->customer_id == '0' ? " " : " contacts.customer_id='" . $this->request->customer_id . "' ")
            . ($this->request->site_id == '0' ? " " : " $firstAnd contacts.site_id='" . $this->request->site_id . "' ");
        $searchParams = trim($searchParams) !== '' ? " and ( $searchParams)" : "";
        $query = "SELECT contacts.*,sites.name as sitename, customers.name as customername
        FROM contacts 
        left join sites on sites.id = contacts.site_id 
        left join customers on customers.id = contacts.customer_id 
        WHERE 1=1  
        $searchParams;";
        $this->db->getquery("$query");
        while ($contact = $this->db->fetch()) {
            $contacts[] = $contact;
        }
        $answer["contacts"] = $contacts;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function delete()
    {
        $this->db->getquery("DELETE FROM contacts WHERE id='" . $this->request->id . "'");
        $answer["status"] = "Contact deleted";
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function deleteContactBySiteID($site_id)
    {
        $this->db->getquery("DELETE FROM contacts WHERE site_id='" . $site_id . "'");
        $answer["status"] = "Contact by SiteID deleted";
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function deleteContactByCustomerID($customer_id)
    {
        $this->db->getquery("DELETE FROM contacts WHERE customer_id='" . $customer_id . "'");
        $answer["status"] = "Contact by CustomerID deleted";
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
}
