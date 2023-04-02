<?php
require_once '..\config\database.php';

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: Content-Type');

class API {
    function Test() {
        $db = new Database();
        $sql = "SELECT * FROM customer";
        $data = $db->query($sql);
        // var_dump($data->fetchall(PDO::FETCH_ASSOC));
        return json_encode($data->fetchall(PDO::FETCH_ASSOC));
    }
}
$api = new API();
header('Content-Type: application/json');
$temp = $api->Test();

// var_dump(json_decode($temp));
echo $temp;
?>