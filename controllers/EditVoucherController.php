<?php

require_once '..\config\database.php';
// require_once '..\models\Voucher.php';

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: PUT");
header("Access-Control-Allow-Headers: Content-Disposition, Content-Type, Content-Length, Accept-Encoding");
header("Content-type:application/json");


$data = json_decode(file_get_contents("php://input"));
if($data == null){
    echo "{'Error':'Can not get data from UI'}";
    exit;
}

$db = new Database();

$check_id = $db->query("SELECT * FROM voucher WHERE Id = '$data->voucherId'");
$data_id = $check_id->fetch(PDO::FETCH_ASSOC);
if($data_id == false) {
    echo '{"isSuccess": "false", "error": "Can not find user with id: "' .$data->Id. '}';
    exit;
}
try {
    $sql = "UPDATE voucher SET Is_active = '$data->voucherIsActive', Percent = '$data->voucherPercent', Start_date = '$data->voucherStartDate', End_date = '$data->voucherEndDate'
        WHERE Id = '$data->voucherId'";

    $db->query($sql);
    echo '{"isSuccess": "true", "error": "null"}';
} catch (Exception $e) {
    echo '{"isSuccess": "false", "error": "Can not find user with id: ' .$e->getMessage(). '"}';
}
?>