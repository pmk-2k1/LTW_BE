<?php
require_once '..\config\database.php';

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: DELETE");
header("Access-Control-Allow-Headers: Content-Disposition, Content-Type, Content-Length, Accept-Encoding");
header("Content-type:application/json");


$data = json_decode(file_get_contents("php://input"));

if ($data == null) {
    echo "{'Error':'Can not get data from UI'}";
    exit;
}
$email = $data->email;
$phone = $data->phone_number;

$db = new Database();
$query = "SELECT *FROM customer WHERE Email = '$email' OR Phone_number = '$phone'";
$queryCheck = $db->query($query);
$user =  $queryCheck->fetch(PDO::FETCH_ASSOC);
if ($user == false) {
    echo '{"isSuccess": "false", "error": "Can not find user with email or phone number: '.(($email == "") ? $phone : $email).'"}';
    exit;
}
$sql = "DELETE FROM customer WHERE email = '$email' OR phone_number = '$phone'";
$deleteCheck = $db->query($sql);
$deleteUser =  $deleteCheck->fetch(PDO::FETCH_ASSOC);
if($deleteUser==false){
    echo '{"isSuccess": "true", "error": null}';
}
// $user =  $deleteCheck->fetch(PDO::FETCH_ASSOC);
// if($deleteCheck == false)

// $query = "SELECT Id FROM customer WHERE email = '$email'";
// $deleteCheck = $db->query($query);
// // if(!$deleteCheck){
// //     echo "{'isSuccsee':'}"
// // }
// $data_id =  $deleteCheck->fetch(PDO::FETCH_ASSOC);
// if($data_id == false) {
//     exit;
// }
// $id =  $data_id['Id'];
// try{
//     $sql = "DELETE FROM customer WHERE Id = '$id'";
//     $database = $db->query($sql);
// }catch (Exception $e) {
//     echo 'Error with: ' .$e->getMessage();
// }
