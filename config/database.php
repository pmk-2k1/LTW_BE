<?php
    session_start();
    define('LOCALHOST','localhost');
    define('DB_USERNAME','root');
    define('DB_PASSWORD','password');
    define('DB_NAME','ltw222');


    $conn = mysqli_connect(LOCALHOST ,DB_USERNAME,DB_PASSWORD);

    $db_select = mysqli_select_db($conn, DB_NAME);
?>