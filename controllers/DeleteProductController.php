<?php
require_once '..\config\database.php';

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: DELETE");
header("Access-Control-Allow-Headers: Content-Disposition, Content-Type, Content-Length, Accept-Encoding");
header("Content-type:application/json");


$data = json_decode(file_get_contents("php://input"));

if($data == null){
    echo "{'Error':'Can not get data from UI'}";
    exit;
}
$db = new Database();

$select_id = $db->query("SELECT * FROM product WHERE id = '$data->productId'");
$data_id = $select_id->fetch(PDO::FETCH_ASSOC);
if($data_id == false) {
    echo '{"isSuccess": "false", "error": "Can not find user with id: '.$data->productId.'"}';
    exit;
}
try{
    $sql = "DELETE FROM product WHERE Id = '$data->productId'";
    $deleteProduct = $db->query($sql);
    // $delete = $deleteProduct->fetch(PDO::FETCH_ASSOC);
    echo '{"isSuccess": "true", "error": null}';
}catch(Exception $e){
    echo '{"isSuccess": "false", "error": "Can not find user with id: '.$e->getMessage().'"}';
}