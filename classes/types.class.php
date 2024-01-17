<?php

namespace classes;

class types
{

function post()
    {
        unset($this->request->module);
        $this->db->sql("UPDATE types SET
            category_id=:category_id, 
            type=:type
        WHERE id=:id");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->request->form->id;
        return $this->getById();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function put()
    {
        unset($this->request->module);        
        $this->db->sql("INSERT INTO types SET 
            category_id=:category_id,
            type=:type,
            id=NULL");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->db->getInsertId();
        return $this->getById();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getAll()
    {
        $types = [];
        $this->db->getquery("SELECT types.*,categories.category as categoryname FROM types
        left join categories ON types.category_id = categories.id order by types.type asc;");
        while ($type = $this->db->fetch()) {
            $types[] = $type;
        }
        $answer["types"] = $types;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getById()
    {
        $type = $this->__getTypeById($this->request->id);
        $answer["type"] = $type;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

private function __getTypeById($type_id)
    {
        $type = [];
        $this->db->getquery("SELECT types.*, categories.category as categoryname FROM types 
        left join categories ON types.category_id = categories.id
        WHERE types.id='" . $type_id . "'");
        $type = $this->db->fetch();
        return $type;
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getAllTypesByCategoryId()
    {
        $types = [];
        $this->db->getquery("SELECT types.*, categories.category as categoryname  FROM types 
        left join categories ON types.category_id = `categories`.id 
        WHERE category_id='" . $this->request->category_id . "' order by types.type asc;");
        while ($type = $this->db->fetch()) {
            $types[] = $type;
        }
        $answer["types"] = $types;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    private function __getAllTypesByCategoryId($category_id)
    {
        $types = [];
        $this->db->getquery("SELECT types.*, categories.category as categoryname  FROM types 
        left join categories ON types.category_id = categories.id
        WHERE category_id='" . $category_id . "'  order by types.type asc;");
        while ($type = $this->db->fetch()) {
            $types[] = $type;
        }
        return $types;
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function delete()
    {
        $products = new products();
        $products->db = $this->db;
        $products->deleteProductByTypeID($this->request->id);
        $this->db->getquery("DELETE FROM types WHERE id='" . $this->request->id . "'");
        $answer["status"] = "Type deleted";
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
function deleteTypeByCategoryID($category_id)
    {
        $this->db->getquery("DELETE FROM types WHERE category_id='" . $category_id . "'");
        $answer["status"] = "Type by CategoryID deleted";
        return json_encode($answer);
    } 
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
}
