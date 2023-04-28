<?php
require_once '..\config\database.php';

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: DELETE");
header("Access-Control-Allow-Headers: Content-Disposition, Content-Type, Content-Length, Accept-Encoding");
header("Content-type:application/json");


$data = json_decode(file_get_contents("php://input"));

if($data == null){
    echo '{"isSuccess": false, "message": "Can not get data from UI"}';
    exit;
}
$db = new Database();

try{
    $select_id = $db->query("SELECT * FROM product WHERE Id = '$data->productId'");
    $data_id = $select_id->fetch(PDO::FETCH_ASSOC);
    if($data_id == false) {
        echo '{"isSuccess": false, "message": "Can not find product with id: '.$data->productId.'"}';
        exit;
    }

    $sql = "DELETE FROM product WHERE Id = '$data->productId'";
    $deleteProduct = $db->query($sql);
    echo '{"isSuccess": true, "message": "Xóa sản phẩm thành công"}';
}catch(Exception $e){
    echo '{"isSuccess": false, "message": "Error SQL: '.$e->getMessage().'"}';
}