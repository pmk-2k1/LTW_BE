<?php

require_once '..\config\database.php';
require_once '..\models\Customer.php';

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: PUT");
header("Access-Control-Allow-Headers: Content-Disposition, Content-Type, Content-Length, Accept-Encoding");
header("Content-type:application/json");


$data = json_decode(file_get_contents("php://input"));
if($data == null){
    echo "{'Error':'Can not get data from UI'}";
    exit;
}
// $customer = new Customer( $data->isActive, $data->name, $data->phone_number, $data->email, md5($data->password), $data->gender, $data->role, $data->address, $data->birthday);
// $customerData =$customer->returnCustomerArray();
$email = $data->email;
$db = new Database();

$select_id = $db->query("SELECT * FROM customer WHERE email = '$email'");
$data_id = $select_id->fetch(PDO::FETCH_ASSOC);
if($data_id == false) {
    exit;
}
// $id = $data_id["Id"];
$id = $data_id["Id"];
$isActive = $data_id["Is_active"];
$name = $data_id["Name"];
$phone_number = $data_id["Phone_number"];
$email = $data_id["Email"];
$password = $data_id["Password"];
$gender = $data_id["Gender"];
$role = $data_id["Role"];
$address = $data_id["Address"];
$birthday = $data_id["Birthday"];
// echo $isActive;
// echo "\n";
// echo $name;
// echo "\n";
// echo $phone_number;echo "\n";
// echo $email;echo "\n";
// echo $password;echo "\n";
// echo $gender;echo "\n";
// echo $role;echo "\n";
// echo $address;echo "\n";
// echo $birthday;echo "\n";


// // try {
    $sql = "UPDATE customer SET "

//     echo json_encode($customerData);
// // } catch (Exception $e) {
// //     echo 'Error with: ' .$e->getMessage();
// // }
?>