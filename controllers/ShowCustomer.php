<?php
require_once '..\config\database.php';

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: Content-Type');

class CustomerAPI {
    function Show() {
        $db = new Database();
        $sql = "SELECT * FROM customer";
        $data = $db->query($sql);
        // var_dump($data->fetchall(PDO::FETCH_ASSOC));
        return json_encode($data->fetchall(PDO::FETCH_ASSOC));
    }
}
$customer = new CustomerAPI();
header('Content-Type: application/json');
$temp = $customer->Show();

// var_dump(json_decode($temp));
echo $temp;
?>