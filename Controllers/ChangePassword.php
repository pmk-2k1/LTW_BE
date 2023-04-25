<?php
require_once '..\config\database.php';

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: PUT");
header("Access-Control-Allow-Headers: Content-Disposition, Content-Type, Content-Length, Accept-Encoding");
header("Content-type:application/json");


$data = json_decode(file_get_contents("php://input"));
if($data == null){
    echo '{"isSuccess": false, "message": "Can not get data from UI"}';
    exit;
}

$db = new Database();

try {
    $user = $db->query("SELECT * FROM customer WHERE Phone_number = '$data->phoneNumber'");
    $dataUser = $user->fetch(PDO::FETCH_ASSOC);
    
    if($dataUser == false) {
        echo '{"isSuccess": false, "message": "Can not find user with phone number: "' .$data->phoneNumber. '}';
        exit;
    }

    $oldPass = md5($data->oldPassword);
    $checkPass = $db->query("SELECT * FROM customer WHERE Phone_number = '$data->phoneNumber' AND Password = '$oldPass'");
    $check = $checkPass->fetch(PDO::FETCH_ASSOC);
    
    if($check == false) {
        echo '{"isSuccess": false, "message": "Old password is not correct"}';
        exit;
    }

    $newPass = md5($data->newPassword);
    $sql = "UPDATE customer SET Password = '$newPass'
        WHERE Phone_number = '$data->phoneNumber'";

    $db->query($sql);
    echo '{"isSuccess": true, "message": "Chỉnh sửa thành công"}';
} catch (Exception $e) {
    echo '{"isSuccess": false, "message": "Error SQL: ' .$e->getMessage(). '"}';
}
?>