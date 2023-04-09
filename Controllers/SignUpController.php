<?php
require_once '..\config\database.php';
require_once '..\models\Customer.php';

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Disposition, Content-Type, Content-Length, Accept-Encoding");
header("Content-type:application/json");

$data = json_decode(file_get_contents("php://input"));
if($data == null){
    echo "{'Error':'Can not get data from UI'}";
    exit;
}
$customer = new Customer( $data->isActive, $data->name, $data->phone_number, $data->email, md5($data->password), $data->gender, $data->role, $data->address, $data->birthday);
$customerData =$customer->returnCustomerArray();
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
    $query = "SELECT * FROM customer WHERE Id = '$GUID'";
    $customerCheck = $db->query($query);
    if ($customerCheck != false)
        break;
}

$customerData['id'] = $GUID;

try {
    $user = $db->query("INSERT INTO customer(Id, Is_active, Name, Phone_number, Email, Password, Gender, Role, Address, Birthday)
    VALUES ('".$customerData['id']."','".$customerData['is_active']."','".$customerData['name']."','".$customerData['phone_number']."','".$customerData['email']."',
            '".$customerData['password']."','".$customerData['gender']."','".$customerData['role']."','".$customerData['address']."','".$customerData['birthday']."')");

    echo json_encode($customerData);
} catch (Exception $e) {
    echo 'Error with: ' .$e->getMessage();
}

// $success = count($customerCheck->fetchall(PDO::FETCH_ASSOC));
// if($success==0){
//     if($signUpCusstomer->execute()){
//         echo json_encode($signUpCusstomer->fetchall(PDO::FETCH_ASSOC));
//         echo "New record created successfully!!!!";
//     } else {
//         echo "Unable to create record";
//     }
// }else {
//     exit;
// }
?>