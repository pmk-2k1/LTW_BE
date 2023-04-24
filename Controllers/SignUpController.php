<?php
require_once '..\config\database.php';
require_once '..\models\Customer.php';

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Disposition, Content-Type, Content-Length, Accept-Encoding");
header("Content-type:application/json");

$data = json_decode(file_get_contents("php://input"));
if ($data == null) {
    echo "{'Error':'Can not get data from UI'}";
    exit;
}
$customer = new Customer($data->name, $data->phone_number, md5($data->password), $data->address);
$customerData = $customer->returnCustomerArray();
$db = new Database();
if($data->phone_number[0]!='0'){
    $data->phone_number = "0" + $data->phone_number;
}

$query = "SELECT * FROM customer WHERE Phone_number = '$data->phone_number'";
$customerCheck = $db->query($query);
if (count($customerCheck->fetchAll(PDO::FETCH_ASSOC)) > 0) {
    echo '{"isSuccess": false, "message": "Số điện thoại đã đăng kí"}';
    exit;
}
$customerData['id'] = uniqid($data->phone_number);

try {
    $db->query("INSERT INTO customer(Id, Name, Phone_number, Password, Address)
    VALUES ('" . $customerData['id'] . "','" .$customerData['name']. "','" .$customerData['phone_number']. "','" .$customerData['password']. "','" .$customerData['address']."')");
    echo '{"isSuccess": true,"message": "Đăng kí thành công"}';
} catch (Exception $e) {
    echo '{"isSuccess": false , "message": "Error with:  '.$e->getMessage().'"}';
}