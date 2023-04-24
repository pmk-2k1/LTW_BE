<?php
require_once '..\config\database.php';

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Headers: Content-Disposition, Content-Type, Content-Length, Accept-Encoding");
header("Content-type:application/json");


$data = json_decode(file_get_contents("php://input"));

$db = new Database();

$sql = "SELECT * FROM customer";
if ($data != null) {
    $sql .= " WHERE Phone_number = " . $data->phoneNumber;
}

try {
    $database = $db->query($sql);
    $loginUser = $database->fetchAll(PDO::FETCH_ASSOC);

    if ($loginUser == true) {
        echo '{"isSuccess": true, "message": "Thành công", "data": ' . json_encode($loginUser) . '}';
    } else {
        echo '{"isSuccess": false, "message": "Số điện thoại không hợp lệ"}';
    }
} catch (Exception $e) {
    echo '{"isSuccess": false, "message": "Error SQL: ' . $e->getMessage() . '"}';
}
?>