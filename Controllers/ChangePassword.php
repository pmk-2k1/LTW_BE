<?php
require_once '..\config\database.php';

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

try {
    $user = $db->query("SELECT * FROM customer WHERE Phone_number = '$data->phoneNumber'");
    $dataUser = $user->fetch(PDO::FETCH_ASSOC);
    
    if($dataUser == false) {
        echo '{"isSuccess": "false", "message": "Can not find user with phone number: "' .$data->phoneNumber. '}';
        exit;
    }

    $newPass = md5($data->password);
    $sql = "UPDATE customer SET Password = '$newPass'
        WHERE Phone_number = '$data->phoneNumber'";

    $db->query($sql);
    echo '{"isSuccess": "true", "message": "Chỉnh sửa thành công"}';
} catch (Exception $e) {
    echo '{"isSuccess": "false", "message": "Error SQL: ' .$e->getMessage(). '"}';
}
?>