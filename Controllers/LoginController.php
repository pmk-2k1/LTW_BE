<?php
require_once '..\config\database.php';

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Disposition, Content-Type, Content-Length, Accept-Encoding");
header("Content-type:application/json");


$data = json_decode(file_get_contents("php://input"));

if($data == null){
    echo '{"isSuccess": false, "message": "Can not get data from UI"}';
    exit;
}

$phoneNumber =  $data->phoneNumber;
$password = md5($data->password);

$db = new Database();
$sql = "SELECT * FROM customer WHERE Phone_number = '$phoneNumber' AND password = '$password'";
try {
    $database = $db->query($sql);
    $loginUser = $database->fetch(PDO::FETCH_ASSOC);
    
    if($loginUser == true){
        echo '{"isSuccess": true, "message": "Thành công", "data": ' .json_encode($loginUser). '}';
    }
    else{
        echo '{"isSuccess": false, "message": "Số điện thoại hoặc mật khẩu không hợp lệ"}';
    }
} catch (Exception $e) {
    echo '{"isSuccess": false, "message": "Can not find user with id: ' .$e->getMessage(). '"}';
}
?>