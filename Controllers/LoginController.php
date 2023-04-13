<?php
require_once '..\config\database.php';

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Disposition, Content-Type, Content-Length, Accept-Encoding");
header("Content-type:application/json");


$data = json_decode(file_get_contents("php://input"));

if($data == null){
    echo "{'Error':'Can not get data from UI'}";
    exit;
}

$email =  $data->email;
$password = md5($data->password);

$db = new Database();
$sql = "SELECT * FROM customer WHERE email = '$email' AND password = '$password'";
$database = $db->query($sql);

echo json_encode($database->fetch(PDO::FETCH_ASSOC));
?>