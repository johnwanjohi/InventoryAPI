<?php

namespace classes;

class stocks
{

    function post()
    {

        unset($this->request->module);

        $this->db->sql("UPDATE stocks SET 
            warehouse_id=:warehouse_id,
            product_id=:product_id,
            total=:total,
            available=:available,
            reserved=:reserved
        WHERE id=:id");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->request->form->id;
        return $this->getById();
    }
    function put()
    {
        unset($this->request->module);
        $this->db->sql("INSERT INTO stocks SET 
            warehouse_id=:warehouse_id,
            product_id=:product_id,
            total=:total,
            available=:available,
            reserved=:reserved,
            id=NULL");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->db->getInsertId();
        return $this->getById();
    }
    function delete()
    {
        $stocks = new stocks();
        $stocks->db = $this->db;
        $stocks->deleteByproductID($this->request->product_id);
        $this->db->getquery("DELETE FROM stocks WHERE product_id='" . $this->request->product_id . "'");
        $answer["status"] = "delete done";
        return json_encode($answer);
    }

    function getAll()
    {
        $stocks = [];
        $this->db->getquery("SELECT stocks.*,brands.brand,categories.category,types.`type` FROM stocks 
        left join brands on brands.id = stocks.brand_id
        left join categories on categories.id = stocks.category_id 
        left join types on types.id = stocks.type_id ");
        while ($product = $this->db->fetch()) {
            $stocks[] = $product;
        }
        $answer["stocks"] = $stocks;
        return json_encode($answer);
    }
    function getById()
    {
        $stock = [];
        $this->db->getquery("SELECT stocks.*,products.product,categories.category,types.`type` FROM stocks 
        left join products on products.id = stocks.product_id
        left join categories on categories.id = products.category_id 
        left join types on types.id = products.type_id WHERE stocks.id='" . $this->request->id . "'");
        $stock = $this->db->fetch();
        $answer["stock"] = $stock;
        return json_encode($answer);
    }

    function deleteByProductID($product_id)
    {
        $this->db->getquery("DELETE FROM stocks WHERE product_id='" . $product_id . "'");
    }
    function deleteByWarehouseID($warehouse_id)
    {
        $this->db->getquery("DELETE FROM stocks WHERE warehouse_id='" . $warehouse_id . "'");
    }
}
