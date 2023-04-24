<?php
require_once '..\config\database.php';
require_once '..\models\Voucher.php';

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Disposition, Content-Type, Content-Length, Accept-Encoding");
header("Content-type:application/json");

$data = json_decode(file_get_contents("php://input"));
if($data == null){
    echo "{'Error':'Can not get data from UI'}";
    exit;
}

$voucher = new Voucher($data->voucherIsActive, $data->voucherPercent, $data->voucherStartDate, $data->voucherEndDate);
$voucherData = $voucher->returnVoucherArray();
$db = new Database();
function getGUID(){
    if (function_exists('com_create_guid')){
        return trim(com_create_guid(), '{}');
    }else{
        mt_srand((double)microtime()*10000);
        $charid = strtoupper(md5(uniqid(rand(), true)));
        $hyphen = chr(45);
        $uuid = substr($charid, 0, 8).$hyphen
            .substr($charid, 8, 4).$hyphen
            .substr($charid,12, 4).$hyphen
            .substr($charid,16, 4).$hyphen
            .substr($charid,20,12);
        return $uuid;
    }
}

while (true)
{
    $GUID = getGUID();
    $query = "SELECT * FROM voucher WHERE Id = '$GUID'";
    $voucherCheck = $db->query($query);
    if ($voucherCheck != false)
        break;
}

$voucherData['voucherId'] = $GUID;

try {
    $db->query("INSERT INTO voucher(Id, Is_active, Percent, Start_date, End_date)
    VALUES ('".$voucherData['voucherId']."','".$voucherData['voucherIsActive']."','".$voucherData['voucherPercent']."','".$voucherData['voucherStartDate']."',
    '".$voucherData['voucherEndDate']."')");
    echo json_encode($voucherData);
} catch (Exception $e) {
    echo 'Error with: ' .$e->getMessage();
}

?>