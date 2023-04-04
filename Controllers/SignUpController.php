<?php
require_once '..\config\database.php';
include '..\Models\Customer.php';

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Disposition, Content-Type, Content-Length, Accept-Encoding");
header("Content-type:application/json");


$data = json_decode(file_get_contents("php://input"));

if($data == null){
    echo "{'Error':'Can not get data from UI'}";
    // echo json_encode($data);
    exit;
}

$customer = new Customer($data->id, $data->isActive, $data->name, $data->email, $data->password, $data->address, $data->phone_number,$data->gender, $data->role, $data->birthday);

$db = new Database();
$sql = "INSERT INTO customer(`Id`, `Is_active`, `Name`, `Phone_number`, `Email`, `Password`, `Gender`, `Role`, `Address`, `Birthday`)
VALUES ('$customer.getID()','[value-2]','[value-3]','[value-4]','[value-5]','[value-6]','[value-7]','[value-8]','[value-9]','[value-10]')";
$database = $db->query($sql);

// $success = count($database->fetchall(PDO::FETCH_ASSOC));
// echo $success? '{"IsLogin":"true"}': '{"IsLogin":"false"}';
echo json_encode($database->fetchall(PDO::FETCH_ASSOC));
?>