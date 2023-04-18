<?php

require_once '..\config\database.php';
require_once '..\models\Customer.php';

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: PUT");
header("Access-Control-Allow-Headers: Content-Disposition, Content-Type, Content-Length, Accept-Encoding");
header("Content-type:application/json");


$data = json_decode(file_get_contents("php://input"));
if($data == null){
    echo "{'Error':'Can not get data from UI'}";
    exit;
}

$db = new Database();

$select_id = $db->query("SELECT * FROM customer WHERE id = '$data->id'");
$data_id = $select_id->fetch(PDO::FETCH_ASSOC);
if($data_id == false) {
    echo '{"isSuccess": "false", "error": "Can not find user with id: "' .$data->id. '}';
    exit;
}
try {
    $sql = "UPDATE customer SET Is_active = '$data->isActive', Name = '$data->name', Phone_numbner = '$data->phoneNumber', Email = '$data->email', Gender = '$data->gender',
        Role = '$data->role', Address = '$data->address', Birthday = '$data->birthday'";

    $db->query($sql);
} catch (Exception $e) {
    echo '{"isSuccess": "false", "error": "Can not find user with id: "' .$e->getMessage(). '}';
}
?>