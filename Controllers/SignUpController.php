<?php
require_once '..\config\database.php';
require_once '..\models\Customer.php';
require_once '..\Common\Utils\helper.php';

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Disposition, Content-Type, Content-Length, Accept-Encoding");
header("Content-type:application/json");

$data = json_decode(file_get_contents("php://input"));
if ($data == null) {
    echo '{"isSuccess": false, "message": "Can not get data from UI"}';
    exit;
}

$customer = new Customer($data->name, $data->phoneNumber, md5($data->password), $data->address);
$customerData = $customer->returnCustomerArray();

$db = new Database();
if(count($data->phoneNumber) > 0 && $data->phoneNumber[0] != '0'){
    $data->phoneNumber = "0" + $data->phoneNumber;
}

try {
    $query = "SELECT * FROM customer WHERE Phone_number = '$data->phoneNumber'";
    $customerCheck = $db->query($query);
    if (count($customerCheck->fetchAll(PDO::FETCH_ASSOC)) > 0) {
        echo '{"isSuccess": false, "message": "Số điện thoại đã đăng kí"}';
        exit;
    }
    
    $customerData['id'] = generate_uuid();

    $db->query("INSERT INTO customer(Id, Name, Phone_number, Password, Address)
    VALUES ('" . $customerData['id'] . "','" .$customerData['name']. "','" .$customerData['phoneNumber']. "','" .$customerData['password']. "','" .$customerData['address']."')");
    echo '{"isSuccess": true, "message": "Đăng kí thành công"}';
} catch (Exception $e) {
    echo '{"isSuccess": false , "message": "Error SQL: '.$e->getMessage().'"}';
}