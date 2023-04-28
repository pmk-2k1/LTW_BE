<?php
require_once '..\config\database.php';

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: DELETE");
header("Access-Control-Allow-Headers: Content-Disposition, Content-Type, Content-Length, Accept-Encoding");
header("Content-type:application/json");


$data = json_decode(file_get_contents("php://input"));

if ($data == null) {
    echo '{"isSuccess": false, "message": "Can not get data from UI"}';
    exit;
}

$db = new Database();

try {
    $query = "SELECT *FROM customer WHERE Id = '$data->id'";
    $queryCheck = $db->query($query);
    $user = $queryCheck->fetch(PDO::FETCH_ASSOC);
    if ($user == false) {
        echo '{"isSuccess": "false", "message": "Can not find user with ID: ' . $data->id . '"}';
        exit;
    }
    $sql = "DELETE FROM customer WHERE Id = '$data->id'";
    $deleteCheck = $db->query($sql);
    $deleteUser = $deleteCheck->fetch(PDO::FETCH_ASSOC);
    if ($deleteUser == false) {
        echo '{"isSuccess": "true", "message": "Xóa thành công"}';
    }

} catch (Exception $e) {
    echo '{"isSuccess": false , "message": "Error SQL: ' . $e->getMessage() . '"}';
}
?>