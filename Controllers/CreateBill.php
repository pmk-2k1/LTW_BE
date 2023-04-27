<?php
require_once '..\config\database.php';
require_once '..\models\Bill.php';
require_once '..\Common\Utils\helper.php';

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Disposition, Content-Type, Content-Length, Accept-Encoding");
header("Content-type: application/json");

$data = json_decode(file_get_contents("php://input"));
if ($data == null) {
    echo '{"isSuccess": false, "message": "Can not get data from UI"}';
    exit;
}

$db = new Database();

try {
    $datetime = new DateTime('now', new DateTimeZone('UTC'));
    $bill = new Bill(generate_uuid(), $data->status, $data->total, $datetime->format('Y-m-d H:i:s'), $data->method, $data->note, $data->customerID);
    $billData = $bill->returnBillArray();

    $query = "SELECT * FROM customer WHERE Id = '" .$billData['customerID']. "'";
    $customerCheck = $db->query($query);
    
    if (count($customerCheck->fetchAll(PDO::FETCH_ASSOC)) == 0) {
        echo '{"isSuccess": false, "message": "Người dùng không tồn tại"}';
        exit;
    }

    // $db->query("INSERT INTO customer(Id, Name, Phone_number, Password, Address)
    // VALUES ('" . $billData['id'] . "','" .$billData['name']. "','" .$billData['phoneNumber']. "','" .$billData['password']. "','" .$billData['address']."')");
    // echo '{"isSuccess": true, "message": "Đăng kí thành công"}';
} catch (Exception $e) {
    echo '{"isSuccess": false , "message": "Error SQL: '.$e->getMessage().'"}';
}