<?php

namespace classes;

class branches
{


    function post()
    {
        unset($this->request->module);

        $this->db->sql("UPDATE branches SET 
        name=:name,
        state=:state,
        city=:city,
        street=:street,
        postal=:postal
    WHERE id=:id");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->request->form->id;
        return $this->getById();
    }
    function put()
    {
        unset($this->request->module);

        $this->db->sql("INSERT INTO branches SET 
            name=:name,
            state=:state,
            city=:city,
            street=:street,
            postal=:postal,
         id=NULL");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->db->getInsertId();
        return $this->getById();
    }
    function delete()
    {
        $stocks = new stocks();
        $stocks->db = $this->db;
        // $stocks->deleteByBranchID($this->request->id);
        $stocks->deleteByWarehouseID($this->request->id);
        $this->db->getquery("DELETE   FROM branches WHERE id='" . $this->request->id . "'");
        $answer["status"] = "delete done";
        return json_encode($answer);
    }
    function getAll()
    {
        $branches = [];
        $this->db->getquery("SELECT * FROM branches");
        while ($branch = $this->db->fetch()) {
            $branches[] = $branch;
        }
        $answer["branches"] = $branches;
        return json_encode($answer);
    }
    private function __getBranchById($branch_id)
    {
        $branch = [];
        $this->db->getquery("SELECT * FROM branches WHERE id='" . $branch_id . "'");
        $branch = $this->db->fetch();
        return $branch;
    }

    function getById()
    {
        $branch = $this->__getBranchById($this->request->id);
        $answer["branch"] = $branch;
        return json_encode($answer);
    }
}
