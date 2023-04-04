<?php
require_once '..\config\database.php';

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Disposition, Content-Type, Content-Length, Accept-Encoding");
header("Content-type:application/json");


$data = json_decode(file_get_contents("php://input"));

if($data == null){
    echo "{'Error':'Can not get data from UI'}";
    // echo json_encode($data);
    exit;
}

$email =  $data->email;
$password = $data->password;

$db = new Database();
$sql = "SELECT * FROM customer WHERE email = '$email' AND password = '$password'";
$database = $db->query($sql);

$success = count($database->fetchall(PDO::FETCH_ASSOC));
echo $success? '{"IsLogin":"true"}': '{"IsLogin":"false"}';
?>