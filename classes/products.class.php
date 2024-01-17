<?php
namespace classes;
include_once 'classes/helper.class.php';
class products 

{

function post()
    {
        unset($this->request->module);
        $this->db->sql("UPDATE products SET 
            product=:product,
            partnumber=Upper(:partnumber),
            description=:description,
            link=:link,
            notes=:notes,
            brand_id=:brand_id,
            category_id=:category_id,
            type_id=:type_id
        WHERE id=:id");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->request->form->id;
        return $this->getById();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
function put()
    {
        unset($this->request->module);
        $this->db->sql("INSERT INTO products SET 
            product=:product,
            partnumber=Upper(:partnumber),
            description=:description,
            link=:link,
            notes=:notes,
            brand_id=:brand_id,
            category_id=:category_id,
            type_id=:type_id,
            id=NULL");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->db->getInsertId();
        return $this->getById();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getAll()
    {
        $products = [];
        $this->db->getquery("SELECT products.*,
        brands.brand,
        categories.category,
        types.type 
        FROM products 
        left join brands on brands.id = products.brand_id
        left join categories on categories.id = products.category_id 
        left join types on types.id = products.type_id order by products.id desc");
        while ($product = $this->db->fetch()) {
            $products[] = $product;
        }
        $helper = new Helper;
        $productsData=$helper->cryptoJsAesEncrypt($products);
        $answer["products"] = $productsData;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getById()
    {
        $product = [];
        $this->db->getquery("SELECT products.*,
        brands.brand,
        categories.category,
        types.type 
        FROM products 
        left join brands on brands.id = products.brand_id
        left join categories on categories.id = products.category_id 
        left join types on types.id = products.type_id
        WHERE products.id='" . $this->request->id . "'");
        $product = $this->db->fetch();
        $answer["product"] = $product;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

/**
* Encrypt value to a cryptojs compatiable json encoding string
*
* @param mixed $passphrase
* @param mixed $value
* @return string
*/

function cryptoJsAesEncrypt($passphrase, $value){
    $salt = openssl_random_pseudo_bytes(8);
    $salted = '';
    $dx = '';
    while (strlen($salted) < 48) {
        $dx = md5($dx.$passphrase.$salt, true);
        $salted .= $dx;
    }
    $key = substr($salted, 0, 32);
    $iv  = substr($salted, 32,16);
    $encrypted_data = openssl_encrypt(json_encode($value), 'aes-256-cbc', $key, true, $iv);
    $data = array("ct" => base64_encode($encrypted_data), "iv" => bin2hex($iv), "s" => bin2hex($salt));
    return json_encode($data);
}

// $date = new DateTime();
// $password = "123456";

// $encrypted = '{"ct":"c7K5geo/dobRl9FOfWLyeA==","iv":"b4453580978ed8f3dd5067ef0c0e66dc","s":"70b0c443af3ec536"}';
// $decrypted = cryptoJsAesDecrypt($password, $encrypted);
// print_r($decrypted);

// // From PHP
// $encrypted = cryptoJsAesEncrypt($password, "value to encrypt PHP");
// echo '<br>'.$encrypted;

    function getSecretKeys(){
        return "#$%^%FDGDFGDFGFD";
    }

    function getByForeignIds()
        {
       
        $products = [];
        $firstAnd = ($this->request->brand_id != '0') ? " AND " : " ";
        $lastAnd = ($this->request->category_id != '0' or $this->request->brand_id != '0') ? " AND " : " ";
        $searchParams = ($this->request->brand_id == '0' ? " " : " products.brand_id='" . $this->request->brand_id . "' ")
            . ($this->request->category_id == '0' ? " " : " $firstAnd products.category_id='" . $this->request->category_id . "' ")
            . ($this->request->type_id === '0'  ?  " " : " $lastAnd products.type_id='" . $this->request->type_id . "'");
        $searchParams = trim($searchParams) !== '' ? " and ( $searchParams)" : "";
        $query = "SELECT products.*,
        brands.brand,
        categories.category,
        types.type
        FROM products 
        left join brands on brands.id = products.brand_id
        left join categories on categories.id = products.category_id 
        left join types on types.id = products.type_id 
        WHERE 1=1  
        $searchParams ORDER BY products.id desc;";
        $this->db->getquery("$query");
        while ($product = $this->db->fetch()) {
            $products[] = $product;
        }
        $helper = new Helper;
        $productsData=$helper->cryptoJsAesEncrypt($products);
        $answer["products"] = $productsData;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function delete()
    {
        $this->db->getquery("DELETE FROM products WHERE id='" . $this->request->id . "'");
        $answer["status"] = "delete done";
        return json_encode($answer);
    }   
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function deleteProductByBrandID($brand_id)
    {
        $this->db->getquery("DELETE FROM products WHERE brand_id='" . $brand_id . "'");
        $answer["status"] = "Product by BrandID deleted";
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function deleteProductByCategoryID($category_id)
    {
        $this->db->getquery("DELETE   FROM products WHERE category_id='" . $category_id . "'");
        $answer["status"] = "Product by CategoryID deleted";
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function deleteProductByTypeID($type_id)
    {
        $this->db->getquery("DELETE   FROM products WHERE type_id='" . $type_id . "'");
        $answer["status"] = "Product by TypeID deleted";
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
}
