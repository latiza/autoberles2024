<?php 
session_start();

if(isset($_SESSION['RenterID'])){
    session_unset();
            session_destroy();
    header("location: ../login.php");
    exit();
}

