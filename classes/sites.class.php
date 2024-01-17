<?php

namespace classes;

class sites
{

function post()
    {
        unset($this->request->module);
        $this->db->sql("UPDATE sites SET 
            name=:name,
            state=Upper(:state),
            city=:city,
            street=:street,
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
        $this->db->sql("INSERT INTO sites SET 
            name=:name,
            state=UPPER(:state),
            city=:city,
            street=:street,
            postal=:postal,
            customer_id=:customer_id,
            id=NULL");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->db->getInsertId();
        return $this->getById();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getAll()
    {
        $sites = [];
        $this->db->getquery("SELECT sites.*, customers.name as customername FROM sites 
        left join customers ON sites.customer_id = customers.id  order by sites.id desc");
        while ($site = $this->db->fetch()) {
            $sites[] = $site;
        }
        $answer["sites"] = $sites;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getById()
    {
        $site = $this->__getSiteById($this->request->id);
        $answer["site"] = $site;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

private function __getSiteById($site_id)
    {
        $site = [];
        $this->db->getquery("SELECT sites.*, customers.name as customername FROM sites 
        left join customers ON sites.customer_id = customers.id 
        WHERE sites.id='" . $site_id . "'");
        $site = $this->db->fetch();
        return $site;
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getAllSitesByCustomerId()
    {
        $sites = [];
        $this->db->getquery("SELECT sites.*, customers.name as customername  FROM sites 
        left join customers ON sites.customer_id = `customers`.id
        WHERE customer_id='" . $this->request->customer_id . "' order by sites.id desc;");
        while ($site = $this->db->fetch()) {
            $sites[] = $site;
        }
        $answer["sites"] = $sites;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

private function __getAllSitesByCustomerId($customer_id)
    {
        $sites = [];
        $this->db->getquery("SELECT sites.*, customers.name as customername  FROM sites 
        left join customers ON sites.customer_id = customers.id
        WHERE customer_id='" . $customer_id . "' order by sites.id desc;");
        while ($site = $this->db->fetch()) {
            $sites[] = $site;
        }
        return $sites;
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function delete()
    {
        $contacts = new contacts();
        $contacts->db = $this->db;
        $contacts->deleteContactBySiteID($this->request->id);
        $this->db->getquery("DELETE FROM sites WHERE id='" . $this->request->id . "'");
        $answer["status"] = "Site deleted";
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function deleteSiteByCustomerID($customer_id)
    {        
        $this->db->getquery("DELETE FROM sites WHERE customer_id='" . $customer_id . "'");
        $answer["status"] = "Site by CustomerID deleted";
        return json_encode($answer);
    } 
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 
}
