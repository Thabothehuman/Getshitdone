<?php

    $database= new mysqli("localhost","root","","wow");
    if ($database->connect_error){
        die("Connection failed:  ".$database->connect_error);
    }

?>