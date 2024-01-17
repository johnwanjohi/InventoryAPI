<?php

@session_start();

namespace classes;

class order_types
{
    function isLoggedIn()
    {
        if (isset($_SESSION['user'])) {
            $answer = '{"status": true}';
        } else {
            $answer = '{"status": false}';
        }
        return json_encode($answer);
    }
}
