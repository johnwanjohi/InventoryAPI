<?php

namespace classes;

class users
{

    function generateRandomToken()
    {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $String = '';
        for ($i = 0; $i < 20; ++$i) {
            $String .= $characters[rand(0, $charactersLength - 1)];
        }
        $_SESSION['token'] = $String;
        // echo $String;
        return $String;
    }
    function login()
    {
        print_r("sadsad");
        die;
      //  die('death');
      //  die($_SESSION["user"]);
        $users = [];
        $token = $this->generateRandomToken();
        $this->db->getquery("SELECT * FROM users where status = 'Active' and username='" . $this->request->username . "' and password = '" . $this->request->password . "' limit 1;");
        $i = 0;
        $a=$this->db->fetch();
        print_r($a);
        die;

        while ($user = $this->db->fetch()) {
            $users[$i] = $user;
            $users[$i]["token"] = $this->generateRandomToken();
            $users[$i]["message"] = 'Successiful login';
            $i++;
        }
        $answer["users"] = $users[0];
        $_SESSION['user'] = $users[0];
        // return json_encode($answer);
    }
    function checkIfLoggedIn()
    {
        echo 'kkkkkkkkkkkk';
        echo $_SESSION["user"];
        if (isset($_SESSION["user"])) {
            return json_encode($_SESSION['user']);
        } else {
            return json_encode([]);
        }
    }

    function post()
    {
        unset($this->request->module);
        $this->db->sql("UPDATE users SET 
            firstname=:firstname,
            lastname=:lastname,
            username=:username,
            password=:password,            
            role=:role,
            status=:status
            WHERE id=:id");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->request->form->id;
        return $this->getById();
    }
    function put()
    {
        unset($this->request->module);
        $this->db->sql("INSERT INTO users SET 
            firstname=:firstname,
            lastname=:lastname,
            username=:username,
            password=:password,            
            role=:role,
            status=:status
            id=NULL");
        $this->db->update((array)$this->request->form);
        $this->request->id = $this->db->getInsertId();
        return $this->getById();
    }
    function getAll()
    {
        $users = [];
        $this->db->getquery("SELECT * FROM users");
        while ($user = $this->db->fetch()) {
            $users[] = $user;
        }
        $answer["users"] = $users;
        return json_encode($answer);
    }
    function getById()
    {
        $user = [];
        $this->db->getquery("SELECT * FROM users WHERE d='" . $this->request->id . "'");
        $user = $this->db->fetch();
        $answer["user"] = $user;
        return json_encode($answer);
    }
}
