<?php
require_once '..\config\database.php';

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Headers: Content-Disposition, Content-Type, Content-Length, Accept-Encoding");
header("Content-type: application/json");

$data = json_decode(file_get_contents("php://input"));
$db = new Database();

$sql = "SELECT * FROM product";
if ($data != null) {
    $sql .= " WHERE Type = '" . $data->type . "'";
}

try {
    $database = $db->query($sql);
    $product = $database->fetchAll(PDO::FETCH_ASSOC);

    if ($product == true) {
        $product['image'] = array("abcv", "asdf");
        echo '{"isSuccess": true, "message": "Thành công", "data": ' . json_encode($product) . '}';
    } else {
        echo '{"isSuccess": false, "message": "Hết hàng"}';
    }
} catch (Exception $e) {
    echo '{"isSuccess": false, "message": "Error SQL: ' . $e->getMessage() . '"}';
}
?>