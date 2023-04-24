<?php
require_once '..\config\database.php';
require_once '..\models\Product.php';
require_once '..\Common\Utils\helper.php';

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Disposition, Content-Type, Content-Length, Accept-Encoding");
header("Content-type:application/json");

$data = json_decode(file_get_contents("php://input"));
if ($data == null) {
    echo '{"isSuccess": false, "message": "Can not get data from UI"}';
    exit;
}

$db = new Database();

try {
    $product = new Product(generate_uuid(), $data->isActive, $data->name, $data->type, $data->price, $data->quantity, $data->description);
    $productData = $product->returnProductArray();

    $query = "SELECT * FROM product WHERE Type = '$productData[productType]' AND Name = '$productData[productName]'";
    $productCheck = $db->query($query);
    if (count($productCheck->fetchAll(PDO::FETCH_ASSOC)) > 0) {
        echo '{"isSuccess": false, "message": "Sản phẩm thêm vào đã tồn tại"}';
        exit;
    }

    $db->query("INSERT INTO product(Id, Is_active, Name, Type, Price, Quantity, Description)
    VALUES ('" .$productData['productId']. "','" .$productData['productIsActive']. "','" .$productData['productName']. "','" .$productData['productType']. "','"
    .$productData['productPrice']. "','" .$productData['productQuantity']. "','" .$productData['productDescription']. "')");
    echo '{"isSuccess": true, "message": "Thêm sản phẩm thành công"}';
} catch (Exception $e) {
    echo '{"isSuccess": false , "message": "Error SQL: '.$e->getMessage().'"}';
}