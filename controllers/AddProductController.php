<?php
require_once '..\config\database.php';
require_once '..\models\Product.php';

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Disposition, Content-Type, Content-Length, Accept-Encoding");
header("Content-type:application/json");

$data = json_decode(file_get_contents("php://input"));
if($data == null){
    echo "{'Error':'Can not get data from UI'}";
    exit;
}

$product = new Product($data->productIsActive, $data->productName, $data->productType, $data->productPrice, $data->productQuantity, $data->productDescription);
$productData = $product->returnProductArray();
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
    $query = "SELECT * FROM product WHERE Id = '$GUID'";
    $productCheck = $db->query($query);
    if ($productCheck != false)
        break;
}

$productData['productId'] = $GUID;

try {
    $db->query("INSERT INTO product(Id, Is_active, Name, Type, Price, Quantity, Description)
    VALUES ('".$productData['productId']."','".$productData['productIsActive']."','".$productData['productName']."','".$productData['productType']."','".$productData['productPrice']."',
            '".$productData['productQuantity']."','".$productData['productDescription']."')");

    echo json_encode($productData);
} catch (Exception $e) {
    echo 'Error with: ' .$e->getMessage();
}

?>