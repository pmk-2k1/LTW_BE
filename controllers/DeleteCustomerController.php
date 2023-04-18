<?php
require_once '..\Config\database.php';

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: DELETE");
header("Access-Control-Allow-Headers: Content-Disposition, Content-Type, Content-Length, Accept-Encoding");
header("Content-type:application/json");


$data = json_decode(file_get_contents("php://input"));

if($data == null){
    echo '{"Error":"Can not get data from UI"}';
    exit;
}
$email = $data->email;

$db = new Database();
$query = "SELECT id FROM customer WHERE email = '$email'";
try {
    $deleteCheck = $db->query($query);
    $data_id =  $deleteCheck->fetch(PDO::FETCH_ASSOC);
    $id = $data_id['id'];
    $sql = "DELETE FROM customer WHERE Id = '$id'";
    $database = $db->query($sql);
    echo '{"IsSucces":"true", "Error":"null"}';
} catch (Exception $e) {
    echo '{"IsSucces":"false", "Error":"' .$e->getMessage(). '"}';
}