<?php
require_once '..\config\database.php';
require_once '..\Common\Utils\helper.php';

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Disposition, Content-Type, Content-Length, Accept-Encoding");
header("Content-type: application/json");

$data = json_decode(file_get_contents("php://input"));
if ($data == null) {
    echo '{"isSuccess": false, "message": "Can not get data from UI"}';
    exit;
}

$db = new Database();

try {
    $query = "SELECT * FROM product WHERE Type = '$data->type' AND Name = '$data->name'";
    $productCheck = $db->query($query);
    $productID = $productCheck->fetchAll(PDO::FETCH_ASSOC);
    if (count($productID) == 0) {
        echo '{"isSuccess": false, "message": "Sản phẩm không tồn tại"}';
        exit;
    }

    $db->query("INSERT INTO image(Id, Content, ProductID)
    VALUES ('" .generate_uuid(). "','" .$data->image. "','" .$productID[0]['Id']. "')");
    echo '{"isSuccess": true, "message": "Thêm sản phẩm thành công"}';
} catch (Exception $e) {
    echo '{"isSuccess": false , "message": "Error SQL: '.$e->getMessage().'"}';
}
?>