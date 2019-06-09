<?php

    session_start();

    function checkSession(){
        if(isset($_SESSION['email'])){
            return true;
        }else{
            return false;
        }
    }

    function removeSession(){
        unset($_SESSION['email']);
    }

?>
