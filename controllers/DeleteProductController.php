<?php
require_once '..\config\database.php';
require_once '..\models\Product.php';

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: GET POST DELETE");
header("Access-Control-Allow-Headers: Content-Disposition, Content-Type, Content-Length, Accept-Encoding");
header("Content-type:application/json");


$data = json_decode(file_get_contents("php://input"));

if($data == null){
    echo "{'Error':'Can not get data from UI'}";
    exit;
}
$name= $data->productName;

$db = new Database();
$query = "SELECT Id FROM product WHERE Name = '$name'";
$deleteCheck = $db->query($query);
$data_id =  $deleteCheck->fetch(PDO::FETCH_ASSOC);
if($data_id == false) {
    exit;
}
$id =  $data_id['Id'];
try{
    $sql = "DELETE FROM product WHERE Id = '$id'";
    $database = $db->query($sql);
}catch (Exception $e) {
    echo 'Error with: ' .$e->getMessage();
}

// echo json_encode($database->fetch(PDO::FETCH_ASSOC));
