<?php
require_once '..\config\database.php';

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Headers: Content-Disposition, Content-Type, Content-Length, Accept-Encoding");
header('Content-Type: image/jpeg');

$data = json_decode(file_get_contents("php://input"));
if ($data == null) {
    header("Content-type:application/json");
    echo '{"isSuccess": false, "message": "Can not get data from UI"}';
    exit;
}

$db = new Database();
$sql = "SELECT `Content` FROM image WHERE ProductID = '" . $data->productID . "'";

try {
    $database = $db->query($sql);
    $image = $database->fetchAll(PDO::FETCH_ASSOC);
    
    if ($image == true) {
        echo json_encode($image);
    }
    else
    {
        header("Content-type:application/json");
        echo '{"isSuccess": false, "message": "Không có ảnh cho sản phẩm"}';
    }
} catch (Exception $e) {
    header("Content-type:application/json");
    echo '{"isSuccess": false, "message": "Error SQL: ' . $e->getMessage() . '"}';
}
?>