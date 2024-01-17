<?php

namespace classes;
include_once 'classes/helper.class.php';

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
        return $String;
    }


    function cryptoJsAesDecrypt($passphrase, $jsonString){
        $jsondata = json_decode($jsonString, true);
        $salt = hex2bin($jsondata["s"]);
        $ct = base64_decode($jsondata["ct"]);
        $iv  = hex2bin($jsondata["iv"]);
        $concatedPassphrase = $passphrase.$salt;
        $md5 = array();
        $md5[0] = md5($concatedPassphrase, true);
        $result = $md5[0];
        for ($i = 1; $i < 3; $i++) {
            $md5[$i] = md5($md5[$i - 1].$concatedPassphrase, true);
            $result .= $md5[$i];
        }
        $key = substr($result, 0, 32);
        $data = openssl_decrypt($ct, 'aes-256-cbc', $key, true, $iv);
        return json_decode($data, true);
    }


function login()
    {
        
        $helper = new Helper;
        $username=$helper->cryptoJsAesDecrypt($this->request->username);
        $password=$helper->cryptoJsAesDecrypt($this->request->password);

        $users = [];
        $token = $this->generateRandomToken();
        $query = "SELECT `id`,`firstname`,`lastname`,`username`,`role`,'$token' as token FROM users where status = 'Active' 
        and username='" . $username . "' and password = '" . $password . "' limit 1;";
        $results = $this->db->getquery($query);
        $i = 0;
        $noOfRows = $this->db->getNumberOfRows();
        if ($noOfRows != 0) {
            while ($user = $this->db->fetch()) {
                $users = $user;
                $users["token"] = $this->generateRandomToken();
                $users["message"] = 'Successiful login';
                $users["loggedin"] = true;
                $i++;
            }
        }
        $answer["users"] = $users;
        $_SESSION['user'] = $users;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function checkIfLoggedIn()
    {
        if (isset($_SESSION['user'])) {
            // $answer = '{"status": true}' ;
            $answer =   $_SESSION['user'];
            // echo json_encode($answer, true);
            return json_encode($answer, true);
        } else {
            $answer = '{"status": false}';
            return json_decode(json_encode($answer), true);
        }
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function logout()
    {
        unset($_SESSION);
        session_destroy();
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

function getById()
    {
        $user = [];
        $this->db->getquery("SELECT * FROM users WHERE d='" . $this->request->id . "'");
        $user = $this->db->fetch();
        $answer["user"] = $user;
        return json_encode($answer);
    }
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
}
