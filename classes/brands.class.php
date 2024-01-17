<?php

namespace classes;

class brands
{

function post()
    {
        unset($this->request->module);
        $this->db->sql("UPDATE brands SET 
            brand=:brand,
            link=:link    
        WHERE id=:id");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->request->form->id;
        return $this->getById();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function put()
    {
        unset($this->request->module);
        $this->db->sql("INSERT INTO brands SET 
            brand=:brand,
            link=:link,
            id=NULL");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->db->getInsertId();
        return $this->getById();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getAll()
    {
        $brands = [];
        $this->db->getquery("SELECT * FROM brands ORDER BY brand ASC");
        while ($brand = $this->db->fetch()) {
            $brands[] = $brand;
        }
        $answer["brands"] = $brands;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getById()
    {
        $brand = [];
        $this->db->getquery("SELECT * FROM brands WHERE id='" . $this->request->id . "'");
        $brand = $this->db->fetch();
        $answer["brand"] = $brand;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    function delete()
    {
        $products = new products();
        $products->db = $this->db;
        $products->deleteProductByBrandID($this->request->id);
        $this->db->getquery("DELETE FROM brands WHERE id='" . $this->request->id . "'");
        $answer["status"] = "delete done";
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>   
}
