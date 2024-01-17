<?php

namespace classes;

class categories
{

function post()
    {
        unset($this->request->module);
        $this->db->sql("UPDATE categories SET 
            category=:category
        WHERE id=:id");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->request->form->id;
        return $this->getById();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
function put()
    {
        unset($this->request->module);
        $this->db->sql("INSERT INTO categories SET 
            category=:category, 
            id=NULL");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->db->getInsertId();
        return $this->getById();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getAll()
    {
        $categories = [];
        $this->db->getquery("SELECT * FROM categories ORDER BY category ASC");
        while ($category = $this->db->fetch()) {
            $categories[] = $category;
        }
        $answer["categories"] = $categories;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getById()
    {
        $category = [];
        $this->db->getquery("SELECT * FROM categories WHERE id='" . $this->request->id . "'");
        $category = $this->db->fetch();
        $answer["category"] = $category;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function delete()
    {
        $products = new products();
        $products->db = $this->db;
        $products->deleteProductByCategoryID($this->request->id);
        $types = new types();
        $types->db = $this->db;
        $types->deleteTypeByCategoryID($this->request->id);        
        $this->db->getquery("DELETE FROM categories WHERE id='" . $this->request->id . "'");
        $answer["status"] = "Category deleted";
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>   
}
