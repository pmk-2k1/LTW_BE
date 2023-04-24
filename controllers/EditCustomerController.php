<?php

require_once '..\config\database.php';
require_once '..\models\Customer.php';

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: PUT");
header("Access-Control-Allow-Headers: Content-Disposition, Content-Type, Content-Length, Accept-Encoding");
header("Content-type:application/json");


$data = json_decode(file_get_contents("php://input"));
if($data == null){
    echo '{"isSuccess": "true", "message": "Can not get data from UI"}';
    exit;
}

$db = new Database();
try {
    $select_id = $db->query("SELECT * FROM customer WHERE Id = '$data->id'");
    $data_id = $select_id->fetch(PDO::FETCH_ASSOC);
    if($data_id == false) {
        echo '{"isSuccess": "false", "message": "Can not find user with id: "' .$data->id. '}';
        exit;
    }
    
    $sql = "UPDATE customer SET Is_active = '$data->isActive', Name = '$data->name', Phone_number = '$data->phoneNumber', Email = '$data->email', Gender = '$data->gender',
        Role = '$data->role', Address = '$data->address', Birthday = '$data->birthday'
        WHERE Id = '$data->id'";

    $db->query($sql);
    echo '{"isSuccess": "true", "message": "Chỉnh sửa thành công"}';
} catch (Exception $e) {
    echo '{"isSuccess": "false", "message": "Error SQL: ' .$e->getMessage(). '"}';
}
?>